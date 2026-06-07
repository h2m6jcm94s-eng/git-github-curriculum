#!/usr/bin/env python3
"""
Curriculum answer validator.
Scans all lesson directories, validates ANSWERS.md content,
runs hands-on checks in temporary sandboxes, and produces a JSON report.
"""

import json
import os
import re
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path

import checks

AREAS = [
    "01-git",
    "02-github",
    "03-git-and-github",
    "04-github-cli",
    "05-ci-cd-and-automation",
]

REPORT_PATH = "validation-report.json"

# Minimum word counts for conceptual answers
MIN_WORDS_NORMAL = 10
MIN_WORDS_TRICKY = 10
MIN_WORDS_REFLECTION = 5


def find_lessons():
    """Return sorted list of lesson directory paths."""
    lessons = []
    base = Path(".")
    for area in AREAS:
        area_path = base / area
        if not area_path.exists():
            continue
        for submodule in sorted(area_path.iterdir()):
            if not submodule.is_dir():
                continue
            for lesson in sorted(submodule.iterdir()):
                if lesson.is_dir() and (lesson / "README.md").exists():
                    lessons.append(str(lesson))
    return sorted(lessons)


def changed_lesson_paths():
    """
    In a PR context (GITHUB_BASE_REF set), return the set of lesson dirs touched
    by the PR. Outside CI (no base ref), return None to validate every lesson.
    """
    base_ref = os.environ.get("GITHUB_BASE_REF")
    if not base_ref:
        return None  # local run: validate everything

    result = subprocess.run(
        ["git", "diff", "--name-only", f"origin/{base_ref}...HEAD"],
        capture_output=True,
        text=True,
    )
    if result.returncode != 0:
        # Diff failed (e.g. shallow clone) — fall back to validating everything
        return None

    lessons = set()
    for changed in result.stdout.split():
        parts = changed.split("/")
        # area/submodule/lesson/<file>
        if len(parts) >= 4 and parts[0] in AREAS:
            lessons.add("/".join(parts[:3]))
    return lessons


def extract_after_marker(content, marker):
    """Extract text after a marker until next '---' or section header or end of file."""
    pattern = re.compile(
        re.escape(marker) + r"[:\s]*\n(.*?)(?=\n## |\nYOUR_|\n---\s*\n|$)",
        re.DOTALL | re.IGNORECASE,
    )
    match = pattern.search(content)
    if not match:
        return ""
    return match.group(1).strip()


def parse_answers(answers_path):
    """Parse ANSWERS.md and return dict of student responses."""
    if not answers_path.exists():
        return None
    content = answers_path.read_text(encoding="utf-8")

    return {
        "normal": extract_after_marker(content, "YOUR_ANSWER_NORMAL"),
        "tricky": extract_after_marker(content, "YOUR_ANSWER_TRICKY"),
        "commands": extract_after_marker(content, "YOUR_COMMANDS"),
        "reflection": extract_after_marker(content, "YOUR_REFLECTION"),
    }


def strip_comments(text):
    """Remove HTML comments so placeholder instructions don't count as answers."""
    return re.sub(r"<!--.*?-->", "", text, flags=re.DOTALL)


def count_words(text):
    return len(strip_comments(text).split())


def load_config():
    """Load lesson validation config from tests/config.yml if present."""
    config_path = Path(__file__).parent / "config.yml"
    if not config_path.exists():
        return {}
    try:
        import yaml
        with open(config_path) as f:
            return yaml.safe_load(f) or {}
    except ImportError:
        # Fallback: try JSON
        json_path = Path(__file__).parent / "config.json"
        if json_path.exists():
            with open(json_path) as f:
                return json.load(f)
        return {}


def validate_hands_on(lesson_path, commands_text, lesson_config):
    """
    Run setup.sh in a temp directory, execute student's commands,
    then run configured state checks.
    """
    errors = []
    setup_sh = Path(lesson_path) / "setup.sh"
    if not setup_sh.exists():
        return errors  # nothing to validate hands-on

    with tempfile.TemporaryDirectory() as tmpdir:
        lesson_copy = Path(tmpdir) / "lesson"
        # Copy lesson excluding any existing sandbox
        shutil.copytree(
            lesson_path,
            lesson_copy,
            ignore=shutil.ignore_patterns("sandbox", ".git"),
        )

        # Run setup.sh
        result = subprocess.run(
            ["bash", "setup.sh"],
            cwd=lesson_copy,
            capture_output=True,
            text=True,
        )
        if result.returncode != 0:
            errors.append(f"setup.sh failed: {result.stderr[:300]}")
            return errors

        sandbox = lesson_copy / "sandbox"
        if not sandbox.exists():
            errors.append("sandbox/ not created by setup.sh")
            return errors

        # Run student's commands (strip HTML comments first)
        clean_commands = strip_comments(commands_text)
        for raw_line in clean_commands.splitlines():
            line = raw_line.strip()
            if not line or line.startswith("#"):
                continue
            # Safety: block obviously dangerous commands
            lowered = line.lower()
            if any(bad in lowered for bad in ["rm -rf /", ":(){" , "dd if=/dev/zero", "> /dev/sda"]):
                errors.append(f"Blocked dangerous command: {line}")
                continue

            subprocess.run(
                line,
                cwd=sandbox,
                shell=True,
                capture_output=True,
                text=True,
            )
            # Individual command failures are ignored; we check final state

        # Run configured checks
        check_specs = lesson_config.get("checks", [])
        if not check_specs:
            # Generic fallback: working tree should be clean if commands were run
            res = checks.check_no_uncommitted_changes(str(sandbox))
            if not res["passed"]:
                errors.append(res["message"])
            return errors

        for spec in check_specs:
            res = checks.run_check(str(sandbox), spec)
            if not res["passed"]:
                errors.append(res["message"])

    return errors


def validate_lesson(lesson_path, config):
    """Validate a single lesson and return result dict."""
    errors = []
    lesson_path = Path(lesson_path)
    rel_path = str(lesson_path)
    lesson_config = config.get(rel_path, {})
    has_setup = (lesson_path / "setup.sh").exists()

    answers_path = lesson_path / "ANSWERS.md"
    if not answers_path.exists():
        errors.append("ANSWERS.md not found")
        return {"path": rel_path, "passed": False, "errors": errors}

    answers = parse_answers(answers_path)
    if answers is None:
        errors.append("Could not parse ANSWERS.md")
        return {"path": rel_path, "passed": False, "errors": errors}

    # Conceptual checks
    if count_words(answers["normal"]) < MIN_WORDS_NORMAL:
        errors.append(
            f"Normal answer too short ({count_words(answers['normal'])} words, min {MIN_WORDS_NORMAL})"
        )

    if count_words(answers["tricky"]) < MIN_WORDS_TRICKY:
        errors.append(
            f"Tricky answer too short ({count_words(answers['tricky'])} words, min {MIN_WORDS_TRICKY})"
        )

    if count_words(answers["reflection"]) < MIN_WORDS_REFLECTION:
        errors.append(
            f"Reflection too short ({count_words(answers['reflection'])} words, min {MIN_WORDS_REFLECTION})"
        )

    # Hands-on checks
    if has_setup:
        if not answers["commands"] or count_words(answers["commands"]) < 2:
            errors.append("Hands-on commands missing or too short")
        else:
            hands_on_errors = validate_hands_on(rel_path, answers["commands"], lesson_config)
            errors.extend(hands_on_errors)

    return {"path": rel_path, "passed": len(errors) == 0, "errors": errors}


def main():
    lessons = find_lessons()
    config = load_config()

    # In a PR, validate only the lessons the PR touched.
    changed = changed_lesson_paths()
    if changed is not None:
        lessons = [l for l in lessons if l in changed]
        print(f"PR mode: {len(lessons)} changed lesson(s) to validate.")

    results = []
    passed = 0
    failed = 0

    print(f"Found {len(lessons)} lessons. Validating...\n")

    for lesson in lessons:
        result = validate_lesson(lesson, config)
        results.append(result)
        if result["passed"]:
            passed += 1
            print(f"✅ {result['path']}")
        else:
            failed += 1
            print(f"❌ {result['path']}")
            for err in result["errors"]:
                print(f"   → {err}")

    summary = {
        "summary": {"total": len(results), "passed": passed, "failed": failed},
        "lessons": results,
    }

    with open(REPORT_PATH, "w") as f:
        json.dump(summary, f, indent=2)

    print(f"\n{'='*50}")
    print(f"Total: {len(results)} | ✅ {passed} | ❌ {failed}")
    print(f"Report written to {REPORT_PATH}")

    sys.exit(0 if failed == 0 else 1)


if __name__ == "__main__":
    main()

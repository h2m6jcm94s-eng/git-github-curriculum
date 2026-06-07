#!/usr/bin/env python3
"""
Generate ANSWERS.md templates for every lesson by reading existing README.md files.
"""

import os
import re
from pathlib import Path

AREAS = [
    "01-git",
    "02-github",
    "03-git-and-github",
    "04-github-cli",
    "05-ci-cd-and-automation",
]


def find_lessons():
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
                    lessons.append(lesson)
    return sorted(lessons)


def extract_questions(readme_text):
    """Extract normal and tricky question text from README.md."""
    # Find Normal Question section
    normal_match = re.search(
        r"##\s*[❓?]\s*Normal Question\s*\n+(.*?)(?=\n##\s*[🔥?]\s*Tricky Question|\Z)",
        readme_text,
        re.DOTALL | re.IGNORECASE,
    )
    normal = normal_match.group(1).strip() if normal_match else ""

    # Find Tricky Question section
    tricky_match = re.search(
        r"##\s*[🔥?]\s*Tricky Question\s*\n+(.*?)(?=\n##\s*✅|\Z)",
        readme_text,
        re.DOTALL | re.IGNORECASE,
    )
    tricky = tricky_match.group(1).strip() if tricky_match else ""

    return normal, tricky


def generate_template(lesson_path, normal_q, tricky_q, has_setup):
    title = lesson_path.name.replace("-", " ").title()
    lines = [
        f"# Student Answers: {title}",
        "",
        "> **Instructions:** Fill in your answers below. Do not delete the `YOUR_ANSWER_NORMAL:`, `YOUR_ANSWER_TRICKY:`, or `YOUR_COMMANDS:` markers — the validator looks for them.",
        "",
        "---",
        "",
        "## Normal Question",
        "",
    ]

    if normal_q:
        lines.append(normal_q)
        lines.append("")
    else:
        lines.append("_(Question text not found — refer to README.md)_")
        lines.append("")

    lines.extend([
        "YOUR_ANSWER_NORMAL:",
        "<!-- Write your answer here (minimum 10 words). Be specific and explain your reasoning. -->",
        "",
        "---",
        "",
        "## Tricky Question",
        "",
    ])

    if tricky_q:
        lines.append(tricky_q)
        lines.append("")
    else:
        lines.append("_(Question text not found — refer to README.md)_")
        lines.append("")

    lines.extend([
        "YOUR_ANSWER_TRICKY:",
        "<!-- Write your answer here (minimum 10 words). Explain edge cases or consequences. -->",
        "",
    ])

    if has_setup:
        lines.extend([
            "---",
            "",
            "## Hands-on Task",
            "",
            "YOUR_COMMANDS:",
            "<!-- Record the exact commands you ran to complete the task, one per line. Lines starting with # are ignored. -->",
            "# cd sandbox/",
            "# [your commands here]",
            "",
        ])

    lines.extend([
        "---",
        "",
        "## Self-Check Reflection",
        "",
        "YOUR_REFLECTION:",
        "<!-- What did you learn? What surprised you? What will you do differently? (minimum 5 words) -->",
        "",
    ])

    return "\n".join(lines)


def main():
    lessons = find_lessons()
    created = 0
    skipped = 0

    for lesson in lessons:
        answers_path = lesson / "ANSWERS.md"
        if answers_path.exists():
            skipped += 1
            continue

        readme_path = lesson / "README.md"
        readme_text = readme_path.read_text(encoding="utf-8")
        normal_q, tricky_q = extract_questions(readme_text)
        has_setup = (lesson / "setup.sh").exists()

        template = generate_template(lesson, normal_q, tricky_q, has_setup)
        answers_path.write_text(template, encoding="utf-8")
        created += 1
        print(f"Created {answers_path}")

    print(f"\nDone: {created} created, {skipped} already existed, {len(lessons)} total lessons.")


if __name__ == "__main__":
    main()

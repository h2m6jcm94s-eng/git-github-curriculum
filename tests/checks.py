"""
Check functions for hands-on lesson validation.
Each function receives a sandbox path and optional parameters, returns a dict:
  {'passed': bool, 'message': str}
"""

import subprocess
import os


def _run(cmd, cwd, shell=True):
    """Run a shell command and return stripped stdout."""
    result = subprocess.run(
        cmd, cwd=cwd, shell=shell, capture_output=True, text=True
    )
    return result.stdout.strip(), result.stderr.strip(), result.returncode


def check_branch_exists(sandbox, branch):
    out, err, rc = _run(f"git branch --list {branch}", sandbox)
    passed = branch in out
    return {
        "passed": passed,
        "message": f"Branch '{branch}' exists" if passed else f"Branch '{branch}' missing",
    }


def check_file_exists(sandbox, path):
    full = os.path.join(sandbox, path)
    passed = os.path.exists(full)
    return {
        "passed": passed,
        "message": f"File '{path}' exists" if passed else f"File '{path}' missing",
    }


def check_file_contains(sandbox, path, text):
    full = os.path.join(sandbox, path)
    if not os.path.exists(full):
        return {"passed": False, "message": f"File '{path}' missing"}
    with open(full) as f:
        content = f.read()
    passed = text in content
    return {
        "passed": passed,
        "message": f"File '{path}' contains '{text}'" if passed else f"File '{path}' missing text '{text}'",
    }


def check_commit_count(sandbox, branch, count):
    out, err, rc = _run(f"git rev-list --count {branch}", sandbox)
    try:
        actual = int(out)
    except ValueError:
        actual = -1
    passed = actual == count
    return {
        "passed": passed,
        "message": f"Branch '{branch}' has {actual} commits (expected {count})" if not passed else f"Branch '{branch}' has correct commit count ({count})",
    }


def check_ahead_of(sandbox, branch, base, count):
    out, err, rc = _run(f"git rev-list --count {base}..{branch}", sandbox)
    try:
        actual = int(out)
    except ValueError:
        actual = -1
    passed = actual == count
    return {
        "passed": passed,
        "message": f"'{branch}' is {actual} commits ahead of '{base}' (expected {count})" if not passed else f"'{branch}' is correctly {count} commit(s) ahead of '{base}'",
    }


def check_merge_base_is_head(sandbox, branch, base):
    """Check that merge-base(branch, base) == base HEAD (i.e. branch is directly on top of base)."""
    base_head, _, _ = _run(f"git rev-parse {base}", sandbox)
    merge_base, _, _ = _run(f"git merge-base {branch} {base}", sandbox)
    passed = base_head == merge_base and len(base_head) > 0
    return {
        "passed": passed,
        "message": f"'{branch}' is rebased onto '{base}'" if passed else f"'{branch}' is NOT directly based on '{base}' (merge-base mismatch)",
    }


def check_no_uncommitted_changes(sandbox):
    out, err, rc = _run("git status --porcelain", sandbox)
    passed = len(out) == 0
    return {
        "passed": passed,
        "message": "Working tree is clean" if passed else f"Uncommitted changes remain: {out[:200]}",
    }


def check_log_contains(sandbox, branch, text):
    out, err, rc = _run(f"git log --oneline {branch}", sandbox)
    passed = text in out
    return {
        "passed": passed,
        "message": f"Log for '{branch}' contains '{text}'" if passed else f"Log for '{branch}' missing '{text}'",
    }


def check_branch_missing(sandbox, branch):
    out, err, rc = _run(f"git branch --list {branch}", sandbox)
    passed = branch not in out
    return {
        "passed": passed,
        "message": f"Branch '{branch}' correctly removed" if passed else f"Branch '{branch}' still exists",
    }


def check_stash_count(sandbox, count):
    out, err, rc = _run("git stash list | wc -l", sandbox)
    try:
        actual = int(out)
    except ValueError:
        actual = -1
    passed = actual == count
    return {
        "passed": passed,
        "message": f"Stash count is {actual} (expected {count})" if not passed else f"Stash count correctly {count}",
    }


def check_tag_exists(sandbox, tag):
    out, err, rc = _run(f"git tag --list {tag}", sandbox)
    passed = tag in out
    return {
        "passed": passed,
        "message": f"Tag '{tag}' exists" if passed else f"Tag '{tag}' missing",
    }


def check_remote_exists(sandbox, remote):
    out, err, rc = _run("git remote", sandbox)
    passed = remote in out.split()
    return {
        "passed": passed,
        "message": f"Remote '{remote}' configured" if passed else f"Remote '{remote}' missing",
    }


def check_remote_branch_exists(sandbox, remote_branch):
    out, err, rc = _run("git branch -r", sandbox)
    passed = remote_branch in out
    return {
        "passed": passed,
        "message": f"Remote branch '{remote_branch}' exists" if passed else f"Remote branch '{remote_branch}' missing",
    }


# Map check names to functions for dynamic dispatch
CHECK_REGISTRY = {
    "branch_exists": check_branch_exists,
    "file_exists": check_file_exists,
    "file_contains": check_file_contains,
    "commit_count": check_commit_count,
    "ahead_of": check_ahead_of,
    "merge_base_is_head": check_merge_base_is_head,
    "no_uncommitted_changes": check_no_uncommitted_changes,
    "log_contains": check_log_contains,
    "branch_missing": check_branch_missing,
    "stash_count": check_stash_count,
    "tag_exists": check_tag_exists,
    "remote_exists": check_remote_exists,
    "remote_branch_exists": check_remote_branch_exists,
}


def run_check(sandbox, check_spec):
    """
    check_spec: dict with 'name' and optional kwargs.
    Example: {'name': 'branch_exists', 'branch': 'feature'}
    """
    name = check_spec["name"]
    kwargs = {k: v for k, v in check_spec.items() if k != "name"}
    func = CHECK_REGISTRY.get(name)
    if func is None:
        return {"passed": False, "message": f"Unknown check: {name}"}
    return func(sandbox, **kwargs)

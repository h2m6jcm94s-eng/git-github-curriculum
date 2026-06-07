# Checkout and Review PRs ⭐⭐

Reviewing code is more than reading diffs. This lesson teaches you to pull a PR branch locally, run tests, leave structured reviews, and post comments from the CLI.

## Setup

Run the setup script to create a local clone you can practice on:

```bash
bash setup.sh
```

## Task

1. Check out a Pull Request locally with `gh pr checkout`.
2. Inspect the code and run any local tests.
3. Submit a PR review (Approve / Request Changes / Comment).
4. Post a standalone comment on a PR.

## ❓ Normal question

How do you check out a PR branch locally?

## 🔥 Tricky question

You checked out a PR with `gh pr checkout`. It created a local branch. After review, you want to clean up. What's the safe way to delete it?

## ✅ How to check yourself

List your local branches with `git branch` and confirm the PR branch is present (and later removed).

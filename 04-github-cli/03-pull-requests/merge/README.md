# Merge PRs ⭐

Merging is the final step of the Pull Request workflow. The `gh pr merge` command gives you fine-grained control over how commits land in the base branch.

## Setup

Run the setup script to create a local repo simulating a merged feature branch:

```bash
bash setup.sh
```

## Task

1. Inspect an open PR with `gh pr view`.
2. Merge it using the default merge strategy.
3. Try merging another PR with `--squash`.
4. Try merging a third PR with `--rebase`.

## ❓ Normal question

What merge strategies does `gh pr merge` support?

## 🔥 Tricky question

You ran `gh pr merge --squash` but the commit message was auto-generated and ugly. How do you control the squash commit message from the CLI?

## ✅ How to check yourself

Run `git log --oneline` on the base branch and verify the merge, squash, or rebase history matches your chosen strategy.

# Branching and Merging: Merging ⭐⭐

Merging combines the work from different branches. Understanding fast-forward merges versus merge commits helps you make intentional decisions about your project's history shape.

## Setup

Run the setup script to create your practice environment:

```bash
bash setup.sh
```

## Task

1. Navigate into `sandbox/`.
2. You are on `main` with commits A, B, C. There is a `feature` branch with commits D, E.
3. Merge `feature` into `main` with a plain `git merge feature`.
4. Check `git log --oneline --graph`. What kind of merge happened?
5. Now create a `no-ff-feature` branch from the current `main`, add a commit, and merge it using `--no-ff`.
6. Compare the graph shape between the two merges.

## ❓ Normal Question

What's a fast-forward merge?

## 🔥 Tricky Question

When would you intentionally use `--no-ff` to create a merge commit even when a fast-forward is possible?

## ✅ How to Check Yourself

- The first merge is a fast-forward: `main` simply moves to `feature`'s tip.
- The second merge creates a merge commit even though fast-forward was possible.
- `git log --oneline --graph` shows a linear history for the first merge and a fork-and-join for the second.

# Rebase: Rebase --onto ⭐⭐⭐

`git rebase --onto` is the scalpel of rebase. It lets you transplant a specific range of commits from one base to another, without bringing along unwanted commits.

## Setup

Run the setup script to create your practice environment:

```bash
bash setup.sh
```

## Task

1. Navigate into `sandbox/`.
2. Inspect the history. `feature` branched from `old-base`. `main` has moved far ahead.
3. You want to move only the last 2 commits of `feature` onto `main`, leaving the first `feature` commit behind.
4. Run: `git rebase --onto main old-base feature`
5. Check `git log --oneline --graph --all`.
6. Verify that the old-base commit is no longer part of `feature`.

## ❓ Normal Question

What does `rebase --onto` do differently from plain `rebase`?

## 🔥 Tricky Question

Give a scenario where `git rebase --onto main feature~3 feature` is the only correct move and plain `git rebase main` would bring the wrong commits along.

## ✅ How to Check Yourself

- `feature` now sits on top of `main`.
- The commit that was at `old-base` is not in `feature`'s ancestry.
- `git log --oneline feature` starts with the transplanted commits, then `main`'s commits.

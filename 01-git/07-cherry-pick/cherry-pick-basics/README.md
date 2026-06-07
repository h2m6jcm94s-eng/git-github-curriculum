# Cherry-Pick: Cherry-Pick Basics ⭐⭐

Cherry-pick lets you copy a specific commit (or range of commits) from one branch and apply it onto your current branch. It's useful for backporting bug fixes or grabbing individual changes without merging entire branches.

## Setup

Run the setup script to create your practice environment:

```bash
bash setup.sh
```

## Task

1. Navigate into `sandbox/`.
2. Inspect the history. `feature` has commits that `main` doesn't.
3. Check out `main`.
4. Cherry-pick a single commit from `feature` onto `main`.
5. Verify with `git log --oneline` that the commit now exists on `main` with a new hash.
6. Cherry-pick a range of two commits from `feature` onto `main`.

## ❓ Normal Question

How do you cherry-pick a single commit?

## 🔥 Tricky Question

You cherry-pick and hit a conflict. After resolving, do you run `git commit` or `git cherry-pick --continue`? Does it matter — what does each do?

## ✅ How to Check Yourself

- `git log --oneline main` shows the cherry-picked commits at the tip.
- The cherry-picked commits have different hashes than the originals.
- The range cherry-pick applies both commits in order.

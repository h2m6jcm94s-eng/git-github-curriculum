# Rebase: Rebase Basics ⭐⭐

Rebase moves a branch to a new base commit by replaying its commits one by one. It creates a cleaner, linear history compared to merging, but it rewrites commit hashes.

## Setup

Run the setup script to create your practice environment:

```bash
bash setup.sh
```

## Task

1. Navigate into `sandbox/`.
2. You are on `feature`. `main` has new commits that `feature` doesn't have.
3. Run `git log --oneline --graph --all` to see the diverged history.
4. Rebase `feature` onto `main`: `git rebase main`.
5. Check `git log --oneline --graph --all` again.
6. Notice the commit hashes on `feature` have changed.

## ❓ Normal Question

What does `git rebase main` do to your `feature` branch?

## 🔥 Tricky Question

After rebase, why do your commit hashes change even though the file changes look the same?

## ✅ How to Check Yourself

- `git log --oneline --graph --all` shows `feature` commits on top of `main` with no merge commit.
- The old `feature` commit hashes are gone from the branch history.
- `git reflog` still contains the old commits.

# Stash: Stash Basics ⭐

Stashing lets you temporarily shelve changes without committing them. It's perfect when you need to quickly switch branches or pull updates but aren't ready to commit your current work.

## Setup

Run the setup script to create your practice environment:

```bash
bash setup.sh
```

## Task

1. Navigate into `sandbox/`.
2. You are on `main` with uncommitted changes in `work.txt`.
3. Run `git stash push -m "WIP on main"` to save your changes.
4. Check `git status` — it should be clean.
5. List your stashes with `git stash list`.
6. Switch to `feature`, then switch back to `main`.
7. Apply the stash without removing it from the list using `git stash apply`.
8. Now pop the stash (apply and remove) using `git stash pop`.
9. Verify `git stash list` is empty.

## ❓ Normal Question

What's the difference between `git stash pop` and `git stash apply`?

## 🔥 Tricky Question

You stashed with untracked files present, switched branches, and `git stash pop` didn't restore the new file. Why, and which flag would have included it?

## ✅ How to Check Yourself

- `git stash list` shows your saved stash.
- `git stash apply` restores changes but keeps the stash entry.
- `git stash pop` restores changes and drops the stash entry.
- After popping, `git stash list` is empty.

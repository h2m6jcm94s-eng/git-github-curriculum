# Committed to Main ⭐⭐⭐

Accidentally committing directly to `main` is a common mistake. The good news: if you haven't pushed yet, you can safely move those commits to a feature branch and reset `main`. This lesson shows you how.

Run `bash setup.sh` to create a sandbox with a few accidental commits on `main` that haven't been pushed.

## Task

1. `cd` into `sandbox/`.
2. Verify you are on `main` and have commits that aren't on `origin/main`.
3. Create and check out a new branch `feature/login` — do NOT reset `main` yet.
4. Reset `main` back to `origin/main` using `git reset --hard origin/main`.
5. Verify `main` is clean and `feature/login` retains your work.

## ❓ Normal question

How do you move unpushed commits from `main` to a new branch?

## 🔥 Tricky question

You made 4 commits directly on `main` and pushed (`main` is shared). Move them onto a new `feature/login` branch and reset `main` to match `origin/main` — without rewriting origin's history.

## ✅ How to check yourself

- `git branch` shows `main` and `feature/login`.
- `git log main --oneline` matches `git log origin/main --oneline`.
- `git log feature/login --oneline` shows the 4 commits.
- `git push origin feature/login` succeeds.

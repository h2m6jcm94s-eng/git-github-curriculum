# Moving Commits to a Branch ⭐⭐⭐

Sometimes you commit work to the wrong branch. If the commits are unpushed, moving them is trivial. But if they've already been pushed to a shared branch, you need a strategy that doesn't rewrite history for the team.

Run `bash setup.sh` to create a sandbox with commits already pushed to `origin/main` that need to be moved to a feature branch.

## Task

1. `cd` into `sandbox/`.
2. Verify that `main` and `origin/main` both contain the extra commits.
3. Create a new branch `feature/api` at `main` and push it.
4. On `main`, revert the extra commits so `main` returns to its intended state.
5. Push `main` without force.

## ❓ Normal question

How do you move unpushed commits from `main` to a feature branch?

## 🔥 Tricky question

The commits are already pushed to `origin/main`. How do you move them to a feature branch WITHOUT force-pushing `main`?

## ✅ How to check yourself

- `git log origin/main --oneline` no longer shows the moved commits as active work (they are reverted).
- `git log feature/api --oneline` contains the commits.
- `git push origin main` succeeds without `--force`.

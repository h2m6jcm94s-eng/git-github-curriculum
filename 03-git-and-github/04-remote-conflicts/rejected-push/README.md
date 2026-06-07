# Rejected Push ⭐⭐

A push is rejected when the remote has commits that your local branch does not contain. This is Git protecting you from accidentally overwriting someone else's work. Learning to read the error and choose the right resolution is essential.

Run `bash setup.sh` to create a sandbox where the remote and local `main` have diverged.

## Task

1. `cd` into `sandbox/`.
2. Try to push your local `main` to `origin`. It should be rejected.
3. Read the error message carefully.
4. Pull the remote changes, resolve any conflict if prompted, and push again.

## ❓ Normal question

Why does push get rejected with "non-fast-forward" or "remote contains work you do not have"?

## 🔥 Tricky question

Push rejected: "remote contains work you do not have." You rebased your branch, so `--force` works but erases a teammate's commit. What should you use instead and why is it safer?

## ✅ How to check yourself

- `git log origin/main --oneline` shows the teammate's commit that caused the rejection.
- Your final `main` includes both your commit and the teammate's commit.
- `git push` succeeds after reconciliation.

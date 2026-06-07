# Diverged Branches ⭐⭐⭐

When your local branch and its remote counterpart have both moved forward with different commits, they are "diverged." Resolving divergence cleanly — especially with linear history — is a critical skill for feature branch workflows.

Run `bash setup.sh` to create a sandbox where `main` and `origin/main` have diverged.

## Task

1. `cd` into `sandbox/`.
2. Run `git status` and observe the "have diverged" message.
3. Run `git pull` and note the merge commit it creates.
4. Reset your sandbox to the pre-merge state using the backup ref created by `setup.sh`.
5. This time, use `git pull --rebase` instead.
6. Compare the resulting history with `git log --oneline --graph`.

## ❓ Normal question

What does "diverged" mean in Git?

## 🔥 Tricky question

`git pull` left an unwanted merge commit on your feature branch. What flag or config gives linear history instead, and why is that flag risky on a shared branch?

## ✅ How to check yourself

- After `git pull --rebase`, `git log --oneline --graph` shows a straight line with no merge commit.
- Both your local commits and the remote commits are present.
- `git status` shows your branch is up to date with `origin/main`.

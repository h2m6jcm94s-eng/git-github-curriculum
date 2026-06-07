# Fetch vs Pull ⭐⭐

`git fetch` and `git pull` both download changes from a remote, but they behave very differently. Understanding the distinction protects you from unexpected merges and gives you full control over when to integrate remote work.

Run `bash setup.sh` to build a sandbox with a local bare remote that already has commits you haven't seen yet.

## Task

1. `cd` into the `sandbox/` folder.
2. Before pulling anything, run `git fetch origin`.
3. Inspect what changed locally using `git branch -r` and `git log origin/main --oneline`.
4. Run `git status` and note what it says about your local `main` relative to `origin/main`.
5. Now run `git pull` and observe the difference.

## ❓ Normal question

What's the difference between `fetch` and `pull`?

## 🔥 Tricky question

After `git fetch`, `git status` says "Your branch is up to date with 'origin/main'." But you know the remote has new commits. What did `fetch` update, what did it not, and which ref proves the new commits exist locally?

## ✅ How to check yourself

- `git log origin/main --oneline` shows commits that arrived during `fetch`.
- Before `pull`, your local `main` is still at the old commit.
- After `pull`, `main` and `origin/main` point to the same commit.

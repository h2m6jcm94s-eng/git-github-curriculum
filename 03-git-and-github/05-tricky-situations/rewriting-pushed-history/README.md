# Rewriting Pushed History ⭐⭐⭐

Rewriting history after pushing is dangerous because it changes commit hashes that teammates may already be basing work on. However, sometimes it's necessary — for example, to remove a secrets file. This lesson explores when and how to do it with minimal disruption.

Run `bash setup.sh` to create a sandbox where a secrets file has been committed and pushed to `origin/main`.

## Task

1. `cd` into `sandbox/`.
2. Inspect the history and confirm the secrets file exists in an old commit.
3. Use `git filter-repo` (or `git filter-branch` if unavailable) to remove the file from all history.
4. Inspect the rewritten history locally.
5. Discuss what would need to happen before force-pushing this rewritten history to `origin/main`.

## ❓ Normal question

Why is rewriting pushed history dangerous?

## 🔥 Tricky question

You need to remove a secrets file from history. It's already pushed. What's the safest approach that minimizes disruption?

## ✅ How to check yourself

- `git log --all --full-history -- secrets.env` returns nothing after the rewrite.
- The commit hashes of rewritten commits are different from the originals.
- You can explain why communication and coordination with the team are mandatory before force-pushing.

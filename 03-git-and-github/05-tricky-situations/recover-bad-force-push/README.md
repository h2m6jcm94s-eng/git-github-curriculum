# Recover Bad Force Push ⭐⭐⭐

A bad force push can feel catastrophic, but Git is designed to resist data loss. Commits are objects in the object database; as long as something still references them, they survive. This lesson teaches you where to look.

Run `bash setup.sh` to create a sandbox where a force push has overwritten history on the remote.

## Task

1. `cd` into `sandbox/`.
2. The `setup.sh` has already force-pushed `origin/main` to an older commit, discarding newer commits.
3. On your local machine, use `git reflog` to find the discarded commits.
4. Create a recovery branch pointing to the old tip.
5. Push the recovery branch to `origin` so the commits are reachable again.
6. Discuss how you would restore `main` safely.

## ❓ Normal question

How can you recover overwritten commits?

## 🔥 Tricky question

You force-pushed and overwrote 5 commits. No one else has them. The reflog on the remote doesn't help you. What local references might still have them?

## ✅ How to check yourself

- `git reflog` in your local sandbox shows the old `main` tip before the force push.
- You can create a branch at that commit: `git branch recovery <hash>`.
- `git fsck --unreachable` can find commits with no refs pointing to them.

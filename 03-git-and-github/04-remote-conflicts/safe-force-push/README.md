# Safe Force Push ⭐⭐⭐

Force-pushing rewrites history on the remote. While sometimes necessary, a bare `--force` is dangerous because it unconditionally overwrites the remote branch. `--force-with-lease` adds a critical safety check.

Run `bash setup.sh` to create a sandbox with a shared branch that you and a teammate both pushed to.

## Task

1. `cd` into `sandbox/`.
2. Inspect the history with `git log --oneline`.
3. Rebase your local branch to squash your commits into one.
4. Try `git push --force-with-lease origin main`.
5. Simulate a teammate pushing a new commit to `origin/main` after your last fetch.
6. Try `git push --force-with-lease` again and observe it failing.
7. Contrast this with what `--force` would have done.

## ❓ Normal question

What's the difference between `--force` and `--force-with-lease`?

## 🔥 Tricky question

You force-pushed 20 minutes ago and overwrote a teammate's commit on a shared branch; they haven't pulled yet. Recover their commit and restore the branch correctly.

## ✅ How to check yourself

- `--force-with-lease` fails when the remote has changed since your last fetch.
- The teammate's commit is preserved after the failed lease push.
- You can demonstrate recovery by finding the lost commit hash and resetting the remote branch.

# End-to-End Workflow ⭐⭐⭐

The feature branch workflow is the backbone of team collaboration: create a branch, do your work, push it, open a pull request, address review feedback, merge, and sync your local copy. This lesson simulates the entire cycle using local bare remotes so you can practice offline.

Run `bash setup.sh` to create `upstream.git` (the canonical repo) and `fork.git` (your fork), then clone the fork into `sandbox/`.

## Task

1. `cd` into `sandbox/`.
2. Add `upstream.git` as a remote named `upstream`.
3. Create and check out a branch called `feature/login`.
4. Make a commit adding a file, then push it to `origin`.
5. **Simulate a PR merge:** on `upstream.git`, merge your feature branch into `main` (this represents the maintainer merging your PR).
6. Switch back to your sandbox. Sync your local `main` with `upstream/main`.
7. Delete the merged feature branch locally and on `origin`.

## ❓ Normal question

After merging a PR on GitHub, what must you do locally?

## 🔥 Tricky question

You merged the PR via GitHub's web UI. Your local `main` is behind. You `pull` and get a merge commit even though the PR was squash-merged. Why?

## ✅ How to check yourself

- `git log --oneline --graph main` in the sandbox shows the merged history.
- `git branch` no longer lists `feature/login` locally.
- `git remote prune origin` removes stale remote-tracking branches.

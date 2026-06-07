# Fork to PR ⭐⭐

Open-source contributions typically start with a fork. You clone your fork, add the original repository as `upstream`, branch, push, and open a pull request. Keeping your fork current by rebasing on `upstream/main` ensures clean history.

Run `bash setup.sh` to create an `upstream.git` (original repo) and a `fork.git` (your fork), then clone the fork into `sandbox/`.

## Task

1. `cd` into `sandbox/`.
2. Verify remotes with `git remote -v`. You should see `origin` pointing to your fork.
3. Add `upstream.git` as a remote named `upstream`.
4. Create a branch `feature/navbar`, make a commit, and push it to `origin`.
5. Simulate upstream activity: add a commit directly to `upstream.git` on `main`.
6. Fetch `upstream`, rebase your `feature/navbar` onto `upstream/main`, then push to `origin`.

## ❓ Normal question

Why add `upstream` as a remote instead of using `origin`?

## 🔥 Tricky question

You rebased your feature branch on `upstream/main`, then pushed to `origin`. Push is rejected. Why, and what's the safe resolution?

## ✅ How to check yourself

- `git log --oneline --graph feature/navbar` shows linear history based on the latest `upstream/main`.
- `git log origin/feature/navbar` matches `feature/navbar` after the push.
- `git remote -v` lists both `origin` and `upstream`.

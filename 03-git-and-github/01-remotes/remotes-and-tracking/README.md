# Remotes and Tracking ⭐

Before you can collaborate, Git needs to know where the shared repository lives. This lesson introduces remotes, the convention of naming them `origin` and `upstream`, and how tracking branches connect your local branches to their remote counterparts.

Run `bash setup.sh` to create a local bare remote and a clone so you can experiment offline.

## Task

1. `cd` into the `sandbox/` folder created by `setup.sh`.
2. Inspect the existing remote with `git remote -v`.
3. Create a new local bare repository outside `sandbox/` and add it as a second remote named `upstream`.
4. Create a new branch called `feature`, add a commit, and push it with `git push -u origin feature`.
5. Run `git branch -vv` and observe the tracking relationship shown in brackets.

## ❓ Normal question

What does `git push -u origin feature` do?

## 🔥 Tricky question

You cloned a repo, created a branch, committed, and tried `git push`. It failed with "fatal: The current branch feature has no upstream branch." Why?

## ✅ How to check yourself

- `git remote -v` shows both `origin` and `upstream`.
- `git branch -vv` shows `[origin/feature]` next to your local `feature` branch.
- `git push` with no arguments now works from `feature` because tracking is configured.

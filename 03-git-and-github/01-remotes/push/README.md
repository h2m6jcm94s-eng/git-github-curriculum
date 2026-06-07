# Push ⭐

`git push` uploads your local commits to a remote. Once pushed, your work is visible to teammates and backed up on the server. This lesson explores default push behavior and what Git does when you run it with and without arguments.

Run `bash setup.sh` to create a local bare remote with a clone ready for pushing.

## Task

1. `cd` into the `sandbox/` folder.
2. Create a branch called `feature`, make a commit, and push it using `git push -u origin feature`.
3. Make another commit on `feature` and run `git push` with no arguments.
4. Switch to `main`, make a commit, and run `git push`. Observe the behavior.

## ❓ Normal question

What does `git push` do without arguments?

## 🔥 Tricky question

You pushed a branch, but `git branch -vv` shows `[origin/feature]` behind your local branch (e.g., `[origin/feature: behind 1]`). Why?

## ✅ How to check yourself

- `git push` with no arguments succeeds on `feature` after `-u` is set.
- `git branch -vv` on `feature` shows it is in sync with `origin/feature` after pushing.
- The latest commit on `feature` appears in `git log origin/feature --oneline`.

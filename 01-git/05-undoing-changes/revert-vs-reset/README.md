# Undoing Changes: Revert vs Reset ⭐⭐

`git reset` rewrites history by moving branch pointers. `git revert` adds new history by creating an inverse commit. Choosing the right tool depends on whether your commits are private or shared.

## Setup

Run the setup script to create your practice environment:

```bash
bash setup.sh
```

## Task

1. Navigate into `sandbox/`.
2. Inspect the commit history. There are three commits.
3. Use `git revert` to undo the second commit (the one that introduced a bug).
4. Check `git log --oneline`. Notice the history is preserved.
5. Now use `git reset --hard` to go back to the first commit.
6. Check `git log --oneline`. What happened to commits 2 and 3?

## ❓ Normal Question

What's the difference between `git revert` and `git reset`?

## 🔥 Tricky Question

You need to undo a commit that's already on `origin/main`. Which is safe on a shared branch — `git revert` or `git reset --hard` — and why?

## ✅ How to Check Yourself

- After `git revert`, the original commits still exist and a new "revert" commit appears at the tip.
- After `git reset --hard`, the branch pointer moves and later commits are no longer reachable from the branch.
- `git reflog` still shows the old commits in both cases.

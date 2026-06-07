# Branching and Merging: Merge Conflicts ⭐⭐⭐

When two branches modify the same part of the same file, Git can't decide which version is correct. You must resolve the conflict manually. Knowing how to read conflict markers and recover from bad resolutions is a critical skill.

## Setup

Run the setup script to create your practice environment:

```bash
bash setup.sh
```

## Task

1. Navigate into `sandbox/`.
2. You are on `main`. Try to merge `feature` into `main`.
3. Git reports a conflict in `recipe.txt`.
4. Open `recipe.txt` and identify the conflict markers (`<<<<<<<`, `=======`, `>>>>>>>`).
5. Edit the file to keep the correct resolution (combine both changes sensibly).
6. Stage the resolved file and complete the merge.
7. Check `git log --oneline --graph` to see the merge commit.

## ❓ Normal Question

What do the `<<<<<<<`, `=======`, and `>>>>>>>` markers mean in a conflicted file?

## 🔥 Tricky Question

You resolved a conflict but kept the wrong code. The merge is already committed. How do you redo the merge resolution without losing other work that happened after the merge?

## ✅ How to Check Yourself

- After resolution, `git status` shows no unmerged paths.
- `recipe.txt` contains neither conflict markers nor the rejected text (unless you intentionally kept it).
- The merge commit appears in `git log --oneline --graph` with two parents.

# Staging and Commits: Partial Staging ⭐⭐

Not every change in a file belongs in the same commit. Git's patch mode lets you review changes hunk by hunk and stage only the pieces you want. This skill is essential for keeping commits focused and atomic.

## Setup

Run the setup script to create your practice environment:

```bash
bash setup.sh
```

## Task

1. Navigate into `sandbox/`.
2. Open `recipe.txt`. It contains several sections.
3. Make two unrelated changes: edit the ingredients list and also add a note at the bottom.
4. Run `git add -p recipe.txt`.
5. Stage only the ingredients hunk, leaving the note unstaged.
6. Commit the staged hunk with `git commit -m "Update ingredients"`.
7. Stage and commit the remaining note separately.

## ❓ Normal Question

How do you stage only part of a file in Git?

## 🔥 Tricky Question

You staged a hunk but realize it's wrong. How do you unstage just that hunk without resetting the entire file?

## ✅ How to Check Yourself

- `git log --oneline` shows two commits.
- The first commit only modified the ingredients section.
- The second commit only added the note.
- `git diff HEAD~2..HEAD` shows all changes, split across the two commits.

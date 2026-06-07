# Staging and Commits: Staging Basics ⭐

Staging is how you tell Git which changes belong in the next commit. Learning to read `git status` and understanding the lifecycle of a file (untracked → tracked → modified → staged → committed) is essential for daily Git use.

## Setup

Run the setup script to create your practice environment:

```bash
bash setup.sh
```

## Task

1. Navigate into `sandbox/`.
2. Check `git status`. Notice the untracked files.
3. Create a new file `notes.txt` and write something in it.
4. Run `git status` again. What category is `notes.txt` in?
5. Stage `notes.txt` with `git add notes.txt`.
6. Edit `notes.txt` again after staging.
7. Run `git status`. Observe that the same file appears in two sections.
8. Commit the staged version with `git commit -m "Add notes"`.
9. Check `git status` again. What remains?
10. Stage the remaining changes and commit them too, this time using a single flag to include unstaged changes in the commit.

## ❓ Normal Question

What's the difference between a tracked file and an untracked file in Git?

## 🔥 Tricky Question

You staged a file, then edited it again before committing. `git status` shows it in both areas. What gets committed if you run `git commit` right now? What single flag can you add to `git commit` to also include the new edits in the same commit?

## ✅ How to Check Yourself

- After step 6, `git status` shows `notes.txt` under both "Changes to be committed" and "Changes not staged."
- The first commit only includes the originally staged version.
- The second commit includes the later edits.
- At the end, `git status` is clean.

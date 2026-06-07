# Undoing Changes: Restore and Reset ⭐⭐

Git gives you multiple ways to undo work depending on which tree the mistake lives in. `git restore` is the safe way to discard working directory changes, while `git reset` moves branch pointers and manipulates the staging area with varying degrees of force.

## Setup

Run the setup script to create your practice environment:

```bash
bash setup.sh
```

## Task

1. Navigate into `sandbox/`.
2. Edit `file.txt` but do not stage.
3. Discard the working directory change safely using `git restore`.
4. Edit `file.txt` again, then stage it.
5. Unstage the file without losing the working directory change.
6. Make a bad commit with `git commit -m "Bad commit"`.
7. Undo the last commit but keep the changes in the working directory.
8. Stage and recommit with a better message.
9. Make another commit. Now undo it completely, discarding all changes.

## ❓ Normal Question

You modified a file but want to discard changes. What's the safest command?

## 🔥 Tricky Question

Explain what `git reset --soft HEAD~1`, `--mixed`, and `--hard` each do to the three trees. You committed too early and want the changes back in staging — which one do you use, and why is `--hard` the wrong answer here?

## ✅ How to Check Yourself

- `git restore file.txt` returns the working directory file to match HEAD.
- `git restore --staged file.txt` unstages without touching the working file.
- After undoing the bad commit with `--mixed`, `git status` shows the changes as modified but unstaged.
- After `--hard`, `git status` is clean and the changes are gone from all trees.

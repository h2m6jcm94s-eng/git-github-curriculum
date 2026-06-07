# Git Foundations: The Three Trees ⭐

Git manages the state of your project through three distinct "trees" — areas where your files live at different stages of the version control process. Understanding these trees is the foundation of every Git operation.

## Setup

Run the setup script to create your practice environment:

```bash
bash setup.sh
```

This creates a `sandbox/` directory with a repository and some initial commits.

## Task

1. Navigate into `sandbox/`.
2. Open `hello.txt` in your editor, change the text, and save it.
3. Run `git status`. Observe which tree(s) show changes.
4. Stage the file with `git add hello.txt`.
5. Edit `hello.txt` again without staging.
6. Run `git status` again and note the differences.
7. Commit with `git commit -m "Update hello.txt"`.

## ❓ Normal Question

Name the three trees in Git and briefly describe what each holds.

## 🔥 Tricky Question

You edit a file, stage it, then edit it again before committing. When you run `git status`, what is in the working directory, what is in the staging area (index), and what is in the repository (HEAD)?

## ✅ How to Check Yourself

- After the first edit, `git status` shows the file as modified (working directory differs from HEAD).
- After `git add`, the file is staged. After the second edit, `git status` shows the same file in both "Changes to be committed" and "Changes not staged for commit."
- The commit contains the version of the file as it was when you ran `git add`.

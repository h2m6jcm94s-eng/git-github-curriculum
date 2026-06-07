# Staging and Commits: Amend and .gitignore ⭐⭐

Commits aren't truly final until you share them. `git commit --amend` lets you fix the last commit, and `.gitignore` prevents Git from tracking files that don't belong in version control.

## Setup

Run the setup script to create your practice environment:

```bash
bash setup.sh
```

## Task

1. Navigate into `sandbox/`.
2. Check `git status`. There's an untracked `secrets.txt`.
3. Create a `.gitignore` file that ignores `secrets.txt` and all `.log` files.
4. Stage and commit `.gitignore`.
5. Now create `app.py` and `README.md`.
6. Stage both and commit with the message "Add app and docs".
7. Realize you forgot to include `config.json`. Create it.
8. Stage `config.json` and amend the previous commit to include it.
9. Check `git log --oneline`. How many commits are there?

## ❓ Normal Question

How do you add a forgotten file to the previous commit without creating a new commit?

## 🔥 Tricky Question

You committed but forgot one file. You added it and ran `git commit --amend`. Explain why this is dangerous if you've already pushed the original commit to a shared remote.

## ✅ How to Check Yourself

- `secrets.txt` and `.log` files are untracked and ignored by Git.
- `git log --oneline` still shows the same number of commits as before step 8 — the last commit was rewritten, not added.
- `git show --stat HEAD` lists `app.py`, `README.md`, and `config.json`.

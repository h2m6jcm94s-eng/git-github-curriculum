# Undoing Changes: Clean ⭐

Untracked files clutter your working directory. `git clean` removes them permanently. Because this command is destructive, Git requires you to be explicit about what you want to delete.

## Setup

Run the setup script to create your practice environment:

```bash
bash setup.sh
```

## Task

1. Navigate into `sandbox/`.
2. Check `git status`. There are untracked files and an untracked directory.
3. Run `git clean -n` to preview what would be deleted.
4. Run `git clean -fd` to actually delete untracked files and directories.
5. Check `git status` to confirm the working directory is clean.

## ❓ Normal Question

How do you remove untracked files from your working directory?

## 🔥 Tricky Question

You ran `git clean -fd` and deleted a config file you needed. It wasn't tracked. Can you recover it?

## ✅ How to Check Yourself

- `git status` before cleaning shows untracked files.
- `git clean -n` lists what would be removed without deleting anything.
- After `git clean -fd`, `git status` shows a clean working directory.
- The deleted files are gone from the filesystem.

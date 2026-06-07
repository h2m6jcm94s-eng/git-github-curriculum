# Stash: Advanced Stash ⭐⭐

Beyond basic save-and-restore, Git stashes support partial stashing, named stashes, and even branching from a stash. These advanced techniques help you manage complex work-in-progress states.

## Setup

Run the setup script to create your practice environment:

```bash
bash setup.sh
```

## Task

1. Navigate into `sandbox/`.
2. You have changes in both `file-a.txt` and `file-b.txt`.
3. Stash only the changes in `file-a.txt` using `git stash push -p`.
4. List stashes. You should have one stash.
5. Create another stash with a message: `git stash push -m "Partial A"`.
6. Now you have multiple stashes. List them with `git stash list`.
7. Pop the wrong stash by mistake.
8. Realize your error. Recover cleanly by resetting and applying the correct stash.

## ❓ Normal Question

How do you stash only some changes (not the entire working directory)?

## 🔥 Tricky Question

You have multiple stashes and pop the wrong one. Now your working tree is messy. How do you recover cleanly?

## ✅ How to Check Yourself

- `git stash list` shows multiple entries with your messages.
- `git stash push -p` interactively lets you choose hunks to stash.
- After recovery, the working directory contains only the correct stash's changes.

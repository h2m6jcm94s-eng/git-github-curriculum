# History and Inspection: Diffing ⭐

Diffs are the heart of understanding changes in Git. Knowing which comparison `git diff` performs by default — and how to compare against the staging area or previous commits — prevents confusion about what will be committed.

## Setup

Run the setup script to create your practice environment:

```bash
bash setup.sh
```

## Task

1. Navigate into `sandbox/`.
2. Edit `data.txt` but do not stage.
3. Run `git diff`. What is being compared?
4. Stage `data.txt`.
5. Run `git diff` again. Why is there no output?
6. Run `git diff --staged`. What do you see now?
7. Make another edit to `data.txt` without staging.
8. Run `git diff`, `git diff --staged`, and `git diff HEAD` all together and compare the outputs.
9. Run `git diff HEAD~1` to see what changed in the previous commit.

## ❓ Normal Question

What's the difference between `git diff` and `git diff --staged`?

## 🔥 Tricky Question

`git diff` shows nothing, but `git diff --staged` shows changes. Explain the state of the working directory, staging area, and HEAD.

## ✅ How to Check Yourself

- `git diff` without flags compares working directory vs staging area.
- `git diff --staged` compares staging area vs HEAD.
- `git diff HEAD` compares working directory vs HEAD (all changes, staged and unstaged).
- `git diff HEAD~1` compares the last commit with its parent.

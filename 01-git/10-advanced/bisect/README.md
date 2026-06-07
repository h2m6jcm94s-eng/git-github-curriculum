# Advanced: Bisect ⭐⭐

Git bisect performs a binary search through your commit history to find the exact commit that introduced a bug. It's one of the most powerful debugging tools in Git.

## Setup

Run the setup script to create your practice environment:

```bash
bash setup.sh
```

## Task

1. Navigate into `sandbox/`.
2. A bug was introduced somewhere in the 10 commits. The bug is: `file.txt` contains the word "BUG".
3. Start bisect: `git bisect start`.
4. Mark the current (bad) commit: `git bisect bad`.
5. Mark the first commit as good: `git bisect good <first-commit-hash>`.
6. Git checks out a middle commit. Check if "BUG" is present.
7. Mark it good or bad accordingly.
8. Repeat until Git identifies the first bad commit.
9. Run `git bisect reset` to return to where you started.

## ❓ Normal Question

How do you use bisect to find a bug?

## 🔥 Tricky Question

You mark a commit as bad but realize it was actually good. How do you correct bisect mid-flight?

## ✅ How to Check Yourself

- Git outputs the first bad commit hash and message.
- The bad commit is the one where "BUG" first appears.
- `git bisect reset` returns HEAD to the original branch.
- `git bisect log` shows the sequence of good/bad judgments.

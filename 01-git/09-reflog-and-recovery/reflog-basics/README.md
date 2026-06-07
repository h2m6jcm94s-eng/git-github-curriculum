# Reflog and Recovery: Reflog Basics ⭐⭐

The reflog is Git's safety net. It records every movement of HEAD and branch tips, even across rewrites. When you think you've lost something, the reflog often proves you haven't.

## Setup

Run the setup script to create your practice environment:

```bash
bash setup.sh
```

## Task

1. Navigate into `sandbox/`.
2. Run `git reflog` and read the output.
3. Make a commit, then reset hard back one commit.
4. Run `git reflog` again. Notice the "lost" commit is still recorded.
5. Check `git reflog show main` to see the branch tip movements.
6. Identify a specific reflog entry like `HEAD@{2}` and inspect it with `git show`.

## ❓ Normal Question

What does `git reflog` record?

## 🔥 Tricky Question

Reflog shows your target at `HEAD@{8}`, but after one checkout the numbering shifts. Why is `HEAD@{n}` unstable, and what stable reference do you grab instead?

## ✅ How to Check Yourself

- `git reflog` shows a chronological list of HEAD movements with short descriptions.
- The commit you reset away from still appears in the reflog with its hash.
- `git show HEAD@{n}` displays the commit at that reflog position.

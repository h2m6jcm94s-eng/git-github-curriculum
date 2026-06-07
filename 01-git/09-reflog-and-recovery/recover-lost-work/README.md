# Reflog and Recovery: Recover Lost Work ⭐⭐⭐

`git reset --hard` feels final, but the reflog often preserves the commits. Learning to navigate the reflog and resurrect "lost" commits is an advanced but essential recovery skill.

## Setup

Run the setup script to create your practice environment:

```bash
bash setup.sh
```

## Task

1. Navigate into `sandbox/`.
2. You have 5 commits on `main`.
3. Run `git reset --hard HEAD~5`. All commits appear gone.
4. Panic. Then run `git reflog`.
5. Find the hash of the commit that was at the tip before the reset.
6. Run `git checkout <hash>` to verify the work is still there.
7. Point `main` back to that commit.
8. Check `git log --oneline` to confirm recovery.

## ❓ Normal Question

How do you recover a commit after `git reset --hard`?

## 🔥 Tricky Question

You ran `git reset --hard HEAD~5` an hour ago, made 3 new commits, and now need the pre-reset work — it's on no branch. Recover it. What background process are you racing against, and roughly how long do you have?

## ✅ How to Check Yourself

- `git reflog` shows the pre-reset tip with its hash.
- `git log --oneline main` shows all original commits restored.
- The new commits made after the reset are still reachable via reflog if needed.

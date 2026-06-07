# Cherry-Pick: Cherry-Pick Conflicts ⭐⭐⭐

Cherry-pick conflicts are similar to merge conflicts but occur in a different context: you're applying a single commit's changes onto a different base. Understanding how to abort and how repeated cherry-picks affect future merges is crucial.

## Setup

Run the setup script to create your practice environment:

```bash
bash setup.sh
```

## Task

1. Navigate into `sandbox/`.
2. Check out `main`.
3. Cherry-pick a commit from `feature` that will conflict.
4. Resolve the conflict by keeping the correct combined content.
5. Complete the cherry-pick.
6. Now try cherry-picking another commit that also conflicts.
7. This time, abort the cherry-pick instead of resolving.

## ❓ Normal Question

How do you abort a cherry-pick?

## 🔥 Tricky Question

The same fix exists on two branches because one was cherry-picked from the other. When they later merge, why does Git often not conflict, and when would it?

## ✅ How to Check Yourself

- `git cherry-pick --abort` returns to the pre-cherry-pick state.
- The completed cherry-pick shows as a new commit on `main`.
- The aborted cherry-pick leaves no trace in the branch history.

# Reflog and Recovery: Undo a Bad Rebase ⭐⭐⭐

Rebasing rewrites history. If you finish a rebase and realize it dropped a critical commit or introduced bugs, the reflog lets you restore the pre-rebase state exactly.

## Setup

Run the setup script to create your practice environment:

```bash
bash setup.sh
```

## Task

1. Navigate into `sandbox/`.
2. You have a `feature` branch with several commits.
3. Rebase `feature` onto `main` interactively.
4. During the rebase, accidentally drop a commit.
5. Finish the rebase.
6. Realize your mistake. Use `git reflog` to find `feature`'s state before the rebase.
7. Restore `feature` to that exact state.
8. Verify with `git log --oneline` that the dropped commit is back.

## ❓ Normal Question

How do you abort a rebase that's going badly?

## 🔥 Tricky Question

You finished a rebase and pushed. Then you realize it dropped a critical commit. The old branch is gone from the remote. Recover using reflog and restore the branch correctly. What do you tell your teammates?

## ✅ How to Check Yourself

- `git reflog show feature` shows the pre-rebase tip.
- `git log --oneline feature` shows the original commits in their original order.
- If you had pushed the bad rebase, you would need to force-push the restored branch.

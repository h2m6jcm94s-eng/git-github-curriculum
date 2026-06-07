# Advanced: Worktree and Detached HEAD ⭐⭐

Sometimes you need to work on multiple branches simultaneously without stashing or cloning the repository again. Git worktrees and understanding detached HEAD state solve this elegantly.

## Setup

Run the setup script to create your practice environment:

```bash
bash setup.sh
```

## Task

1. Navigate into `sandbox/`.
2. You are on `main`. Check out a commit by hash directly (not a branch).
3. Observe the detached HEAD warning. Make a commit in detached HEAD.
4. Create a branch from your detached HEAD commit to save it.
5. Switch back to `main`.
6. Create a linked worktree for the `feature` branch in a `../feature-work` directory.
7. Verify both directories exist and contain different branch contents.
8. Remove the worktree when done.

## ❓ Normal Question

What's a detached HEAD?

## 🔥 Tricky Question

You need to review two branches simultaneously without stashing. What's the clean solution?

## ✅ How to Check Yourself

- After checking out by hash, `git status` shows "detached HEAD" state.
- The commit in detached HEAD is saved by creating a branch.
- `../feature-work` exists as a separate directory with `feature` checked out.
- `git worktree list` shows all worktrees.
- After removal, the extra directory is gone from the worktree list.

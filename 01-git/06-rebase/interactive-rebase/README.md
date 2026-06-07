# Rebase: Interactive Rebase ⭐⭐⭐

Interactive rebase (`git rebase -i`) gives you godlike control over your commit history. You can reorder, squash, reword, drop, and edit commits before publishing them.

## Setup

Run the setup script to create your practice environment:

```bash
bash setup.sh
```

## Task

1. Navigate into `sandbox/`.
2. You have four commits on `feature`.
3. Start an interactive rebase: `git rebase -i HEAD~4`.
4. In the editor:
   - Squash the last two commits into the one before them.
   - Reword the first commit's message.
   - Drop the commit that says "WIP: debug".
5. Save and close the editor to complete the rebase.
6. Verify the new history with `git log --oneline`.

## ❓ Normal Question

How do you squash the last 3 commits into one?

## 🔥 Tricky Question

You ran `git rebase -i HEAD~3` and squashed 3 commits, then realize one of the original commits had work you still need. The rebase is finished. Recover that original commit.

## ✅ How to Check Yourself

- `git log --oneline` shows fewer commits than before.
- The "WIP: debug" commit is gone from the branch.
- The first commit has the new message you typed.
- The reflog contains the old pre-rebase state.

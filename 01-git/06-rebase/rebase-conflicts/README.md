# Rebase: Rebase Conflicts ⭐⭐⭐

Conflicts during rebase are similar to merge conflicts, but the context is different: you're replaying commits one at a time. Understanding how to continue, abort, and edit commits mid-rebase is essential.

## Setup

Run the setup script to create your practice environment:

```bash
bash setup.sh
```

## Task

1. Navigate into `sandbox/`.
2. Start an interactive rebase: `git rebase -i main`.
3. In the todo list, change one commit's action from `pick` to `edit`.
4. Save and let rebase begin.
5. When rebase pauses at that commit, amend it (e.g., change a file).
6. Run `git rebase --continue`.
7. A conflict may occur in the next replayed commit. Resolve it.
8. Stage the resolved file and continue.
9. Complete the rebase.

## ❓ Normal Question

What commands continue or abort a rebase?

## 🔥 Tricky Question

During `rebase -i`, you mark commit B as `edit` and amend it. Now commits C and D fail with conflicts because they depended on B's old form. Resolve the conflicts without losing C and D's original intent.

## ✅ How to Check Yourself

- `git rebase --continue` advances to the next commit after resolving.
- `git rebase --abort` returns to the pre-rebase state.
- `git status` during rebase shows "rebase in progress" and which files are conflicted.
- The final history shows the amended commit and the successfully replayed subsequent commits.

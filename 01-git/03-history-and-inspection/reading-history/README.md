# History and Inspection: Reading History ⭐

Git keeps a complete history of your project. Learning to read that history efficiently — with concise flags and graph views — helps you understand how a project evolved and who did what.

## Setup

Run the setup script to create your practice environment:

```bash
bash setup.sh
```

## Task

1. Navigate into `sandbox/`.
2. Run `git log` and observe the default output.
3. Show the last 5 commits in one line each.
4. Show a graph view of the history with branch names and tags visible.
5. Run `git log --stat` on the last commit to see which files changed.
6. Use `git show` to inspect the most recent commit in detail.

## ❓ Normal Question

Show the last 5 commits in one line each. What flag(s) do you use?

## 🔥 Tricky Question

You run `git log` after a rebase and see commits you don't recognize — different hashes, different order. Why does this happen, and where can you look to find the original commits?

## ✅ How to Check Yourself

- `git log --oneline -5` displays 5 commits, one per line.
- `git log --oneline --graph --decorate` shows branch topology with labels.
- `git show HEAD` displays the commit message, diff, and metadata for the latest commit.

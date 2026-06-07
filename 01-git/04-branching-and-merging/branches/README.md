# Branching and Merging: Branches ⭐

Branches are lightweight pointers to commits. They let you isolate work, experiment safely, and collaborate without stepping on each other's toes. Understanding how to create, switch, and inspect branches is fundamental.

## Setup

Run the setup script to create your practice environment:

```bash
bash setup.sh
```

## Task

1. Navigate into `sandbox/`.
2. List all branches with `git branch`.
3. Create a new branch named `feature` using `git branch`.
4. Switch to it using `git switch`.
5. Make a commit on `feature`.
6. Switch back to `main`.
7. Create and switch to another branch `hotfix` in one command.
8. Run `git log --oneline --graph --all` to see the branch topology.
9. Check out the first commit directly by its hash (not a branch name).

## ❓ Normal Question

What's the difference between `git switch` and `git checkout` for switching branches?

## 🔥 Tricky Question

You check out an old commit directly by its hash instead of a branch name. What state is HEAD in, and what warning does Git give you?

## ✅ How to Check Yourself

- `git branch` lists branches with `*` next to the current one.
- `git switch feature` moves HEAD to the `feature` branch.
- `git log --oneline --graph --all` shows branches diverging.
- After checking out a commit by hash, `git status` reports "detached HEAD" state.

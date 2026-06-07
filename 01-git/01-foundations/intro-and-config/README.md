# Git Foundations: Intro and Config ⭐

Git is a distributed version control system that tracks changes in your codebase over time. Before you can make any commits, Git needs to know who you are. This lesson walks you through initializing a repository and configuring your identity so every commit is properly attributed.

## Setup

Run the setup script to create your practice environment:

```bash
bash setup.sh
```

This creates a `sandbox/` directory with a fresh Git repository ready for configuration.

## Task

1. Navigate into the `sandbox/` directory.
2. Check if Git already knows your name and email (`git config user.name` and `git config user.email`).
3. Set your name and email **locally** for this repository.
4. Verify the settings with `git config --list --local`.
5. Initialize Git in the `uninitialized-project/` subfolder and set a different name/email there to see local vs global isolation.

## ❓ Normal Question

What's the difference between `--global` and `--local` configuration in Git?

## 🔥 Tricky Question

You set `user.name` globally, but one specific repository shows a different author in its commits. What happened, and how would you check?

## ✅ How to Check Yourself

- `git config user.name` and `git config user.email` inside `sandbox/` return the values you set.
- `git config --list --local` shows only the local config entries for that repo.
- The `uninitialized-project/` repo has its own distinct `user.name` and `user.email`.

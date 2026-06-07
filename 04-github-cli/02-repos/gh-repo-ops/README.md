# gh Repo Ops ⭐

Repositories are the heart of GitHub. The `gh repo` family of commands lets you scaffold, clone, fork, and inspect repos without leaving the terminal.

## Setup

Run the setup script to create a local repo you can later connect to GitHub:

```bash
bash setup.sh
```

## Task

1. Create a new public repository on GitHub from the CLI (`gh repo create`).
2. Clone any public repository (or the one you just created).
3. Fork an existing public repository.
4. View repository metadata with `gh repo view`.

## ❓ Normal question

What's the difference between `gh repo create` and `git init` followed by `gh repo create --source`?

## 🔥 Tricky question

You forked a repo with `gh repo fork`. What remotes does your local clone have?

## ✅ How to check yourself

Run `gh repo view` and verify the output shows the description, URL, and default branch.

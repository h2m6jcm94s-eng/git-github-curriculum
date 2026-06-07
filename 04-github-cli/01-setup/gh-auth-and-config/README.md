# gh Auth and Config ⭐

The `gh` CLI is the official GitHub command-line tool. Before you can create repos, open PRs, or manage issues from the terminal, you must authenticate and configure your environment.

## Setup

Run the setup script to verify `gh` is installed and create a scratch directory:

```bash
bash setup.sh
```

## Task

1. Authenticate with GitHub: `gh auth login`.
2. Check your current authentication status.
3. Set your preferred text editor for `gh` (e.g., `nano`, `vim`, or `code --wait`).
4. Set the default repository for the current directory.

## ❓ Normal question

How do you check if you're authenticated with GitHub from the CLI?

## 🔥 Tricky question

You have multiple GitHub accounts (personal + work). How does `gh` handle switching between them?

## ✅ How to check yourself

Run `gh auth status` and confirm you see your account and active hosts.

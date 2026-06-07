# gh Run, Release, API & Aliases ⭐⭐

Beyond day-to-day repo work, `gh` can interact with Actions, Releases, the REST API, and even your own custom shortcuts.

## Setup

Run the setup script to create a local repo with a mock workflow file:

```bash
bash setup.sh
```

## Task

1. List recent workflow runs with `gh run list`.
2. View logs for a specific run.
3. Create a lightweight release with `gh release create`.
4. Query the GitHub API with `gh api`.
5. Create a custom `gh` alias for a command sequence you use often.

## ❓ Normal question

How do you watch a running workflow?

## 🔥 Tricky question

You want to create a `gh` alias that runs a common sequence of commands. Write the alias and explain where it's stored.

## ✅ How to check yourself

Run `gh alias list` and confirm your custom alias appears.

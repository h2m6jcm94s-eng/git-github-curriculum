# Create and View PRs ⭐⭐

Pull Requests are the primary code-review mechanism on GitHub. This lesson covers opening, listing, inspecting, and diffing PRs from the terminal.

## Setup

Run the setup script to create a local repo with a feature branch and some commits:

```bash
bash setup.sh
```

## Task

1. Push your feature branch to the remote.
2. Create a Pull Request with `gh pr create`.
3. List open PRs with `gh pr list`.
4. Check PR status with `gh pr status`.
5. View a specific PR and show its diff.

## ❓ Normal question

How do you create a PR from the CLI?

## 🔥 Tricky question

`gh pr create` opened a PR against the wrong base branch. How do you specify the correct one?

## ✅ How to check yourself

Run `gh pr status` and confirm your new PR appears in the output.

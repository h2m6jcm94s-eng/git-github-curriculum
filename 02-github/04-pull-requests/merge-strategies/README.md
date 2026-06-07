# Merge Strategies ⭐⭐

GitHub offers three ways to integrate a pull request. The strategy your team chooses shapes the repository's history and affects how you read `git log`.

## Setup

This lesson is conceptual. No sandbox is required.

## Step-by-step task

1. Open a repository where you have admin access and go to **Settings > General > Pull Requests**.
2. Look at the allowed merge strategies (merge commit, squash, rebase).
3. Open a recently merged PR and click the merge commit hash.
4. Observe the history shape:
   - Merge commit creates a diamond.
   - Squash creates a single new commit.
   - Rebase replays commits in a straight line.
5. Discuss with a partner: which strategy suits a small team versus a large open-source project?

## ❓ Normal question

What's the difference between the three merge strategies?

## 🔥 Tricky question

A team uses squash-merge. A developer wrote a detailed PR body but the title was "fix stuff". What does the main branch history look like?

## ✅ How to check yourself

You can draw or describe the history graph for each strategy and explain why PR titles matter on squash-merge teams.

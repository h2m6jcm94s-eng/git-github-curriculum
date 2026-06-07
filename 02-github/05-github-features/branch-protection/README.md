# Branch Protection ⭐⭐

Branch protection rules guard your important branches from accidental force-pushes, deletions, and unreviewed merges. They are a cornerstone of safe team workflows.

## Setup

This lesson is conceptual. No sandbox is required.

## Step-by-step task

1. Go to a repository's **Settings > Branches** (or **Rules > Branch protection rules**).
2. Add a rule for the `main` branch.
3. Enable:
   - **Restrict deletions**
   - **Require a pull request before merging**
   - **Require status checks to pass before merging**
4. Save the rule.
5. Try (in your mind or on a test repo) to push directly to `main` from the command line. Predict what GitHub will return.
6. Notice the checkbox that allows administrators to bypass restrictions.

## ❓ Normal question

What does branch protection prevent?

## 🔥 Tricky question

You enabled "Require pull request reviews before merging" but you (as admin) can still merge directly. Why, and how do you actually enforce it for yourself?

## ✅ How to check yourself

You can list at least three things branch protection blocks and explain how to close the admin-bypass loophole.

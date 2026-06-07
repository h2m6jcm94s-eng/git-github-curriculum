# Open a Pull Request ⭐

Pull requests are the primary mechanism for reviewing and merging code on GitHub. This lesson covers how to open a PR and when to use a draft.

## Setup

This lesson is conceptual. No sandbox is required.

## Step-by-step task

1. On a repository where you have push access (or a fork), create a feature branch:
   ```bash
   git checkout -b my-feature
   ```
2. Make a small edit, commit, and push the branch to GitHub.
3. In the GitHub UI, click the **Compare & pull request** banner (or go to Pull requests → New pull request).
4. Select your feature branch as the **compare** branch and `main` as the **base** branch.
5. Before submitting, notice the dropdown arrow next to the green **Create pull request** button. Click it and select **Create draft pull request**.
6. Submit the draft. Observe the "Draft" badge on the PR list.
7. When ready, click **Ready for review** to convert it to a normal PR.

## ❓ Normal question

What's a draft PR and when should you use it?

## 🔥 Tricky question

You opened a PR from main to main (same branch). What happens and why is this usually wrong?

## ✅ How to check yourself

You can explain the purpose of draft PRs and why the source and target branches in a PR must differ.

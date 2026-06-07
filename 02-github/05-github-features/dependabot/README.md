# Dependabot ⭐

Keeping dependencies current is vital for security and stability. Dependabot automates the tedious work of monitoring, alerting, and proposing updates for your project's dependencies.

## Setup

This lesson is conceptual. No sandbox is required.

## Step-by-step task

1. Open a repository and navigate to **Security > Dependabot alerts** (or **Insights > Dependency graph**).
2. If alerts exist, read the CVE details and the recommended patched version.
3. Go to **Settings > Code security and analysis** and note the Dependabot toggles.
4. Read the documentation for `.github/dependabot.yml`.
5. Draft a simple `dependabot.yml` for a Python project using `pip` in the root directory, checking weekly.

## ❓ Normal question

What does Dependabot do?

## 🔥 Tricky question

Dependabot opened a PR that updates a dependency. CI fails on that PR. Should you merge it anyway if it's a security update?

## ✅ How to check yourself

You can explain Dependabot's two core functions and justify the safe workflow for a failing security update PR.

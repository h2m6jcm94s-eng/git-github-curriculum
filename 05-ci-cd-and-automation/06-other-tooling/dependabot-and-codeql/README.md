# Dependabot and CodeQL ⭐

Keep dependencies fresh and scan for security vulnerabilities automatically.

## Setup

Run the setup script:

```bash
bash setup.sh
```

This creates:
- `sandbox/.github/dependabot.yml` — Dependabot configuration
- `sandbox/.github/workflows/codeql.yml` — CodeQL analysis workflow

## Task

1. Inspect both files.
2. Note how Dependabot is configured to check for npm updates weekly.
3. Note how CodeQL runs on `push`, `pull_request`, and a weekly schedule.
4. Push to a public repo.
5. Verify that Dependabot appears under **Insights > Dependency graph > Dependabot** and CodeQL appears under **Security > Code scanning alerts**.

## ❓ Normal Question

How do you enable CodeQL?

## 🔥 Tricky Question

CodeQL flagged a vulnerability in a dependency. Dependabot already opened a PR for it. What's the correct order of actions?

## ✅ How to check yourself

- Dependabot opens update PRs automatically.
- CodeQL shows a security alert with a suggested fix.
- You can explain the correct remediation order.

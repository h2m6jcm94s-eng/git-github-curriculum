# Codecov Setup ⭐⭐

Wire up Codecov so that every CI run uploads a coverage report and you can track coverage trends in PRs.

## Setup

Run the setup script:

```bash
bash setup.sh
```

This creates `sandbox/.github/workflows/coverage.yml` with a job that generates and uploads a coverage report.

## Task

1. Inspect `sandbox/.github/workflows/coverage.yml`.
2. Note how the test command outputs an LCOV or Cobertura report.
3. Observe the `codecov/codecov-action` step that uploads the report.
4. Push to a public repository, sign in to [codecov.io](https://about.codecov.io/) with GitHub, and select your repo.
5. Verify that a PR shows a Codecov comment with coverage data.

## ❓ Normal Question

How do you upload coverage to Codecov from GitHub Actions?

## 🔥 Tricky Question

Codecov marks your PR red for a 2% coverage drop, but you only edited a comment. Give two plausible causes (flaky/partial upload, carry-forward flags) and how you'd confirm.

## ✅ How to check yourself

- The Codecov dashboard shows a coverage graph for your repo.
- A PR comment appears with coverage delta.
- You can explain why an innocent change might show a coverage drop.

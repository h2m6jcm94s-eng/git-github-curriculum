# Semantic Issue / PR Classifier ⭐⭐

Auto-label issues and PRs based on title keywords, issue-form fields, or a lightweight classifier action.

## Setup

Run the setup script:

```bash
bash setup.sh
```

This creates:
- `sandbox/.github/workflows/semantic-labeler.yml` — a workflow that parses titles and applies labels
- `sandbox/.github/ISSUE_TEMPLATE/bug_report.yml` — an issue form with a `type` dropdown
- `sandbox/.github/workflows/issue-form-labeler.yml` — a workflow that maps issue-form fields to labels

## Task

1. Inspect all generated files.
2. Understand how title prefixes (`bug:`, `feat:`) map to labels.
3. Note how the issue-form field `type` is translated into a label via a workflow.
4. Push to a public repo and test by opening an issue with the bug template and a PR with `feat:` in the title.

## ❓ Normal Question

How do you auto-label an issue based on its title?

## 🔥 Tricky Question

Design a semantic classifier (title prefix / issue-form field / keyword or LLM action) that labels issues on open, and explain when path-based labeling is NOT enough.

## ✅ How to check yourself

- An issue titled `bug: crash on startup` receives the `bug` label automatically.
- A PR titled `feat: add dark mode` receives the `feature` label.
- You can articulate at least two scenarios where path-based labeling fails for issues.

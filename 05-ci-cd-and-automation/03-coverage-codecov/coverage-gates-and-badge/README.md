# Coverage Gates and Badge ⭐⭐

Configure Codecov to enforce coverage thresholds, gate PRs, and display a coverage badge in your README.

## Setup

Run the setup script:

```bash
bash setup.sh
```

This creates:
- `sandbox/codecov.yml` — coverage targets and flags
- `sandbox/.github/workflows/coverage.yml` — CI upload with flags
- `sandbox/README.md` — badge markup

## Task

1. Read `sandbox/codecov.yml` to see `coverage.status.project.target` and `threshold`.
2. Note how `flags` are defined and mapped in the workflow.
3. Push to a public repo.
4. Verify that Codecov posts a PR status check and a comment.
5. Replace the badge placeholder in `README.md` with your real repo path.

## ❓ Normal Question

How do you set a coverage threshold in `codecov.yml`?

## 🔥 Tricky Question

You want different coverage targets for new code vs overall project. How do you configure this?

## ✅ How to check yourself

- A PR that drops coverage below the threshold shows a red Codecov status check.
- The README renders a coverage percentage badge.
- You can explain the difference between `project` and `patch` targets.

# Triggers and Filters ⭐⭐

Learn to control exactly when your workflows run using triggers, branch filters, and path filters.

## Setup

Run the setup script to create example workflow files:

```bash
bash setup.sh
```

This creates `sandbox/.github/workflows/triggers.yml` with several trigger patterns.

## Task

1. Read `sandbox/.github/workflows/triggers.yml`.
2. Identify the triggers: `push`, `pull_request`, `workflow_dispatch`, and `schedule`.
3. Observe the branch filter (`main`) and the path filter (`src/**`).
4. Push the workflow to a public repo and test it by opening a PR that changes a file under `src/`.

## ❓ Normal Question

How do you trigger a workflow only on pushes to `main`?

## 🔥 Tricky Question

Write the `on:` filter so a job runs only when files under `src/**` change and only on `main`. Then explain why a required check that's path-filtered can block PRs forever ("expected — waiting" status) and how to avoid it.

## ✅ How to check yourself

- The workflow runs when you push to `main`.
- The workflow runs on a PR only when files in `src/**` are modified.
- You can explain the "expected — waiting" problem and the two common fixes.

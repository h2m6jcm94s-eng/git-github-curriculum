# CI Test Job ⭐

Add a continuous integration job that runs your test suite on every push and pull request.

## Setup

Run the setup script:

```bash
bash setup.sh
```

This creates `sandbox/.github/workflows/ci.yml` with a standard test job.

## Task

1. Inspect `sandbox/.github/workflows/ci.yml`.
2. Identify the checkout, setup, install, and test steps.
3. Push the workflow to a public repository.
4. Verify that the test job runs on `push` and `pull_request`.

## ❓ Normal Question

What does a typical test job look like in a workflow?

## 🔥 Tricky Question

A workflow on `pull_request` from a fork can't read your repo secrets. Why is that by design, what trigger would expose them, and why is that trigger dangerous?

## ✅ How to check yourself

- The Actions tab shows a test job that completes with pass or fail.
- You can describe the checkout → setup → install → test pipeline.
- You understand the fork security model for secrets.

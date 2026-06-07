# Smoke Tests ⭐⭐

Add a fast smoke-test job that validates the application can start before running the full, slower test suite.

## Setup

Run the setup script:

```bash
bash setup.sh
```

This creates `sandbox/.github/workflows/smoke.yml` with a dedicated smoke-test job.

## Task

1. Inspect `sandbox/.github/workflows/smoke.yml`.
2. Compare the smoke-test job (install + start server + health-check curl) with the full test job.
3. Push to a public repo and verify the smoke test finishes before the full test job.

## ❓ Normal Question

What's the difference between a smoke test and a full test suite?

## 🔥 Tricky Question

Your smoke test passes but the full test suite fails on the same commit. What does this tell you about the nature of the bug?

## ✅ How to check yourself

- The smoke job is faster than the full test job.
- You can articulate why smoke tests are placed early in CI (fast failure).
- You can reason about what a smoke-pass / full-fail result implies.

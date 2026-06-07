# Matrix and Cache ⭐⭐

Run your jobs across multiple environments and speed them up with caching.

## Setup

Run the setup script:

```bash
bash setup.sh
```

This creates `sandbox/.github/workflows/matrix.yml` showing a matrix build and `actions/cache` usage.

## Task

1. Inspect the generated workflow.
2. Identify the `strategy.matrix` keys (`os`, `node-version`).
3. Note how `actions/setup-node` and `actions/cache` are configured.
4. Push to a public repo and observe multiple parallel jobs in the Actions tab.

## ❓ Normal Question

What's a matrix build and when is it useful?

## 🔥 Tricky Question

CI passes locally but fails with "command not found." Name three structural causes (shell, missing setup step, OS/runner difference, PATH) and how you'd debug from the logs.

## ✅ How to check yourself

- You see multiple job variants in the Actions matrix view.
- Cache hits appear in the post-job step.
- You can explain why a command might be missing on a runner and how to trace it.

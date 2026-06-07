# CodeRabbit Setup ⭐

Enable AI-powered code review with CodeRabbit on a public repository.

## Setup

Run the setup script:

```bash
bash setup.sh
```

This creates `sandbox/.coderabbit.yaml`, a starter configuration file for CodeRabbit.

## Task

1. Visit [coderabbit.ai](https://coderabbit.ai) and install the GitHub App on your public repository.
2. Add `sandbox/.coderabbit.yaml` to the repo root.
3. Open a pull request and observe CodeRabbit's review comments.

## ❓ Normal Question

What is CodeRabbit and how do you enable it?

## 🔥 Tricky Question

CodeRabbit keeps commenting on generated files. How do you make it skip them?

## ✅ How to check yourself

- A PR receives an AI-generated review summary from CodeRabbit.
- You can point to `.coderabbit.yaml` in your repo root.
- You know how to exclude files from AI review.

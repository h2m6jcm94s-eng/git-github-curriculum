# Tuning and Triage ⭐⭐

Fine-tune CodeRabbit's behavior and learn how to handle AI review comments alongside human feedback.

## Setup

Run the setup script:

```bash
bash setup.sh
```

This creates `sandbox/.coderabbit.yaml` with path filters, a review profile, and generated-file exclusions.

## Task

1. Read `sandbox/.coderabbit.yaml`.
2. Identify the `profile`, `path_filters`, and `auto_review` settings.
3. Push the file to a public repo and open a PR that touches both source and generated files.
4. Verify that CodeRabbit skips the generated files and uses the chosen review tone.

## ❓ Normal Question

How do you tune CodeRabbit's review profile?

## 🔥 Tricky Question

CodeRabbit and a human reviewer gave conflicting advice. How do you decide which to follow?

## ✅ How to check yourself

- You can explain the difference between `chill` and `assertive` profiles.
- Generated files receive no AI comments.
- You have a clear decision framework for conflicting advice.

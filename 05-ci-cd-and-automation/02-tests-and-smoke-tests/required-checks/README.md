# Required Checks ⭐⭐

Protect your main branch by making CI checks mandatory before merge, and add a status badge to your README.

## Setup

Run the setup script:

```bash
bash setup.sh
```

This creates `sandbox/.github/workflows/ci.yml` and a sample `sandbox/README.md` with a badge placeholder.

## Task

1. Inspect the workflow and README badge markup.
2. Push both files to a public repository.
3. In the repository settings, go to **Settings > Branches > Add rule** (or **Rulesets**) and mark the CI job as required.
4. Verify that a failing check blocks merge.

## ❓ Normal Question

How do you make a CI check required?

## 🔥 Tricky Question

You made a check required but PRs from forks never get the check to pass. Why, and what's the fix?

## ✅ How to check yourself

- A failing CI run prevents the merge button from turning green.
- You can point to the branch protection rule in the repo settings.
- You understand the fork + required check interaction.

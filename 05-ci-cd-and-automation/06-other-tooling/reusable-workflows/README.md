# Reusable Workflows ⭐⭐⭐

Share CI logic across repositories with reusable workflows and composite actions.

## Setup

Run the setup script:

```bash
bash setup.sh
```

This creates:
- `sandbox/.github/workflows/reusable-lint.yml` — a reusable workflow
- `sandbox/.github/workflows/caller.yml` — a workflow that calls it
- `sandbox/.github/actions/composite-setup/action.yml` — a composite action

## Task

1. Read the reusable workflow and note the `workflow_call` trigger.
2. Read the caller workflow and note the `uses:` syntax pointing to the reusable workflow.
3. Inspect the composite action and note how it bundles multiple steps.
4. Push to a public repo and verify the caller triggers the reusable workflow.

## ❓ Normal Question

What's the difference between a reusable workflow and a composite action?

## 🔥 Tricky Question

You have a reusable workflow that calls a composite action that calls another reusable workflow. Why does this fail?

## ✅ How to check yourself

- The caller workflow shows a step that invokes the reusable workflow as a job.
- The composite action shows a bundle of steps, not a job.
- You can explain the nesting restriction in GitHub Actions.

# Path Labeler ⭐

Automatically label pull requests based on which files were changed.

## Setup

Run the setup script:

```bash
bash setup.sh
```

This creates:
- `sandbox/.github/labeler.yml` — path-to-label mappings
- `sandbox/.github/workflows/labeler.yml` — the workflow that applies labels

## Task

1. Inspect both files.
2. Map paths to labels (e.g., `docs/**` → `documentation`, `src/**` → `code`).
3. Push to a public repo.
4. Open a PR that changes files under `docs/` and verify the `documentation` label is applied automatically.

## ❓ Normal Question

How do you auto-label PRs based on changed files?

## 🔥 Tricky Question

`actions/labeler` can't tell a bug issue from a feature one. Why does path-based labeling fail for issues?

## ✅ How to check yourself

- A PR receives the correct label without manual intervention.
- You can explain the scope and limitations of path-based labeling.

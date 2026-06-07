# CODEOWNERS and Conventional Commits ⭐⭐

Require expert review for sensitive paths and automate releases with semantic versioning.

## Setup

Run the setup script:

```bash
bash setup.sh
```

This creates:
- `sandbox/CODEOWNERS` — path-to-owner mappings
- `sandbox/.github/workflows/release.yml` — semantic-release workflow
- `sandbox/README.md` — conventional commits badge

## Task

1. Inspect `CODEOWNERS` and note how paths map to GitHub teams or users.
2. Read the release workflow and note the `semantic-release` step.
3. Push to a public repo.
4. In repo settings, enable branch protection and require CODEOWNERS approval for sensitive paths.
5. Open a PR that changes a file under `src/` and verify the owner is requested.

## ❓ Normal Question

What does CODEOWNERS do?

## 🔥 Tricky Question

You use conventional commits and semantic-release. A PR title says `fix: something` but the squash-merge commit message was edited to remove the prefix. What happens to the release?

## ✅ How to check yourself

- A PR touching `src/` automatically requests review from the listed owner.
- Merging a `feat:` PR triggers a minor version bump (or patch for `fix:`).
- You can explain the relationship between the squash-merge message and release automation.

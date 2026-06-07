# First Workflow ⭐

This lesson introduces the anatomy of a GitHub Actions workflow file. You'll learn what a workflow is, how it lives in `.github/workflows/`, and the minimum sections needed to make it run.

## Setup

Run the setup script to create a sandbox workflow file:

```bash
bash setup.sh
```

This creates `sandbox/.github/workflows/hello.yml`, a minimal runnable workflow.

## Task

1. Inspect `sandbox/.github/workflows/hello.yml`.
2. Identify the four minimum sections: `on`, `jobs`, `steps`, and `runs-on`.
3. Note how `actions/checkout` is used to bring your repository code into the runner.
4. Push this file to a public repository under `.github/workflows/hello.yml` and watch the Actions tab for a run.

## ❓ Normal Question

What are the minimum sections of a workflow file?

## 🔥 Tricky Question

You committed a workflow but it doesn't run. Name three reasons.

## ✅ How to check yourself

- The Actions tab shows a green check next to your latest commit.
- You can point to `on`, `jobs`, `steps`, and `runs-on` in the file and explain what each does.

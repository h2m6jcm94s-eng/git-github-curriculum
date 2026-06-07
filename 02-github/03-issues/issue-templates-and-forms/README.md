# Issue Templates and Forms ⭐⭐

Well-designed issue templates turn vague bug reports into actionable tickets. YAML-based issue forms go even further by enforcing structure through required fields.

## Setup

This lesson is hands-on. Run the sandbox builder before you begin:

```bash
bash setup.sh
```

## Step-by-step task

1. `cd` into `sandbox/project-repo`.
2. Inspect the existing files in `.github/ISSUE_TEMPLATE/`.
3. Create a new bug-report form named `bug_report.yml` with at least three fields:
   - A textarea for the bug description.
   - A textarea for reproduction steps.
   - An input for environment details.
4. Validate your YAML syntax (you can use an online YAML linter or `yamllint` if installed).
5. Stage and commit the new template:
   ```bash
   git add .github/ISSUE_TEMPLATE/bug_report.yml
   git commit -m "Add bug report issue form"
   ```
6. Review the existing `feature_request.md` and note the difference between a Markdown template and a YAML form.

## ❓ Normal question

What's the difference between an issue template and an issue form?

## 🔥 Tricky question

You added an issue template but it doesn't appear when users click "New issue". Name three possible causes.

## ✅ How to check yourself

- The sandbox repo contains valid templates.
- You can explain why a template might be invisible to users.
- Your new `bug_report.yml` has no syntax errors and follows GitHub's issue form schema.

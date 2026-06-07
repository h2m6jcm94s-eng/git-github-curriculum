#!/usr/bin/env bash
set -e

mkdir -p sandbox/.github/workflows sandbox/.github/ISSUE_TEMPLATE

cat > sandbox/.github/workflows/semantic-labeler.yml << 'EOF'
name: Semantic Labeler

on:
  issues:
    types: [opened, edited]
  pull_request:
    types: [opened, edited]

jobs:
  label:
    runs-on: ubuntu-latest
    permissions:
      issues: write
      pull-requests: write
    steps:
      - name: Label from title prefix
        uses: actions/github-script@v7
        with:
          script: |
            const title = context.payload.issue?.title || context.payload.pull_request?.title || '';
            const labels = [];
            if (title.toLowerCase().startsWith('bug:')) labels.push('bug');
            if (title.toLowerCase().startsWith('feat:')) labels.push('feature');
            if (title.toLowerCase().startsWith('docs:')) labels.push('documentation');
            if (labels.length === 0) return;
            github.rest.issues.addLabels({
              owner: context.repo.owner,
              repo: context.repo.repo,
              issue_number: context.issue.number,
              labels
            });
EOF

cat > sandbox/.github/ISSUE_TEMPLATE/bug_report.yml << 'EOF'
name: Bug Report
 description: File a bug report
title: "bug: "
body:
  - type: dropdown
    id: type
    attributes:
      label: Issue Type
      options:
        - Bug
        - Performance
        - Security
  - type: textarea
    id: description
    attributes:
      label: Description
EOF

cat > sandbox/.github/workflows/issue-form-labeler.yml << 'EOF'
name: Issue Form Labeler

on:
  issues:
    types: [opened]

jobs:
  label:
    runs-on: ubuntu-latest
    permissions:
      issues: write
    steps:
      - name: Map issue form field to label
        uses: actions/github-script@v7
        with:
          script: |
            const body = context.payload.issue.body || '';
            const labels = [];
            if (body.includes('Security')) labels.push('security');
            if (body.includes('Performance')) labels.push('performance');
            if (labels.length === 0) return;
            github.rest.issues.addLabels({
              owner: context.repo.owner,
              repo: context.repo.repo,
              issue_number: context.issue.number,
              labels
            });
EOF

echo "Created semantic labeler workflows and issue template"

#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

rm -rf sandbox
mkdir sandbox
cd sandbox

mkdir project-repo
cd project-repo
git init
git branch -m main
git config user.email "learner@example.com"
git config user.name "Learner"

mkdir -p .github/ISSUE_TEMPLATE

cat > .github/ISSUE_TEMPLATE/config.yml << 'EOF'
blank_issues_enabled: false
contact_links:
  - name: Ask a question
    url: https://github.com/org/repo/discussions
    about: Please ask and answer questions here.
EOF

cat > .github/ISSUE_TEMPLATE/feature_request.md << 'EOF'
---
name: Feature request
about: Suggest an idea for this project
title: ''
labels: enhancement
assignees: ''

---

**Is your feature request related to a problem? Please describe.**
A clear and concise description of what the problem is.

**Describe the solution you'd like**
A clear and concise description of what you want to happen.
EOF

git add .
git commit -m "Scaffold repo with issue templates"
git branch -M main
cd ..

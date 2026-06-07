#!/usr/bin/env bash
set -euo pipefail

mkdir -p sandbox && cd sandbox
git init --quiet
git config user.email "learner@example.com"
git config user.name "Learner"

mkdir -p .github/workflows
cat > .github/workflows/ci.yml << 'EOF'
name: CI
on: [push]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: echo "Hello from Actions"
EOF

echo "# Advanced gh" > README.md
git add .
git commit -m "Initial commit with mock workflow" --quiet

echo "Sandbox repo ready in $(pwd)"
echo "Tip: Push to GitHub to see real workflow runs."

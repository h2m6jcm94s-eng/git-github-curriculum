#!/usr/bin/env bash
set -euo pipefail

mkdir -p sandbox && cd sandbox
git init --quiet
git config user.email "learner@example.com"
git config user.name "Learner"

git checkout -b main --quiet || git checkout main --quiet
echo "# Project" > README.md
git add README.md
git commit -m "Initial commit" --quiet

git checkout -b pr-branch --quiet
echo "Change from PR" >> README.md
git add README.md
git commit -m "PR change" --quiet
git checkout main --quiet

echo "Sandbox repo ready in $(pwd)"
echo "Tip: Add a remote to practice gh pr checkout against a real PR."

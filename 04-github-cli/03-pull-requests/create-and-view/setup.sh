#!/usr/bin/env bash
set -euo pipefail

mkdir -p sandbox && cd sandbox
git init --quiet
git config user.email "learner@example.com"
git config user.name "Learner"

git checkout -b main --quiet || git checkout main --quiet
echo "# Base" > README.md
git add README.md
git commit -m "Base commit" --quiet

git checkout -b feature --quiet
echo "Feature work" >> README.md
git add README.md
git commit -m "Add feature" --quiet

echo "Sandbox repo with feature branch ready in $(pwd)"
echo "Tip: Add a remote and push to practice gh pr create."

#!/usr/bin/env bash
set -euo pipefail

mkdir -p sandbox && cd sandbox
git init --quiet
git config user.email "learner@example.com"
git config user.name "Learner"

git checkout -b main --quiet || git checkout main --quiet
echo "Line 1" > file.txt
git add file.txt
git commit -m "Initial" --quiet

git checkout -b feature --quiet
echo "Line 2" >> file.txt
git commit -am "Feature A" --quiet
echo "Line 3" >> file.txt
git commit -am "Feature B" --quiet
git checkout main --quiet

echo "Sandbox repo ready in $(pwd)"
echo "Tip: Push branches and open PRs on GitHub to practice gh pr merge."

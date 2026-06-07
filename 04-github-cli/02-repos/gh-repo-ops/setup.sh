#!/usr/bin/env bash
set -euo pipefail

mkdir -p sandbox && cd sandbox
git init --quiet
git config user.email "learner@example.com"
git config user.name "Learner"
echo "# Scratch Repo" > README.md
git add README.md
git commit -m "Initial commit" --quiet
echo "Sandbox repo ready in $(pwd)"

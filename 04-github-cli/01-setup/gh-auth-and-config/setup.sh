#!/usr/bin/env bash
set -euo pipefail

if ! command -v gh &> /dev/null; then
  echo "❌ gh CLI is not installed. Install it first: https://cli.github.com/"
  exit 1
fi

echo "✅ gh CLI found: $(gh --version | head -n 1)"

mkdir -p sandbox && cd sandbox
git init --quiet
git config user.email "learner@example.com"
git config user.name "Learner"
echo "Sandbox repo ready in $(pwd)"

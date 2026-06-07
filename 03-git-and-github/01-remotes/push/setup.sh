#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SANDBOX="$SCRIPT_DIR/sandbox"
REMOTE="$SCRIPT_DIR/remote.git"

rm -rf "$REMOTE" "$SANDBOX"

# Create a bare remote
mkdir -p "$REMOTE"
git init --bare "$REMOTE"
git -c safe.bareRepository=all --git-dir="$REMOTE" symbolic-ref HEAD refs/heads/main

# Seed the remote
git clone "$REMOTE" "$SANDBOX" --quiet
cd "$SANDBOX"
git config user.email "learner@local.dev"
git config user.name "Learner"
echo "hello" > file.txt
git add file.txt
git commit -m "Initial commit"
git branch -M main
git push -u origin main

echo "Sandbox ready in $SANDBOX"

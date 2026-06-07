#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REMOTE="$SCRIPT_DIR/remote.git"
SANDBOX="$SCRIPT_DIR/sandbox"

rm -rf "$REMOTE" "$SANDBOX"

# Create bare remote
mkdir -p "$REMOTE"
git init --bare "$REMOTE"
git -c safe.bareRepository=all --git-dir="$REMOTE" symbolic-ref HEAD refs/heads/main

# Seed remote with initial commit
TMP="$(mktemp -d)"
git clone "$REMOTE" "$TMP" --quiet
cd "$TMP"
git config user.email "remote@local.dev"
git config user.name "Remote"
echo "base" > file.txt
git add file.txt
git commit -m "Initial commit"
git branch -M main
git push --quiet
cd "$SCRIPT_DIR"
rm -rf "$TMP"

# Clone as sandbox
git clone "$REMOTE" "$SANDBOX" --quiet
cd "$SANDBOX"
git config user.email "learner@local.dev"
git config user.name "Learner"

# Simulate teammate pushing a commit after you cloned
TMP2="$(mktemp -d)"
git clone "$REMOTE" "$TMP2" --quiet
cd "$TMP2"
git config user.email "teammate@local.dev"
git config user.name "Teammate"
echo "teammate line" >> file.txt
git add file.txt
git commit -m "Teammate commit"
git branch -M main
git push --quiet
cd "$SCRIPT_DIR"
rm -rf "$TMP2"

# Add a local commit in sandbox so push will be rejected
cd "$SANDBOX"
echo "my line" >> file.txt
git add file.txt
git commit -m "My commit"

echo "Sandbox ready in $SANDBOX"
echo "Try to push main — it will be rejected."

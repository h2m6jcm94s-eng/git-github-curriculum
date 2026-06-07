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

# Clone sandbox
git clone "$REMOTE" "$SANDBOX" --quiet
cd "$SANDBOX"
git config user.email "learner@local.dev"
git config user.name "Learner"

# Add a secrets file and legitimate commits, then push
for i in 1 2; do
  echo "line $i" >> file.txt
  git add file.txt
  git commit -m "Commit $i"
done

echo "API_KEY=supersecret123" > secrets.env
git add secrets.env
git commit -m "Add secrets file (accident)"

for i in 3 4; do
  echo "line $i" >> file.txt
  git add file.txt
  git commit -m "Commit $i"
done

git push --quiet

echo "Sandbox ready in $SANDBOX"
echo "A secrets.env file exists in history and has been pushed."

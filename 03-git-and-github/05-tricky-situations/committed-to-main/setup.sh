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

# Simulate 4 accidental commits on main (unpushed)
for i in 1 2 3 4; do
  echo "accidental $i" >> file.txt
  git add file.txt
  git commit -m "Accidental commit $i"
done

echo "Sandbox ready in $SANDBOX"
echo "You have 4 unpushed commits on main."

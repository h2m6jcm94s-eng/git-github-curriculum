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

# Seed remote
TMP="$(mktemp -d)"
git clone "$REMOTE" "$TMP" --quiet
cd "$TMP"
git config user.email "remote@local.dev"
git config user.name "Remote"
echo "1" > seq.txt
git add seq.txt
git commit -m "Commit 1"
git branch -M main
git push --quiet
cd "$SCRIPT_DIR"
rm -rf "$TMP"

# Clone sandbox
git clone "$REMOTE" "$SANDBOX" --quiet
cd "$SANDBOX"
git config user.email "learner@local.dev"
git config user.name "Learner"

# Teammate pushes commit 2 after clone
TMP2="$(mktemp -d)"
git clone "$REMOTE" "$TMP2" --quiet
cd "$TMP2"
git config user.email "teammate@local.dev"
git config user.name "Teammate"
echo "2" >> seq.txt
git add seq.txt
git commit -m "Commit 2 (remote)"
git branch -M main
git push --quiet
cd "$SCRIPT_DIR"
rm -rf "$TMP2"

# Learner makes local commit 3 (diverges from remote)
cd "$SANDBOX"
echo "3" >> seq.txt
git add seq.txt
git commit -m "Commit 3 (local)"

# Create a backup tag so learner can reset and try again
git tag backup-before-pull

echo "Sandbox ready in $SANDBOX"
echo "main and origin/main have diverged."

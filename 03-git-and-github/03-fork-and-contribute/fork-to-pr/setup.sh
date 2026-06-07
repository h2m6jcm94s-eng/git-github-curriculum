#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
UPSTREAM="$SCRIPT_DIR/upstream.git"
FORK="$SCRIPT_DIR/fork.git"
SANDBOX="$SCRIPT_DIR/sandbox"

rm -rf "$UPSTREAM" "$FORK" "$SANDBOX"

# Create upstream bare repo
mkdir -p "$UPSTREAM"
git init --bare "$UPSTREAM"
git -c safe.bareRepository=all --git-dir="$UPSTREAM" symbolic-ref HEAD refs/heads/main

# Seed upstream
TMP_UP="$(mktemp -d)"
git clone "$UPSTREAM" "$TMP_UP" --quiet
cd "$TMP_UP"
git config user.email "upstream@local.dev"
git config user.name "Upstream"
echo "base" > base.txt
git add base.txt
git commit -m "Initial commit"
git branch -M main
git push --quiet
cd "$SCRIPT_DIR"
rm -rf "$TMP_UP"

# Create fork from upstream
mkdir -p "$FORK"
git clone --bare "$UPSTREAM" "$FORK" --quiet
git -c safe.bareRepository=all --git-dir="$FORK" symbolic-ref HEAD refs/heads/main

# Clone fork as sandbox
git clone "$FORK" "$SANDBOX" --quiet
cd "$SANDBOX"
git config user.email "learner@local.dev"
git config user.name "Learner"

echo "Sandbox ready in $SANDBOX"
echo "Upstream: $UPSTREAM"
echo "Fork:     $FORK"

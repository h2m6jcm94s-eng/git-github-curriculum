#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
UPSTREAM="$SCRIPT_DIR/upstream.git"
FORK="$SCRIPT_DIR/fork.git"
SANDBOX="$SCRIPT_DIR/sandbox"

rm -rf "$UPSTREAM" "$FORK" "$SANDBOX"

# Create upstream (canonical) bare repo
mkdir -p "$UPSTREAM"
git init --bare "$UPSTREAM"
git -c safe.bareRepository=all --git-dir="$UPSTREAM" symbolic-ref HEAD refs/heads/main

# Seed upstream with an initial commit via a temp repo
TMP_UP="$(mktemp -d)"
git clone "$UPSTREAM" "$TMP_UP" --quiet
cd "$TMP_UP"
git config user.email "upstream@local.dev"
git config user.name "Upstream"
echo "project base" > README.md
git add README.md
git commit -m "Initial commit"
git branch -M main
git push --quiet
cd "$SCRIPT_DIR"
rm -rf "$TMP_UP"

# Create fork bare repo cloned from upstream
mkdir -p "$FORK"
git clone --bare "$UPSTREAM" "$FORK" --quiet
git -c safe.bareRepository=all --git-dir="$FORK" symbolic-ref HEAD refs/heads/main

# Learner clones the fork
git clone "$FORK" "$SANDBOX" --quiet
cd "$SANDBOX"
git config user.email "learner@local.dev"
git config user.name "Learner"
git remote rename origin origin-fork 2>/dev/null || true
# We leave origin unset so learner practices adding upstream and origin

# Re-add fork as origin
git remote add origin "$FORK"
git fetch origin --quiet

# Ensure main tracks origin/main
git branch -u origin/main main 2>/dev/null || true

echo "Sandbox ready in $SANDBOX"
echo "Upstream: $UPSTREAM"
echo "Fork:     $FORK"

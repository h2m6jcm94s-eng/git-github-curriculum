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

# Seed remote with a few commits
TMP="$(mktemp -d)"
git clone "$REMOTE" "$TMP" --quiet
cd "$TMP"
git config user.email "remote@local.dev"
git config user.name "Remote"
seq 1 3 | while read n; do
  echo "line $n" >> log.txt
  git add log.txt
  git commit -m "Commit $n"
done
git branch -M main
git push --quiet
cd "$SCRIPT_DIR"
rm -rf "$TMP"

# Clone sandbox
git clone "$REMOTE" "$SANDBOX" --quiet
cd "$SANDBOX"
git config user.email "learner@local.dev"
git config user.name "Learner"

# Teammate adds commit 4 after learner cloned
TMP2="$(mktemp -d)"
git clone "$REMOTE" "$TMP2" --quiet
cd "$TMP2"
git config user.email "teammate@local.dev"
git config user.name "Teammate"
echo "line 4 (teammate)" >> log.txt
git add log.txt
git commit -m "Commit 4 (teammate)"
git branch -M main
git push --quiet
cd "$SCRIPT_DIR"
rm -rf "$TMP2"

# Learner makes local commits 5 and 6 (will want to squash/rebase)
cd "$SANDBOX"
git fetch origin
git reset --hard origin/main
echo "line 5" >> log.txt
git add log.txt
git commit -m "Commit 5 (local)"
echo "line 6" >> log.txt
git add log.txt
git commit -m "Commit 6 (local)"

echo "Sandbox ready in $SANDBOX"
echo "Remote main has 4 commits. Your local main has 6 commits (including 2 new local ones after commit 3)."

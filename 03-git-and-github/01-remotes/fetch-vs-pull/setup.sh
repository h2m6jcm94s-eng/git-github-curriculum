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

# Helper function to push commits into the bare remote from a temp repo
push_to_remote() {
  local msg="$1"
  local tmp="$(mktemp -d)"
  git clone "$REMOTE" "$tmp" --quiet
  cd "$tmp"
  git config user.email "remote@local.dev"
  git config user.name "Remote User"
  echo "$msg" >> log.txt
  git add log.txt
  git commit -m "$msg"
  git branch -M main
  git push --quiet
  cd "$SCRIPT_DIR"
  rm -rf "$tmp"
}

# Seed the remote
push_to_remote "Initial commit"

# Clone as the learner's sandbox
git clone "$REMOTE" "$SANDBOX" --quiet
cd "$SANDBOX"
git config user.email "learner@local.dev"
git config user.name "Learner"

# Add more commits to the remote *after* the clone, so learner can fetch them
push_to_remote "Remote commit A"
push_to_remote "Remote commit B"

echo "Sandbox ready in $SANDBOX"
echo "The remote has new commits that your clone hasn't seen yet."

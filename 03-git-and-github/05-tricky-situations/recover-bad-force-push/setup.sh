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

# Seed remote with initial commit via temp repo
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

# Clone sandbox and add 5 commits
git clone "$REMOTE" "$SANDBOX" --quiet
cd "$SANDBOX"
git config user.email "learner@local.dev"
git config user.name "Learner"

for i in 1 2 3 4 5; do
  echo "line $i" >> file.txt
  git add file.txt
  git commit -m "Commit $i"
done

git push --quiet

# Now force-push back to commit 1, "losing" commits 2-5 on the remote
# We'll do this from a separate temp clone so the learner's sandbox still has the old commits locally
TMP2="$(mktemp -d)"
git clone "$REMOTE" "$TMP2" --quiet
cd "$TMP2"
git config user.email "badactor@local.dev"
git config user.name "Bad Actor"
# Reset to the second commit (Commit 1), losing 2-5
OLD_HASH="$(git rev-parse HEAD~4)"
git reset --hard "$OLD_HASH"
git branch -M main
git push --force --quiet
cd "$SCRIPT_DIR"
rm -rf "$TMP2"

echo "Sandbox ready in $SANDBOX"
echo "5 commits were force-pushed away on the remote."
echo "Your local sandbox still has them in its reflog."

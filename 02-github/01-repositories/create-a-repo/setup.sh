#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

rm -rf sandbox
mkdir sandbox
cd sandbox

# Simulate a GitHub repo created with a README
git init --bare upstream.git

git clone upstream.git tmp-clone
cd tmp-clone
git config user.email "learner@example.com"
git config user.name "Learner"
echo "# My Project" > README.md
git add README.md
git commit -m "Initial commit: add README"
git branch -M main
git push origin main
cd ..
rm -rf tmp-clone

# Create an existing local project that wants to push here
mkdir local-project
cd local-project
git init
git branch -m main
git config user.email "learner@example.com"
git config user.name "Learner"
echo "print('hello')" > app.py
git add app.py
git commit -m "Initial local commit"
git branch -M main
cd ..

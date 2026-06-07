#!/bin/bash
set -e

rm -rf sandbox
mkdir sandbox
cd sandbox

git init
git branch -m main

git config user.email "learner@example.com"
git config user.name "Learner"

git branch -M main

# Commits on main
for c in A B C; do
  echo "$c" >> main.txt
  git add main.txt
  git commit -m "Commit $c"
done

# Feature branch
git checkout -b feature
for c in D E; do
  echo "$c" >> feature.txt
  git add feature.txt
  git commit -m "Commit $c"
done

git checkout main

echo "Sandbox ready. cd into sandbox/ and practice merging."

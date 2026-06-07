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

for c in A B; do
  echo "$c" >> main.txt
  git add main.txt
  git commit -m "Commit $c on main"
done

git checkout -b feature
for c in C D; do
  echo "$c" >> feature.txt
  git add feature.txt
  git commit -m "Commit $c on feature"
done

git checkout main
echo "E" >> main.txt
git add main.txt
git commit -m "Commit E on main"

git checkout feature

echo "Sandbox ready. cd into sandbox/ and rebase feature onto main."

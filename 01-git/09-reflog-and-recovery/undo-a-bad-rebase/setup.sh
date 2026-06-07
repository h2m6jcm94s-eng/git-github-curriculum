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

for c in M1 M2; do
  echo "$c" >> main.txt
  git add main.txt
  git commit -m "$c on main"
done

git checkout -b feature
for c in F1 F2 F3; do
  echo "$c" >> feature.txt
  git add feature.txt
  git commit -m "$c on feature"
done

git checkout main
for c in M3 M4; do
  echo "$c" >> main.txt
  git add main.txt
  git commit -m "$c on main"
done

git checkout feature

echo "Sandbox ready. cd into sandbox/ and recover from a bad rebase."

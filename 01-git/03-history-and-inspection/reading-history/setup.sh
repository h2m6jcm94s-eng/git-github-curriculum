#!/bin/bash
set -e

rm -rf sandbox
mkdir sandbox
cd sandbox

git init
git branch -m main

git config user.email "learner@example.com"
git config user.name "Learner"

for i in {1..6}; do
  echo "Line $i" >> file.txt
  git add file.txt
  git commit -m "Commit $i"
done

git checkout -b feature HEAD~3
for i in {1..3}; do
  echo "Feature $i" >> feature.txt
  git add feature.txt
  git commit -m "Feature commit $i"
done

git checkout main

echo "Sandbox ready. cd into sandbox/ and inspect history."

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

echo "Base content" > work.txt
git add work.txt
git commit -m "Initial commit"

git checkout -b feature
echo "Feature content" > feature.txt
git add feature.txt
git commit -m "Feature commit"

git checkout main
echo "New work" >> work.txt

echo "Sandbox ready. cd into sandbox/ and practice stashing."

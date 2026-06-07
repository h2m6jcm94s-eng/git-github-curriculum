#!/bin/bash
set -e

rm -rf sandbox
mkdir sandbox
cd sandbox

git init
git branch -m main

git config user.email "learner@example.com"
git config user.name "Learner"

echo "password=12345" > secrets.txt

git add secrets.txt
git commit -m "Initial commit (placeholder)"

# We'll leave secrets.txt in history for the learner to ignore going forward
git rm --cached secrets.txt
git commit -m "Remove secrets from tracking"

echo "Sandbox ready. cd into sandbox/ and set up .gitignore and amend."

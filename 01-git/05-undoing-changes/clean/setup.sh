#!/bin/bash
set -e

rm -rf sandbox
mkdir sandbox
cd sandbox

git init
git branch -m main

git config user.email "learner@example.com"
git config user.name "Learner"

echo "Tracked file" > tracked.txt
git add tracked.txt
git commit -m "Initial commit"

echo "Untracked file" > temp.txt
mkdir tempdir
echo "Nested untracked" > tempdir/nested.txt

echo "Sandbox ready. cd into sandbox/ and practice git clean."

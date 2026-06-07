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

echo "Base" > base.txt
git add base.txt
git commit -m "Base commit"

git checkout -b feature

echo "A" > a.txt
git add a.txt
git commit -m "Add feature A"

echo "B" > b.txt
git add b.txt
git commit -m "Add feature B"

echo "WIP" > debug.txt
git add debug.txt
git commit -m "WIP: debug"

echo "C" > c.txt
git add c.txt
git commit -m "Add feature C"

echo "Sandbox ready. cd into sandbox/ and run interactive rebase."

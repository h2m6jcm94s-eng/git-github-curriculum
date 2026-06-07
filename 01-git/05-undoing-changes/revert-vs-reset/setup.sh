#!/bin/bash
set -e

rm -rf sandbox
mkdir sandbox
cd sandbox

git init
git branch -m main

git config user.email "learner@example.com"
git config user.name "Learner"

echo "Line 1" > file.txt
git add file.txt
git commit -m "Commit 1: initial"

echo "Line 2 (bug)" >> file.txt
git add file.txt
git commit -m "Commit 2: add bug"

echo "Line 3" >> file.txt
git add file.txt
git commit -m "Commit 3: more work"

echo "Sandbox ready. cd into sandbox/ and compare revert vs reset."

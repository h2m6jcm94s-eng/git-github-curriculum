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

echo "Base A" > file-a.txt
echo "Base B" > file-b.txt
git add file-a.txt file-b.txt
git commit -m "Initial commit"

echo "Change A1" >> file-a.txt
echo "Change B1" >> file-b.txt

echo "Sandbox ready. cd into sandbox/ and practice advanced stash."

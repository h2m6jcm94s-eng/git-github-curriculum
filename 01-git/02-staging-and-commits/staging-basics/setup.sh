#!/bin/bash
set -e

rm -rf sandbox
mkdir sandbox
cd sandbox

git init
git branch -m main

git config user.email "learner@example.com"
git config user.name "Learner"

echo "Initial content" > readme.txt
git add readme.txt
git commit -m "Initial commit"

echo "Sandbox ready. cd into sandbox/ and practice staging."

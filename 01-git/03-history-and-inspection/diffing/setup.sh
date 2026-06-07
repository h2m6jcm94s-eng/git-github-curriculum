#!/bin/bash
set -e

rm -rf sandbox
mkdir sandbox
cd sandbox

git init
git branch -m main

git config user.email "learner@example.com"
git config user.name "Learner"

echo "Initial data" > data.txt
git add data.txt
git commit -m "Initial data"

echo "More data" >> data.txt
git add data.txt
git commit -m "Add more data"

echo "Sandbox ready. cd into sandbox/ and practice diffing."

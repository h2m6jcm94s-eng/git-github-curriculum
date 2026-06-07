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

for c in A B C D E; do
  echo "$c" >> file.txt
  git add file.txt
  git commit -m "Commit $c"
done

echo "Sandbox ready. cd into sandbox/ and recover lost work."

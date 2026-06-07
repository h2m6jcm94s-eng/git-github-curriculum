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

for i in {1..10}; do
  if [ "$i" -eq 7 ]; then
    echo "BUG" >> file.txt
  else
    echo "Line $i" >> file.txt
  fi
  git add file.txt
  git commit -m "Commit $i"
done

echo "Sandbox ready. cd into sandbox/ and find the bug with bisect."

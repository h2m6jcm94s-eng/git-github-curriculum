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

for c in M1 M2; do
  echo "$c" >> shared.txt
  git add shared.txt
  git commit -m "$c on main"
done

git checkout -b feature

echo "B" >> shared.txt
git add shared.txt
git commit -m "Commit B"

echo "C" >> shared.txt
git add shared.txt
git commit -m "Commit C"

echo "D" >> shared.txt
git add shared.txt
git commit -m "Commit D"

git checkout main
echo "Main update" >> shared.txt
git add shared.txt
git commit -m "Main update"

git checkout feature

echo "Sandbox ready. cd into sandbox/ and handle rebase conflicts."

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

cat > recipe.txt << 'EOF'
# Recipe

## Ingredients
- Flour
- Sugar
EOF

git add recipe.txt
git commit -m "Initial recipe"

git checkout -b feature
cat > recipe.txt << 'EOF'
# Recipe

## Ingredients
- Flour
- Sugar
- Chocolate
EOF

git add recipe.txt
git commit -m "Add chocolate"

git checkout main
cat > recipe.txt << 'EOF'
# Recipe

## Ingredients
- Flour
- Sugar
- Vanilla
EOF

git add recipe.txt
git commit -m "Add vanilla"

echo "Sandbox ready. cd into sandbox/ and resolve the merge conflict."

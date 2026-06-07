#!/bin/bash
set -e

rm -rf sandbox
mkdir sandbox
cd sandbox

git init
git branch -m main

git config user.email "learner@example.com"
git config user.name "Learner"

cat > recipe.txt << 'EOF'
# Chocolate Cake Recipe

## Ingredients
- Flour: 2 cups
- Sugar: 1 cup
- Cocoa: 0.5 cups

## Instructions
1. Mix dry ingredients.
2. Add wet ingredients.
3. Bake at 350F for 30 min.
EOF

git add recipe.txt
git commit -m "Initial recipe"

echo "Sandbox ready. cd into sandbox/ and practice partial staging."

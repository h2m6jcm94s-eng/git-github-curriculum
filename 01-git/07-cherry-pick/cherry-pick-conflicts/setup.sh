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

cat > shared.txt << 'EOF'
line1
line2
line3
EOF

git add shared.txt
git commit -m "Initial shared"

git checkout -b feature
cat > shared.txt << 'EOF'
line1
feature-line
line3
EOF

git add shared.txt
git commit -m "Feature change"

git checkout main
cat > shared.txt << 'EOF'
line1
main-line
line3
EOF

git add shared.txt
git commit -m "Main change"

git checkout feature
echo "Extra" > extra.txt
git add extra.txt
git commit -m "Feature extra"

git checkout main

echo "Sandbox ready. cd into sandbox/ and handle cherry-pick conflicts."

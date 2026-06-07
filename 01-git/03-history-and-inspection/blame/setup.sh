#!/bin/bash
set -e

rm -rf sandbox
mkdir sandbox
cd sandbox

git init
git branch -m main

git config user.email "learner@example.com"
git config user.name "Learner"

cat > poem.txt << 'EOF'
Roses are red,
Violets are blue,
Git is a tool,
And so are you.
EOF

git add poem.txt
git commit -m "Initial poem"

git config user.name "Reformatter"
cat > poem.txt << 'EOF'
Roses are red,
Violets are blue,
Git is a useful tool,
And so are you.
EOF

git add poem.txt
git commit -m "Reformat poem"

git config user.name "Learner"

echo "Sandbox ready. cd into sandbox/ and practice blame."

#!/bin/bash
set -e

# Clean up any existing sandbox
rm -rf sandbox

# Create sandbox directory
mkdir sandbox
cd sandbox

# Initialize a git repo
git init
git branch -m main

# Create a second uninitialized project folder
mkdir ../uninitialized-project

# Note: we intentionally do NOT set user.name/email here.
# The learner must configure it themselves.

echo "Sandbox ready. Now cd into sandbox/ and configure Git."

#!/usr/bin/env bash
set -e

mkdir -p sandbox/.github/workflows

cat > sandbox/CODEOWNERS << 'EOF'
# Global fallback
* @team-leads

# Source code
/src/ @senior-devs

# Infrastructure
/infra/ @sre-team

# Documentation
/docs/ @tech-writers
EOF

cat > sandbox/.github/workflows/release.yml << 'EOF'
name: Release

on:
  push:
    branches: [main]

jobs:
  release:
    runs-on: ubuntu-latest
    permissions:
      contents: write
      issues: write
      pull-requests: write
    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0
      - uses: actions/setup-node@v4
        with:
          node-version: 20
      - run: npm ci
      - run: npx semantic-release
EOF

cat > sandbox/README.md << 'EOF'
# My Project

[![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-%23FE5196?logo=conventionalcommits&logoColor=white)](https://conventionalcommits.org)
EOF

echo "Created CODEOWNERS, release workflow, and README badge"

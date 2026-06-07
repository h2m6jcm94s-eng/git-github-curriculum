#!/usr/bin/env bash
set -e

mkdir -p sandbox/.github/workflows

cat > sandbox/.github/workflows/ci.yml << 'EOF'
name: CI

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: 20
      - run: npm ci
      - run: npm test
EOF

cat > sandbox/README.md << 'EOF'
# My Project

![CI](https://github.com/OWNER/REPO/actions/workflows/ci.yml/badge.svg)
EOF

echo "Created sandbox/.github/workflows/ci.yml and sandbox/README.md"

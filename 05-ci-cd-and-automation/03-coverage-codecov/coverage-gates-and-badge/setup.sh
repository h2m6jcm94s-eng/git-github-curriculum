#!/usr/bin/env bash
set -e

mkdir -p sandbox/.github/workflows

cat > sandbox/codecov.yml << 'EOF'
coverage:
  status:
    project:
      default:
        target: 80%
        threshold: 2%
    patch:
      default:
        target: 80%
        threshold: 1%

comment:
  layout: "reach, diff, flags, files"
  behavior: default
  require_changes: false

flags:
  unit:
    paths:
      - src/
  integration:
    paths:
      - tests/integration/
EOF

cat > sandbox/.github/workflows/coverage.yml << 'EOF'
name: Coverage

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  unit:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: 20
      - run: npm ci
      - run: npm run test:unit -- --coverage
      - uses: codecov/codecov-action@v4
        with:
          files: ./coverage/lcov.info
          flags: unit

  integration:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: 20
      - run: npm ci
      - run: npm run test:integration -- --coverage
      - uses: codecov/codecov-action@v4
        with:
          files: ./coverage/lcov.info
          flags: integration
EOF

cat > sandbox/README.md << 'EOF'
# My Project

[![codecov](https://codecov.io/gh/OWNER/REPO/branch/main/graph/badge.svg)](https://codecov.io/gh/OWNER/REPO)
EOF

echo "Created codecov.yml, coverage workflow, and README badge"

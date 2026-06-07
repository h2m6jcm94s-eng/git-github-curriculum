#!/usr/bin/env bash
set -e

mkdir -p sandbox/.github/workflows

cat > sandbox/.github/workflows/smoke.yml << 'EOF'
name: Smoke + Full Tests

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  smoke:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: 20
      - run: npm ci
      - run: npm start &
      - run: sleep 3 && curl -f http://localhost:3000/health || exit 1

  test:
    runs-on: ubuntu-latest
    needs: smoke
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: 20
      - run: npm ci
      - run: npm test
EOF

echo "Created sandbox/.github/workflows/smoke.yml"

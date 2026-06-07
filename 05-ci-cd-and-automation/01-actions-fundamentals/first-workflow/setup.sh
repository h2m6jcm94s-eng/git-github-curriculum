#!/usr/bin/env bash
set -e

mkdir -p sandbox/.github/workflows

cat > sandbox/.github/workflows/hello.yml << 'EOF'
name: Hello Workflow

on:
  push:
    branches: [main]

jobs:
  hello:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Say hello
        run: echo "Hello, GitHub Actions!"
EOF

echo "Created sandbox/.github/workflows/hello.yml"

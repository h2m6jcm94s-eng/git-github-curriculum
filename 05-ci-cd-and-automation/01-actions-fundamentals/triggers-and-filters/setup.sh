#!/usr/bin/env bash
set -e

mkdir -p sandbox/.github/workflows

cat > sandbox/.github/workflows/triggers.yml << 'EOF'
name: Trigger Demo

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]
    paths:
      - 'src/**'
  workflow_dispatch:
  schedule:
    - cron: '0 9 * * 1'

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: echo "Triggered!"
EOF

echo "Created sandbox/.github/workflows/triggers.yml"

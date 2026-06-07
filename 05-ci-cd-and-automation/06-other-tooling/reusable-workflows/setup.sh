#!/usr/bin/env bash
set -e

mkdir -p sandbox/.github/workflows sandbox/.github/actions/composite-setup

cat > sandbox/.github/workflows/reusable-lint.yml << 'EOF'
name: Reusable Lint

on:
  workflow_call:
    inputs:
      node-version:
        required: true
        type: string

jobs:
  lint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: ${{ inputs.node-version }}
      - run: npm ci
      - run: npm run lint
EOF

cat > sandbox/.github/workflows/caller.yml << 'EOF'
name: Caller

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  call-lint:
    uses: ./.github/workflows/reusable-lint.yml
    with:
      node-version: '20'
EOF

cat > sandbox/.github/actions/composite-setup/action.yml << 'EOF'
name: Composite Setup

description: Checkout and install dependencies

runs:
  using: composite
  steps:
    - uses: actions/checkout@v4
    - uses: actions/setup-node@v4
      with:
        node-version: 20
    - run: npm ci
      shell: bash
EOF

echo "Created reusable workflow, caller workflow, and composite action"

#!/usr/bin/env bash
set -e

mkdir -p sandbox/.github/workflows sandbox/.github

cat > sandbox/.github/labeler.yml << 'EOF'
documentation:
  - changed-files:
      - any-glob-to-any-file: ['docs/**', '*.md']

code:
  - changed-files:
      - any-glob-to-any-file: ['src/**', 'lib/**']

tests:
  - changed-files:
      - any-glob-to-any-file: ['tests/**', '**/*.test.*']

ci:
  - changed-files:
      - any-glob-to-any-file: ['.github/workflows/**']
EOF

cat > sandbox/.github/workflows/labeler.yml << 'EOF'
name: Labeler

on:
  - pull_request_target

jobs:
  label:
    permissions:
      contents: read
      pull-requests: write
    runs-on: ubuntu-latest
    steps:
      - uses: actions/labeler@v5
EOF

echo "Created labeler config and workflow"

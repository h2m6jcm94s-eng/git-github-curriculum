#!/usr/bin/env bash
set -e

mkdir -p sandbox

cat > sandbox/.coderabbit.yaml << 'EOF'
language: en
early_access: false
reviews:
  profile: chill
  request_changes_workflow: false
  high_level_summary: true
  poem: false
  review_status: true
  collapse_walkthrough: false
  path_filters:
    - "!dist/**"
    - "!node_modules/**"
    - "!coverage/**"
    - "!*.lock"
  auto_review:
    enabled: true
    drafts: false
chat:
  auto_reply: true
EOF

echo "Created sandbox/.coderabbit.yaml"

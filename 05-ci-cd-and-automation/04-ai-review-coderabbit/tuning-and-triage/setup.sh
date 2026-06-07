#!/usr/bin/env bash
set -e

mkdir -p sandbox

cat > sandbox/.coderabbit.yaml << 'EOF'
language: en
early_access: false
reviews:
  profile: assertive
  request_changes_workflow: true
  high_level_summary: true
  poem: false
  review_status: true
  collapse_walkthrough: true
  path_filters:
    - "!dist/**"
    - "!node_modules/**"
    - "!coverage/**"
    - "!*.lock"
    - "!**/*.generated.ts"
  auto_review:
    enabled: true
    drafts: false
chat:
  auto_reply: true
EOF

echo "Created sandbox/.coderabbit.yaml"

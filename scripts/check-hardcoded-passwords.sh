#!/usr/bin/env bash
set -euo pipefail

echo "🔍 Running hardcoded password & secret scan..."

# Ignore GitHub Actions files (to avoid false positives like ${{ secrets.KEY }})
EXCLUDE_DIRS="--exclude-dir=.github"

# Patterns that indicate possible hardcoded secrets
PATTERNS=(
  "password\s*="
  "passwd\s*="
  "secret\s*="
  "api[_-]?key"
  "access[_-]?key"
  "token\s*="
  "authorization"
  "aws_access_key_id"
  "aws_secret_access_key"
)

FOUND=0

for PATTERN in "${PATTERNS[@]}"; do
  MATCHES=$(grep -RniE "$PATTERN" . $EXCLUDE_DIRS || true)

  if [ -n "$MATCHES" ]; then
    echo "❌ WARNING: Suspicious pattern found for '$PATTERN':"
    echo "$MATCHES"
    FOUND=1
  fi
done

if [ "$FOUND" -eq 1 ]; then
  echo "❌ ERROR: Hardcoded secret or password found! Remove it and use GitHub Secrets."
  exit 1
fi

echo "✅ No hardcoded secrets found."
exit 0

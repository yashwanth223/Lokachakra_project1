#!/usr/bin/env bash
set -euo pipefail

echo " Running hardcoded password & secret scan..."

# Directories to ignore
EXCLUDE_DIRS=(".github" ".git" "node_modules" "frontend/dist" "backend/.next")

# Files to ignore (scanner shouldn't scan itself) — use basename so --exclude works reliably
EXCLUDE_FILES=("check-hardcoded-passwords.sh")

# Patterns that indicate possible hardcoded secrets (prefer value-based patterns to avoid false positives)
PATTERNS=(
  "password\s*="
  "passwd\s*="
  "secret\s*="
  "api[_-]?key"
  "token\s*="
  "authorization"
  "AKIA[0-9A-Z]{16}"            # AWS Access Key ID
  "[A-Za-z0-9/+=]{40}"          # likely AWS Secret Access Key (40 chars)
)

FOUND=0

# Build grep exclude arguments from arrays
GREP_EXCLUDES=()
for d in "${EXCLUDE_DIRS[@]}"; do
  GREP_EXCLUDES+=("--exclude-dir=$d")
 done
for f in "${EXCLUDE_FILES[@]}"; do
  GREP_EXCLUDES+=("--exclude=$f")
 done

for PATTERN in "${PATTERNS[@]}"; do
  echo " Searching for pattern: $PATTERN"
  # EXCLUDES MUST COME BEFORE THE DIRECTORY OR GITHUB ACTIONS IGNORES THEM
  MATCHES=$(grep -RInE --binary-files=without-match "${GREP_EXCLUDES[@]}" "$PATTERN" . || true)

  if [ -n "$MATCHES" ]; then
    echo " WARNING: Suspicious pattern found for '$PATTERN':"
    echo "$MATCHES"
    FOUND=1
  fi
 done

if [ "$FOUND" -eq 1 ]; then
  echo " ERROR: Hardcoded secret or password found! Remove it and use GitHub Secrets."
  exit 1
fi

echo " No hardcoded secrets found."
exit 0

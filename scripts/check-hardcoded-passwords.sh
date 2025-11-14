#!/usr/bin/env bash
set -euo pipefail

patterns=(
  'password\s*=\s*".+?"'
  'password\s*:\s*".+?"'
  'secret\s*=\s*".+?"'
  'passwd\s*=\s*".+?"'
  '\bpwd\s*='
  'API_KEY'
  'AWS_SECRET_ACCESS_KEY'
)

found=0

for p in "${patterns[@]}"; do
  # Exclude this script itself
  if grep -RIn --exclude-dir=.git --exclude="check-hardcoded-passwords.sh" -E "$p" .; then
    found=1
  fi
done

if [ "$found" -ne 0 ]; then
  echo "❌ ERROR: Hardcoded secret or password found! Remove it and use GitHub Secrets."
  exit 1
fi

echo "✅ No hardcoded passwords found."
exit 0

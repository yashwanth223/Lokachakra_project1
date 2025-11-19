#!/usr/bin/env bash
set -euo pipefail

IMAGE="$1"

# Fail if high or critical vulnerabilities found
trivy image --quiet --severity CRITICAL,HIGH --exit-code 1 "$IMAGE" || {
  echo "❌ Trivy scan failed — HIGH or CRITICAL vulnerabilities detected in $IMAGE"
  exit 1
}

echo "✅ Trivy scan passed — no HIGH/CRITICAL vulnerabilities."

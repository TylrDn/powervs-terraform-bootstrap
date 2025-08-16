#!/usr/bin/env bash
set -euo pipefail

ROOT=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)

if ! command -v terraform >/dev/null 2>&1; then
  echo "terraform command not found" >&2
  exit 1
fi

# Invalid example should fail validation
terraform -chdir="$ROOT/examples/invalid-empty-network-ids" init -backend=false -input=false -get-plugins=false >/dev/null
if terraform -chdir="$ROOT/examples/invalid-empty-network-ids" validate >/tmp/invalid.log 2>&1; then
  echo "Expected validation failure for empty network_ids" >&2
  cat /tmp/invalid.log >&2
  exit 1
else
  echo "Invalid example failed validation as expected"
fi

# Valid example should pass validation
terraform -chdir="$ROOT/examples/valid-network-ids" init -backend=false -input=false -get-plugins=false >/dev/null
terraform -chdir="$ROOT/examples/valid-network-ids" validate >/tmp/valid.log 2>&1 || {
  cat /tmp/valid.log >&2
  exit 1
}

echo "Valid example passed validation"

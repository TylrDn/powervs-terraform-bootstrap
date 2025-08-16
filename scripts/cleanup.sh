#!/usr/bin/env bash
set -euo pipefail
TAG=${1:-}
if [[ -z "$TAG" ]]; then
  echo "usage: $0 <tag> [--force]" >&2
  exit 1
fi
DRY_RUN=true
if [[ "${2:-}" == "--force" ]]; then
  DRY_RUN=false
fi
CRNS=$(ibmcloud resource search "tags:$TAG" --output json | jq -r '.items[].crn')
if [[ -z "$CRNS" ]]; then
  echo "No resources found for tag $TAG"
  exit 0
fi
for crn in $CRNS; do
  echo "Found $crn"
  if [[ $DRY_RUN == false ]]; then
    ibmcloud resource delete --force --crn "$crn"
  fi
done

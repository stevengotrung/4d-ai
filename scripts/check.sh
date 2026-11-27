#!/usr/bin/env bash
# Run every repo check in order; stop at the first failure.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"
scripts/sync-shared.sh --check
scripts/scan-private.sh "$ROOT"
python3 -I scripts/check-links.py "$ROOT"
scripts/check-size.sh
python3 -I scripts/check-contract.py tests/contract.tsv
if [ -f scripts/check-examples.py ]; then python3 -I scripts/check-examples.py; fi
echo "all checks passed"

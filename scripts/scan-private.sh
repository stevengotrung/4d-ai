#!/usr/bin/env bash
# Fail if any term from the private list (kept outside the repo) appears in the tree.
# Whole words, case-sensitive. Usage: scan-private.sh [root]
set -euo pipefail
LIST="${PRIVATE_TERMS_FILE:-}"
if [ -z "$LIST" ]; then echo "set PRIVATE_TERMS_FILE to the private-term list (kept outside the repo)"; exit 2; fi
ROOT="${1:-$(cd "$(dirname "$0")/.." && pwd)}"
if [ ! -f "$LIST" ]; then echo "private-term list not found: $LIST"; exit 2; fi
terms="$(mktemp)"; trap 'rm -f "$terms"' EXIT
grep -v '^[[:space:]]*$' "$LIST" > "$terms" || true
[ -s "$terms" ] || { echo "private-term list is empty: $LIST"; exit 2; }
if hits="$(grep -rnw -F -f "$terms" --exclude-dir=.git --exclude-dir=.superpowers "$ROOT")"; then
  echo "private terms found:"; echo "$hits"; exit 1
fi
echo "private scan: clean"

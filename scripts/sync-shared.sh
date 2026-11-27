#!/usr/bin/env bash
# Copy shared/inventory-core.md into each skill that uses it.
# --check: write nothing; exit 1 and name each copy that differs from the source.
set -euo pipefail
ROOT="${REPO_ROOT:-$(cd "$(dirname "$0")/.." && pwd)}"
SRC="$ROOT/shared/inventory-core.md"
TARGETS=(
  "skills/4d-ai/references/domains/inventory-core.md"
  "skills/4d-inventory/references/inventory-core.md"
)
HEADER='<!-- generated from shared/inventory-core.md by scripts/sync-shared.sh; edit the source -->'
[ -f "$SRC" ] || exit 0
expected="$(printf '%s\n' "$HEADER"; cat "$SRC")"
status=0
for rel in "${TARGETS[@]}"; do
  dst="$ROOT/$rel"
  if [ "${1:-}" = "--check" ]; then
    if [ ! -f "$dst" ] || [ "$(cat "$dst")" != "$expected" ]; then
      echo "out of sync: $rel (run scripts/sync-shared.sh)"; status=1
    fi
  else
    mkdir -p "$(dirname "$dst")"; printf '%s\n' "$expected" > "$dst"
  fi
done
exit $status

#!/usr/bin/env bash
# Byte budgets for skill entry files. A file that does not exist yet is skipped.
set -euo pipefail
ROOT="${REPO_ROOT:-$(cd "$(dirname "$0")/.." && pwd)}"
status=0
check() { # check <path> <max bytes>
  local f="$ROOT/$1"
  [ -f "$f" ] || return 0
  local n; n=$(wc -c < "$f" | tr -d ' ')
  if [ "$n" -gt "$2" ]; then echo "too large: $1 is $n bytes (budget $2)"; status=1; fi
}
check skills/4d-inventory/SKILL.md 6144
check skills/4d-engineering/SKILL.md 7168
check skills/4d-ai/SKILL.md 7168
[ $status -eq 0 ] && echo "size: ok"
exit $status

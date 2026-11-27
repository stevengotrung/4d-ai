#!/usr/bin/env bash
# Tests for the check scripts. Each test builds a fixture repo in a temp dir.
set -uo pipefail
HERE="$(cd "$(dirname "$0")/.." && pwd)"
S="$HERE/scripts"
pass=0; fail=0

assert_exit() { # assert_exit <name> <expected> <cmd...>
  local name="$1" want="$2"; shift 2
  local out got
  out="$("$@" 2>&1)"; got=$?
  if [ "$got" = "$want" ]; then pass=$((pass+1)); else
    fail=$((fail+1)); echo "FAIL $name: expected exit $want, got $got"; echo "$out" | sed 's/^/    /'; fi
  LAST_OUT="$out"
}
assert_contains() { # assert_contains <name> <needle>
  if printf '%s' "$LAST_OUT" | grep -qF -- "$2"; then pass=$((pass+1)); else
    fail=$((fail+1)); echo "FAIL $1: output lacks '$2'"; echo "$LAST_OUT" | sed 's/^/    /'; fi
}
fixture() { mktemp -d "${TMPDIR:-/tmp}/4d-fixture.XXXXXX"; }

test_scan_catches_term() {
  local d t; d="$(fixture)"; t="$(fixture)"; echo Zorblax > "$t/terms.txt"; echo "uses Zorblax here" > "$d/a.md"
  PRIVATE_TERMS_FILE="$t/terms.txt" assert_exit scan_hit 1 "$S/scan-private.sh" "$d"
  echo "uses Zorblaxian here" > "$d/a.md"
  PRIVATE_TERMS_FILE="$t/terms.txt" assert_exit scan_whole_word 0 "$S/scan-private.sh" "$d"
}
test_scan_missing_list() {
  local d; d="$(fixture)"
  PRIVATE_TERMS_FILE=/nonexistent assert_exit scan_missing 2 "$S/scan-private.sh" "$d"
  assert_contains scan_missing_msg "private-term list not found"
  env -u PRIVATE_TERMS_FILE "$S/scan-private.sh" "$d" >/dev/null 2>&1; [ $? = 2 ] && pass=$((pass+1)) || { fail=$((fail+1)); echo "FAIL scan_unset: expected exit 2"; }
}
test_sync_check_detects_drift() {
  local d; d="$(fixture)"; mkdir -p "$d/shared"; echo "# Core" > "$d/shared/inventory-core.md"
  REPO_ROOT="$d" assert_exit sync_write 0 "$S/sync-shared.sh"
  REPO_ROOT="$d" assert_exit sync_clean 0 "$S/sync-shared.sh" --check
  echo "drift" >> "$d/skills/4d-inventory/references/inventory-core.md"
  REPO_ROOT="$d" assert_exit sync_drift 1 "$S/sync-shared.sh" --check
  assert_contains sync_drift_path "skills/4d-inventory/references/inventory-core.md"
}
test_sync_without_source() {
  local d; d="$(fixture)"
  REPO_ROOT="$d" assert_exit sync_no_source 0 "$S/sync-shared.sh" --check
}
test_links_stay_inside_skill() {
  local d; d="$(fixture)"; mkdir -p "$d/skills/x/references" "$d/skills/y"
  echo "x" > "$d/skills/y/z.md"; echo "a" > "$d/skills/x/references/a.md"
  echo "[out](../y/z.md)" > "$d/skills/x/SKILL.md"
  assert_exit links_outside 1 python3 -I "$S/check-links.py" "$d"
  echo "[in](references/a.md)" > "$d/skills/x/SKILL.md"
  assert_exit links_inside 0 python3 -I "$S/check-links.py" "$d"
  echo "[gone](references/missing.md)" > "$d/skills/x/SKILL.md"
  assert_exit links_missing 1 python3 -I "$S/check-links.py" "$d"
}
test_contract_missing_phrase() {
  local d; d="$(fixture)"; mkdir -p "$d/tests"; echo "no such words" > "$d/f.md"
  printf 'path\tphrase\nf.md\torder cycle\n' > "$d/tests/contract.tsv"
  assert_exit contract_missing 1 python3 -I "$S/check-contract.py" "$d/tests/contract.tsv"
  assert_contains contract_msg 'f.md: missing "order cycle"'
  echo "The Order Cycle is days covered" > "$d/f.md"
  assert_exit contract_ok 0 python3 -I "$S/check-contract.py" "$d/tests/contract.tsv"
}
test_size_budget() {
  local d; d="$(fixture)"; mkdir -p "$d/skills/4d-inventory"
  head -c 6200 /dev/zero | tr '\0' a > "$d/skills/4d-inventory/SKILL.md"
  REPO_ROOT="$d" assert_exit size_over 1 "$S/check-size.sh"
  head -c 6000 /dev/zero | tr '\0' a > "$d/skills/4d-inventory/SKILL.md"
  REPO_ROOT="$d" assert_exit size_ok 0 "$S/check-size.sh"
}

for t in $(declare -F | awk '{print $3}' | grep '^test_'); do "$t"; done
echo "tests: $pass passed, $fail failed"
[ "$fail" -eq 0 ]

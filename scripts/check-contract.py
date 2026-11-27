"""Content contract: every row 'path<TAB>phrase' must find the phrase in that file (case-insensitive).
Paths are relative to the repo root (the parent of the TSV's folder).
Usage: python3 -I scripts/check-contract.py [tests/contract.tsv]"""
import os
import sys


def main(tsv):
    root = os.path.dirname(os.path.dirname(os.path.abspath(tsv)))
    missing = []
    cache = {}
    with open(tsv, encoding="utf-8") as f:
        rows = [line.rstrip("\n").split("\t", 1) for line in f if line.strip()]
    for row in rows[1:]:
        if len(row) != 2:
            missing.append(f"bad contract row: {row!r}")
            continue
        rel, phrase = row
        if rel not in cache:
            p = os.path.join(root, rel)
            cache[rel] = open(p, encoding="utf-8").read().lower() if os.path.exists(p) else None
        text = cache[rel]
        if text is None or phrase.lower() not in text:
            missing.append(f'{rel}: missing "{phrase}"')
    for m in missing:
        print(m)
    if missing:
        return 1
    print(f"contract: {len(rows) - 1} rows ok")
    return 0


if __name__ == "__main__":
    here = os.path.dirname(os.path.abspath(__file__))
    sys.exit(main(sys.argv[1] if len(sys.argv) > 1 else os.path.join(here, "..", "tests", "contract.tsv")))

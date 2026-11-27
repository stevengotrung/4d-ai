# 4D Inventory Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Ship the `4d-inventory` skill, its shared inventory core (routed from `4d-ai`), four fictional examples, 27 eval scenarios and the scripted checks, then one blind eval run on Claude Code.

The result is verified when:
- `scripts/check.sh` exits 0, covering links, shared-core sync, the private-term scan, SKILL.md size budgets, the content contract and the example arithmetic;
- the blind run's results are saved in `evals/`.

Out of scope: everything the spec lists as out of scope, the Codex run (release stage 3), and team use (stage 2).

**Architecture:** This is a Markdown skill repo with no build. Inventory knowledge is written once in `shared/inventory-core.md` and copied into both skills by `scripts/sync-shared.sh`. Every check is a small bash or Python script that `scripts/check.sh` runs. The content is test-driven through a contract file: `tests/contract.tsv` lists the phrases each file must contain, taken from the spec, and each content task adds its rows first, watches the check fail, then writes the file.

**Tech Stack:** bash, Python 3.9 standard library (always run with `python3 -I`), Markdown, git and `gh`.

**Spec:** `docs/superpowers/specs/2026-11-27-4d-inventory-design.md`

## Global Constraints

- **Public repo:**
  - No word from the private-term list may appear anywhere in the repo. The list's path is given by `$PRIVATE_TERMS_FILE`; it lives outside the repo and has no default.
  - Match whole words and case-sensitively; the list is never committed.
  - Write "the maintainer" instead of any company, product or agent name.
- **Data:** every store, product, person and number is fictional. The store is "Northpine Outfitters", with locations "Main" and "Riverside".
- **Size:** `skills/4d-inventory/SKILL.md` ≤ 6144 bytes; `skills/4d-ai/SKILL.md` ≤ 7168 bytes (it is 6458 today).
- **The skill only advises.** Every file that discusses POs, stock or settings must say the skill does not create, send or change them.
- **Defaults, from the spec:**
  - at most 3 Dialogue questions;
  - review after 30 days, or 60–90 days when an item sells fewer than about 20 units a month;
  - a censored week has ≥3 sold-out days, and only for variants that stop selling when out of stock;
  - slow-stock flag: days of inventory > lead time + order cycle + safety days + 60, falling back to 90 days when those are unknown; 60 days is "worth a look";
  - ABC ≈ 20/30/50% of products giving ≈ 80/15/5% of sales;
  - safety days by variability: 3–5 low, 7–14 medium, 14–30+ high;
  - look-back 60–90 days (30–45 for trending items, 120–180 for slow movers);
  - limits apply in this order: manual floor → fixed quantity → max inventory → case pack (round up) → MOQ and order-value minimums.
- **Style:** match the existing `4d-ai` references: plain English, short paragraphs, no emoji, relative links.
- **Commits:** conventional commits on branch `steve/spec/4d-inventory`, each ending with the session's Co-Authored-By and Claude-Session lines.

## Review Focus

1. **A private term slips in** through an example, an eval or a README edit. Users would expect the public repo to have none. Pinned by Task 1's `test_scan_catches_term` and by `check.sh` running in every task.
2. **A variant that keeps selling while out of stock is treated as censored.** Users would expect zeros and backorders on such a variant to count as real demand. Pinned by contract rows in Task 2 and eval 2 in Task 8.
3. **The example arithmetic disagrees with its own CSVs.** Users would expect a worked example's numbers to be reproducible. Pinned by Task 7's `check-examples.py`.
4. **The copies of the shared core drift after an edit.** Users would expect both skills to say the same thing. Pinned by Task 1's `test_sync_check_detects_drift`.
5. **A broken relative link** shows up when a skill is installed on its own. Users would expect every link inside an installed skill folder to resolve inside that folder. Pinned by Task 1's `test_links_stay_inside_skill`.

---

### Task 1: Check tooling

**Files:**
- Create: `scripts/sync-shared.sh`
- Create: `scripts/scan-private.sh`
- Create: `scripts/check-links.py`
- Create: `scripts/check-size.sh`
- Create: `scripts/check-contract.py`
- Create: `scripts/check.sh`
- Create: `tests/contract.tsv`, with the header only
- Test: `tests/test-scripts.sh`

**Interfaces:**
- Produces:
  - `scripts/sync-shared.sh [--check]`: copies `shared/inventory-core.md` to `skills/4d-ai/references/domains/inventory-core.md` and `skills/4d-inventory/references/inventory-core.md`, each prefixed with the line `<!-- generated from shared/inventory-core.md by scripts/sync-shared.sh; edit the source -->`. With `--check` it exits 1 and prints the drifted path, without writing. If `shared/inventory-core.md` doesn't exist yet, it exits 0.
  - `scripts/scan-private.sh [root]`: reads `$PRIVATE_TERMS_FILE`. When the file is missing it prints `private-term list not found: <path>` and exits 2. It runs `grep -rnw -F` (case-sensitive) over `root` (default `.`), excluding `.git`, and exits 1 on any hit, printing the hits.
  - `python3 -I scripts/check-links.py [root]`: checks every relative Markdown link in `*.md`. It exits 1 when a target is missing, or when a link inside `skills/<name>/` resolves outside `skills/<name>/`.
  - `scripts/check-size.sh`: applies the two byte budgets from Global Constraints and skips a file that doesn't exist yet.
  - `python3 -I scripts/check-contract.py [tests/contract.tsv]`: reads TSV rows of the form `path<TAB>phrase` and exits 1, listing each `path: missing "phrase"`, for every row whose phrase isn't in that file (case-insensitive substring). A missing file fails all of its rows.
  - `scripts/check.sh`: runs, in order, sync `--check`, scan, links, size, contract, and examples (when `scripts/check-examples.py` exists). It exits non-zero on the first failure and prints `all checks passed` at the end.

- [ ] **Step 1: Write the failing tests** in `tests/test-scripts.sh`. Each test builds a fixture repo in `mktemp -d` and asserts an exit code. Use a tiny `assert_exit <code> <cmd…>` helper.
  - `test_scan_catches_term`: term file holds `Zorblax`, and `a.md` contains "uses Zorblax". Expect exit 1. Change it to "Zorblaxian" and expect exit 0, because matching is whole-word.
  - `test_scan_missing_list`: with `PRIVATE_TERMS_FILE=/nonexistent`, expect exit 2.
  - `test_sync_check_detects_drift`: create `shared/inventory-core.md`, run sync, then append a line to one copy. `--check` should exit 1 and print that path.
  - `test_links_stay_inside_skill`: `skills/x/SKILL.md` links `../y/z.md`, and that file exists. Expect exit 1. A link to `references/a.md`, which exists, should exit 0.
  - `test_contract_missing_phrase`: the TSV has a row for `f.md` with "order cycle", and `f.md` lacks it. Expect exit 1 with `f.md: missing "order cycle"`.
  - `test_size_budget`: a 6200-byte `skills/4d-inventory/SKILL.md` should exit 1.
- [ ] **Step 2: Run** `bash tests/test-scripts.sh`. Expected: FAIL, because the scripts don't exist.
- [ ] **Step 3: Implement the six scripts** using the interfaces above. Every script sets `set -euo pipefail` and resolves the repo root from its own location.
- [ ] **Step 4: Run** `bash tests/test-scripts.sh && scripts/check.sh`. Expected: all tests pass, then `all checks passed` on the current repo.
- [ ] **Step 5: Commit** with message `chore: add check scripts for skills (sync, private scan, links, size, contract)`.

### Task 2: Shared inventory core and routing in 4d-ai

**Files:**
- Create: `shared/inventory-core.md`
- Generated: `skills/4d-ai/references/domains/inventory-core.md` and `skills/4d-inventory/references/inventory-core.md`
- Modify: `skills/4d-ai/SKILL.md` (Discern section, after the paragraph that starts "When the evidence cannot yet distinguish")
- Modify: `tests/contract.tsv`

**Interfaces:**
- Consumes: `scripts/sync-shared.sh`, `scripts/check.sh` (Task 1).
- Produces: section headings that later files link to with anchors. Use exactly these headings:
  - `## Stock Balance`
  - `## Censored demand`
  - `## Grain`
  - `## Demand classes`
  - `## New items`
  - `## ABC`
  - `## Glossary`

- [ ] **Step 1: Add contract rows** for `shared/inventory-core.md`. The phrases are:
  - `stops selling when out of stock`
  - `keeps selling`
  - `units ÷ in-stock days`
  - `3 or more sold-out days`
  - `censored share`
  - `inferred`
  - `variant × location`
  - `smooth`
  - `erratic`
  - `intermittent`
  - `lumpy`
  - `fill rate`
  - `days since first sale`
  - `sparse history`
  - `80%`
  - `days of inventory remaining`
  - `order cycle`
  - `1 − WAPE`
  - `MASE`

  Add a row for `skills/4d-ai/SKILL.md` with the phrase `references/domains/inventory-core.md`.
- [ ] **Step 2: Run** `scripts/check.sh`. Expected: FAIL on the contract with the missing rows listed.
- [ ] **Step 3: Write `shared/inventory-core.md`.**
  - Content: the spec section "`inventory-core.md` (shared)", as prose and short lists in the existing references' style.
  - Include the per-day and per-week censoring rules and the constrained-supplier exception.
  - Run `scripts/sync-shared.sh`.
  - Add the spec's routing sentence to `skills/4d-ai/SKILL.md` word for word.
- [ ] **Step 4: Run** `scripts/check.sh`. Expected: `all checks passed`, with the 4d-ai SKILL.md still ≤ 7168 bytes.
- [ ] **Step 5: Commit** with message `feat: shared inventory core, routed from 4d-ai`.

### Task 3: 4d-inventory skill entry, maturity, impact and brief template

**Files:**
- Create: `skills/4d-inventory/SKILL.md`
- Create: `skills/4d-inventory/references/maturity.md`
- Create: `skills/4d-inventory/references/measuring-inventory-impact.md`
- Create: `skills/4d-inventory/assets/stock-balance-brief.md`
- Modify: `tests/contract.tsv`

**Interfaces:**
- Consumes: the `inventory-core.md` headings (Task 2).
- Produces: the links in SKILL.md to `references/data-checks.md` and `references/decisions/{forecast-trust,reorder,slow-stock}.md`. Tasks 4–6 create those files, so Task 3's link check fails until they exist. To avoid that, Step 3 creates them as one-line stubs (`# <Title>` plus "Filled in Task N").

- [ ] **Step 1: Add contract rows.**
  - `SKILL.md`: front-matter `name: 4d-inventory`; `Never places orders`; `Define`; `Dialogue`; `Discern`; `Determine Impact`; `at most three`; `variant × location`; `guardrail`; `evidence, not instruction`; `answer first`; `this might seem wrong because`; and the five state names `No data`, `Sales only`, `Full data`, `Can't tell`, `Coming back`.
  - `maturity.md`: `gut feel`; `spreadsheet`; `rule-based`; `forecast-driven`; `over 5/day`; `never scores`.
  - `measuring-inventory-impact.md`: `30 days`; `60–90`; `20 units a month`; `inconclusive`; `opposite`; `concurrent changes`; `acted on`.
  - `stock-balance-brief.md`: every brief field named in the spec (`Do this`, `Verdict`, `Why this number`, `Leans`, `Inputs checked`, `Seen`, `Inferred`, `Guardrail`, `Look again`, `Ruled out`, `Without the checks`).
- [ ] **Step 2: Run** `scripts/check.sh`. Expected: contract FAIL.
- [ ] **Step 3: Write the four files and the stubs.**
  - `SKILL.md` front matter `description` is the spec's sentence word for word.
  - The body is the spec's flow and the table of states.
  - Its "Never" list is the spec's four lines.
  - The skill reads `references/inventory-core.md` on first use.
- [ ] **Step 4: Run** `scripts/check.sh`. Expected: `all checks passed`, and SKILL.md ≤ 6144 bytes.
- [ ] **Step 5: Commit** with message `feat: 4d-inventory skill entry, maturity, impact and brief template`.

### Task 4: Data checks

**Files:**
- Modify: `skills/4d-inventory/references/data-checks.md` (replacing the stub)
- Modify: `tests/contract.tsv`

- [ ] **Step 1: Add contract rows.**
  - The four group headings: `## Hygiene`, `## Demand`, `## Supply`, `## Tool settings`.
  - Phrases:
    - `Track`
    - `gift cards`
    - `wholesale`
    - `refunds`
    - `bundle`
    - `whole history window`
    - `priced it in`
    - `observed lead time`
    - `supplier change`
    - `stale drafts`
    - `expected arrival`
    - `history total`
    - `high percentile`
    - `trend %`
    - `override`
    - `on-hand`
    - `could not run`
    - `120–180`
    - `10–20 sale points`
- [ ] **Step 2: Run** `scripts/check.sh`. Expected: contract FAIL.
- [ ] **Step 3: Write `data-checks.md`** from the spec section. Each check is one line in the form check · why it matters · what pass, fixed or could-not-run looks like.
- [ ] **Step 4: Run** `scripts/check.sh`. Expected: `all checks passed`.
- [ ] **Step 5: Commit** with message `feat: 4d-inventory data checks`.

### Task 5: Forecast-trust guide

**Files:**
- Modify: `skills/4d-inventory/references/decisions/forecast-trust.md`
- Modify: `tests/contract.tsv`

- [ ] **Step 1: Add contract rows:**
  - `trust with an adjustment`
  - `don't trust yet`
  - `P10–P90`
  - `bias`
  - `seasonal-naive`
  - `MAPE`
  - `zero-sale`
  - `uncensored`
  - `same period last year`
  - `stayed in stock`
  - `too short to judge`
  - a link to `../data-checks.md`
- [ ] **Step 2: Run** `scripts/check.sh`. Expected: contract FAIL.
- [ ] **Step 3: Write the guide** from the spec section. End it with a 6-line worked example: the hoodie case from the spec's walkthrough (85 sold, of which 50 were one wholesale order, so a store rate of 35; lifted 1.15× for December to ≈ 40; range 30–52; 6 of 8 recent weeks inside the range).
- [ ] **Step 4: Run** `scripts/check.sh`. Expected: pass.
- [ ] **Step 5: Commit** with message `feat: 4d-inventory forecast-trust guide`.

### Task 6: Reorder and slow-stock guides

**Files:**
- Modify: `skills/4d-inventory/references/decisions/reorder.md`
- Modify: `skills/4d-inventory/references/decisions/slow-stock.md`
- Modify: `tests/contract.tsv`

- [ ] **Step 1: Add contract rows.**
  - `reorder.md`:
    - `(lead time + safety days) × sales speed`
    - `Nothing is suggested until`
    - `(lead time + order cycle + safety days) × sales speed`
    - `never both`
    - `arrives later`
    - `lost`
    - `backlog`
    - `manual floor`
    - `fixed order quantity`
    - `max inventory`
    - `case pack`
    - `only warn`
    - `transfer first`
    - `cash cost`
    - `end-of-season sell-through`
    - `does not create`
  - `slow-stock.md`:
    - `+ 60`
    - `90 days`
    - `worth a look`
    - `30 / 60 / 90+`
    - `kept selling out`
    - `pre-build`
    - `override`
    - `stop buying`
    - `cut order quantities`
    - `supplier return`
    - `bundle with a fast-seller`
    - `mark down part`
    - `liquidate`
    - `margin`
    - `60–90 days`
- [ ] **Step 2: Run** `scripts/check.sh`. Expected: contract FAIL.
- [ ] **Step 3: Write both guides** from the spec sections.
  - The reorder worked example is the Trail Sock case:
    - censored rate 24/week (3.43/day);
    - observed lead time 21 days;
    - 30 safety units (≈ 9 safety days);
    - reorder point 102;
    - on hand 40 + transfer 35 = position 75;
    - order cycle 28 days, so the target is 198;
    - order 123, rounded up to packs of 12 gives 132, above the MOQ of 100;
    - cost $6.40 × 132 = $844.80;
    - cover on arrival 5.6 weeks;
    - the unchecked contrast is 18/week with 14 days, giving 98, which rounds to 108.
  - The slow-stock example is the Tote case: 400 units at $8 cost ($3,200), 12/week now, so 33 weeks of cover; 30/week last spring; cancel the 100-unit draft; clear 150; keep 250 (≈ 8 weeks of spring cover); review at 60 days.
- [ ] **Step 4: Run** `scripts/check.sh`. Expected: pass.
- [ ] **Step 5: Commit** with message `feat: 4d-inventory reorder and slow-stock guides`.

### Task 7: Fictional examples with checked arithmetic

**Files:**
- Create: `examples/inventory/reorder-trail-sock.md`
- Create: `examples/inventory/forecast-trust-hoodie.md`
- Create: `examples/inventory/slow-stock-tote.md`
- Create: `examples/inventory/team-bug-report.md`
- Create: `examples/inventory/data/northpine-sales.csv`, columns `date,variant,location,units,order_id,customer_type`
- Create: `examples/inventory/data/northpine-stock.csv`, columns `date,variant,location,on_hand,continue_selling`
- Create: `examples/inventory/data/northpine-pos.csv`, columns `po,variant,status,ordered,expected,received,qty`
- Create: `scripts/check-examples.py`
- Modify: `README.md` (add the four examples under "What is included")

**Interfaces:**
- Consumes: the numbers pinned in Tasks 5–6.
- Produces: `python3 -I scripts/check-examples.py`, which `check.sh` runs. It exits 1 and prints `<example>: <field> expected X, computed Y`.

- [ ] **Step 1: Write `scripts/check-examples.py` first**, with these assertions computed from the CSVs:
  - Trail Sock M at Main, last 12 weeks:
    - censored weeks = 3, because `continue_selling=false` and ≥ 3 days have `on_hand ≤ 0`;
    - in-stock rate = 24.0/week, give or take 0.5;
    - raw rate = 18.0/week, give or take 0.5;
    - observed lead time over the last 4 received POs = 21 days, give or take 1;
    - reorder point = 102;
    - order rounded to case pack = 132.
  - Hoodie: the 12 Nov wholesale order is 50 units; November store units = 35.
  - Tote: on hand 400; 33 weeks of cover, give or take 1.

  Each example's front matter holds the same values under `checked:`. The script also asserts that front matter equals computed.
- [ ] **Step 2: Run** `python3 -I scripts/check-examples.py`. Expected: FAIL, because there are no CSVs yet.
- [ ] **Step 3: Write the CSVs and the four examples.**
  - Each example follows the shape of the existing `examples/*.md`: Request, then Define and Dialogue, Discern, Determine Impact, then the brief.
  - `team-bug-report.md` is E4: a product team's "forecast too low" report, explained by censored weeks and framed as a provisional proposal.
- [ ] **Step 4: Run** `scripts/check.sh`. Expected: `all checks passed`, including the examples step.
- [ ] **Step 5: Commit** with message `feat: 4d-inventory fictional examples with checked arithmetic`.

### Task 8: Eval scenarios, docs and status

**Files:**
- Create: `evals/inventory-scenarios.md`
- Modify: `evals/README.md` (one link line)
- Modify: `README.md` (one paragraph introducing `4d-inventory`, under Scope and status: "initial preview, behavioural trials pending")
- Modify: `docs/claude-code.md`, `docs/codex.md` (a `cp -R -i skills/4d-inventory …` line next to the existing one)
- Modify: `tests/contract.tsv`

- [ ] **Step 1: Add contract rows** for `evals/inventory-scenarios.md`:
  - the pass-condition keywords of scenarios 2 (`Does **not** censor`), 9 (`lost demand`), 17 (`pre-build`), 22 (`doesn't create`) and 23 (`Treats it as data`);
  - the line `withhold`, so the pass-condition column is hidden from blind runs as in the existing evals.
- [ ] **Step 2: Run** `scripts/check.sh`. Expected: contract FAIL.
- [ ] **Step 3: Write `inventory-scenarios.md`.**
  - Use the spec's 27-row table word for word, in the format of `evals/field-informed-scenarios.md`.
  - Each row names its fixture: one of the Task 7 CSVs or a described variant of one.
  - Then the docs edits.
- [ ] **Step 4: Run** `scripts/check.sh`. Expected: pass.
- [ ] **Step 5: Commit** with message `docs: 4d-inventory eval scenarios, install lines and status`.

### Task 9: Blind eval run on Claude Code

**Files:**
- Create: `evals/inventory-run-2026-11-27.md` (use the actual run date)

- [ ] **Step 1: Build the blind inputs.** Make one input per scenario containing:
  - the scenario's input text;
  - its fixture files;
  - the installed skill folder only, with no evals and no spec.

  Run each one in a fresh context: a fresh subagent with no access to the repo, or `claude -p` in an empty temp directory with the skill copied into `.claude/skills/`. Use no write-capable tools except the stub create-PO tool in scenario 22.
- [ ] **Step 2: Score each run** against the pass condition. Record:
  - host, model, date;
  - the input;
  - the observed decision and side effects (quoted briefly);
  - pass or fail with evidence.

  Fails are fixed in the skill text, `check.sh` is rerun, and only the failed scenarios are run again, with both attempts recorded.
- [ ] **Step 3: Run** `scripts/check.sh`. Expected: pass.
- [ ] **Step 4: Commit** with message `test: blind 4d-inventory eval run on Claude Code`.

### Task 10: Publish the branch

- [ ] **Step 1: Bring the branch up to date and check it.** Run `git fetch origin && git rebase origin/main`, then `bash tests/test-scripts.sh && scripts/check.sh`. Expected: both pass.
- [ ] **Step 2: Push and open the PR.** Run `git push -u origin steve/spec/4d-inventory`, then `gh pr create --title "feat: 4d-inventory skill (forecast trust, reorder, slow stock)"`. The body covers:
  - the goal;
  - the three decisions;
  - the shared core;
  - the checks;
  - the blind-run summary (with the number of passes);
  - the limits: no Codex run yet, and no team use yet.

  It ends with the session's PR attribution lines.
- [ ] **Step 3: Review loop.** Ten minutes later, in the background, run `/review-mr` on the PR, for up to three rounds. Merge only when the maintainer asks.

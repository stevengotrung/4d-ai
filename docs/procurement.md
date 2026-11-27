# Using Procurement & Supplier Evaluation

For procurement and supplier-management teams. Choose a supply option that meets the real requirement at an understood total cost and service risk.

## One request is enough

**Claude Code:**

```text
/4d-procurement
This supplier quotes a lower unit price. Should we switch? Here are the offers and requirements.
```

**Codex:**

```text
$4d-procurement
This supplier quotes a lower unit price. Should we switch? Here are the offers and requirements.
```

Evidence checking, uncertainty handling, and draft-first output are built in. Add sources or context when useful, but no long prompt or setup form is required. The skill asks only for information that changes the next decision. No connector or sibling skill is mandatory.

## What you receive

A normalized supplier comparison, requirement gaps, cost assumptions and sensitivity, a conditional recommendation or next evidence check, and a proposed trial/decision brief.

**Example (fictional):** Decision: whether to trial Supplier B. Open gates: specification equivalence, delivery evidence, storage capacity. Known: lower unit price and larger commitment. Unknown: rejection/rework cost. Recommendation: verify critical requirements before switching. No purchase order or supplier acceptance created.

## Review and follow up

Ask for a shorter version, another option, or correct a fact. Prepare analysis and drafts only; do not create, send, or edit purchase orders, place orders, change stock or reorder settings, accept contracts, or initiate payments. Supplier contact or updates to external sourcing records require applicable authorization. Keep commercial authority and legal review with the responsible owner. Inventory forecast/reorder/slow-stock questions belong to an inventory workflow; 4d-inventory is optional and its action restrictions must not be bypassed through this skill.

Record accepted quality, on-time/full delivery, actual total cost and usable output for a comparable trial. Review after the agreed receipt/service window before recommending expansion. Impact remains pending without follow-up evidence. A skill does not create a scheduled watcher.

## Install

Clone [4d-ai](https://github.com/stevengotrung/4d-ai). From its root, for Claude Code:

```sh
mkdir -p "$HOME/.claude/skills"
cp -R -i skills/4d-procurement "$HOME/.claude/skills/"
```

Review an existing copy before overwriting. Alternatively use the product project's `.claude/skills/` directory; choose one scope. Start a new session.

For Codex:

```text
Use $skill-installer to install skills/4d-procurement from https://github.com/stevengotrung/4d-ai.
```

Without the installer, copy the whole folder into the configured skill directory, commonly `~/.codex/skills/`. Start a new session. To update, review changes and replace the installed copy; uninstall only this folder. Installation grants no external access or permissions.

## Explore

- [Skill](../skills/4d-procurement/SKILL.md)
- [Practice guide and fictional example](../skills/4d-procurement/references/practice-guide.md)
- [Offline role demo](../examples/role-skills-demo.html): download raw HTML and open locally. All interactions/results are scripted; no real actions occur.
- [Evaluation scenarios](../evals/design-procurement-finance-management.md)

Public preview. Static checks and simulated reviews are distinct from live Claude Code/Codex validation, which remains pending.

# Using Finance & Business Analysis

For finance teams and business analysts preparing internal management analysis. Produce a traceable internal analysis that supports a business decision without overstating uncertain numbers.

## One request is enough

**Claude Code:**

```text
/4d-finance-analysis
Revenue increased, but operating cash fell. Help explain the difference using these reports.
```

**Codex:**

```text
$4d-finance-analysis
Revenue increased, but operating cash fell. Help explain the difference using these reports.
```

Evidence checking, uncertainty handling, and draft-first output are built in. Add sources or context when useful, but no long prompt or setup form is required. The skill asks only for information that changes the next decision. No connector or sibling skill is mandatory.

## What you receive

A decision-focused analysis with reconciled totals or explicit unreconciled items, source-backed drivers, transparent calculations or scenarios, uncertainty and sensitivity, and a proposed next check/action.

**Example (fictional):** Question: what explains the operating cash change? Known: revenue is higher under the supplied report definition. Needed: consistent period balances and cash-flow detail. Draft bridge: supported collections, supplier payments, and other identified movements; unreconciled amounts remain labeled. No invented balancing item or accounting entry.

## Review and follow up

Ask for a shorter version, another option, or correct a fact. Analysis and drafts only by default. Do not post journal entries, change accounting records, move money, approve payments, issue financial statements, or submit filings under this skill. Do not turn internal scenario analysis into personal investment advice or an assurance opinion. Keep sensitive financial and personal records in permitted locations. External publication or stakeholder messages need applicable authorization.

Repeat the reconciled comparison after the agreed reporting period. Track whether expected collection or payment changes occurred and whether one-time effects explain the result. Keep model assumptions separate from actual benefits. Impact remains pending without follow-up evidence. A skill does not create a scheduled watcher.

## Install

Clone [4d-ai](https://github.com/stevengotrung/4d-ai). From its root, for Claude Code:

```sh
mkdir -p "$HOME/.claude/skills"
cp -R -i skills/4d-finance-analysis "$HOME/.claude/skills/"
```

Review an existing copy before overwriting. Alternatively use the product project's `.claude/skills/` directory; choose one scope. Start a new session.

For Codex:

```text
Use $skill-installer to install skills/4d-finance-analysis from https://github.com/stevengotrung/4d-ai.
```

Without the installer, copy the whole folder into the configured skill directory, commonly `~/.codex/skills/`. Start a new session. To update, review changes and replace the installed copy; uninstall only this folder. Installation grants no external access or permissions.

## Explore

- [Skill](../skills/4d-finance-analysis/SKILL.md)
- [Practice guide and fictional example](../skills/4d-finance-analysis/references/practice-guide.md)
- [Offline role demo](../examples/role-skills-demo.html): download raw HTML and open locally. All interactions/results are scripted; no real actions occur.
- [Evaluation scenarios](../evals/design-procurement-finance-management.md)

Public preview. Static checks and simulated reviews are distinct from live Claude Code/Codex validation, which remains pending.

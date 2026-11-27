# Using Product Discovery & Prioritization

For product managers and product owners. Choose a worthwhile user problem and the smallest useful way to test a solution.

## Start with one request

After installing, call the skill and paste your situation. Extra workflow instructions are unnecessary.

**Claude Code:**

```text
/4d-product
Customers keep asking for a dashboard. Here are their messages and what our product already supports.
```

**Codex:**

```text
$4d-product
Customers keep asking for a dashboard. Here are their messages and what our product already supports.
```

The skill checks available context, identifies uncertainty, and prepares a grounded draft automatically. Supply useful evidence when available; no fixed intake form is required. It asks only when missing information affects the decision.

## What you receive

A decision brief: user problem and segment, evidence with confidence/unknowns, options and trade-offs, recommended next experiment, scope/non-goals, acceptance or learning criteria, and the next owner/decision.

**Example output (fictional):** Problem: users need to identify overdue orders. Evidence: one repeated interview plus three other messages, whose independence still needs checking. Options: surface the filter; improve data freshness; build a dashboard. Next test: observe the task with current and revised navigation. Decision remains a proposal, not a roadmap commitment.

## Review and act

You can say “make this shorter,” “compare another option,” or correct a source. Do not promise roadmap dates, contact research participants, publish priorities, create external tickets, or initiate engineering work without applicable authorization. A concrete approved build can be handed to an engineering workflow, optionally `4d-ai` if available. This skill must still work without that dependency.

Observe whether users identify the right orders, how long it takes, and whether they return to the old workaround. Record data freshness and training changes as possible confounders. If follow-up data is absent, impact remains pending. No background job is created by invoking the skill.

## Install

Clone [4d-ai](https://github.com/stevengotrung/4d-ai). From its root, install for Claude Code:

```sh
mkdir -p "$HOME/.claude/skills"
cp -R -i skills/4d-product "$HOME/.claude/skills/"
```

Review existing files before overwriting. Alternatively use the project's `.claude/skills/` directory; choose one scope. Start a new session.

In Codex:

```text
Use $skill-installer to install skills/4d-product from https://github.com/stevengotrung/4d-ai.
```

Without the installer, copy the complete folder into the configured skill directory, commonly `~/.codex/skills/`. Start a new session. Review upstream differences before updating; uninstall only this skill's folder. Installation grants no tool access or external permissions.

## Explore and verify

- [Skill instructions](../skills/4d-product/SKILL.md)
- [Worked example and practice guide](../skills/4d-product/references/practice-guide.md)
- [Role demo](../examples/role-skills-demo.html): download raw HTML and open locally. All results are fictional and scripted.
- [Evaluation cases](../evals/role-skills.md)

Public preview. Static checks and reasoning reviews are distinct from live host validation, which remains pending.

# Using Marketing & Growth Experiments

For marketing and growth teams. Improve a meaningful customer or business outcome through a grounded, reviewable marketing experiment.

## Start with one request

After installing, call the skill and paste your situation. Extra workflow instructions are unnecessary.

**Claude Code:**

```text
/4d-marketing
Our ads get more clicks, but fewer qualified leads. Here are the campaign numbers and the qualification definition.
```

**Codex:**

```text
$4d-marketing
Our ads get more clicks, but fewer qualified leads. Here are the campaign numbers and the qualification definition.
```

The skill checks available context, identifies uncertainty, and prepares a grounded draft automatically. Supply useful evidence when available; no fixed intake form is required. It asks only when missing information affects the decision.

## What you receive

A short diagnosis, evidence gaps, a proposed experiment with audience/message/measurement, and customer-facing content drafts when useful. Separate internal reasoning from copy intended for publication.

**Example output (fictional):** Hypothesis: the new message attracts more clicks but less relevant prospects. Needed: cohort-level qualification outcomes after the full lag window. Proposed test: compare a clearer audience-specific message against the existing version. Primary outcome: qualified leads per spend; guardrails: total cost and sales follow-up burden. No budget change authorized.

## Review and act

You can say “make this shorter,” “compare another option,” or correct a source. Do not publish content, launch ads, upload audiences, send outreach, change budgets, or make commitments without applicable authorization. Existing scoped approval can be used without repeated confirmation. A copy draft is not permission to spend. Treat customer data and tracking identifiers according to their permitted use.

Review comparable mature cohorts, data completeness, and changes in qualification rules before deciding to scale, revise, or stop. If follow-up data is absent, impact remains pending. No background job is created by invoking the skill.

## Install

Clone [4d-ai](https://github.com/stevengotrung/4d-ai). From its root, install for Claude Code:

```sh
mkdir -p "$HOME/.claude/skills"
cp -R -i skills/4d-marketing "$HOME/.claude/skills/"
```

Review existing files before overwriting. Alternatively use the project's `.claude/skills/` directory; choose one scope. Start a new session.

In Codex:

```text
Use $skill-installer to install skills/4d-marketing from https://github.com/stevengotrung/4d-ai.
```

Without the installer, copy the complete folder into the configured skill directory, commonly `~/.codex/skills/`. Start a new session. Review upstream differences before updating; uninstall only this skill's folder. Installation grants no tool access or external permissions.

## Explore and verify

- [Skill instructions](../skills/4d-marketing/SKILL.md)
- [Worked example and practice guide](../skills/4d-marketing/references/practice-guide.md)
- [Role demo](../examples/role-skills-demo.html): download raw HTML and open locally. All results are fictional and scripted.
- [Evaluation cases](../evals/role-skills.md)

Public preview. Static checks and reasoning reviews are distinct from live host validation, which remains pending.

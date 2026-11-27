# Using Operations & Process Improvement

For operations managers and process owners. Improve the end-to-end outcome of a business process without shifting the problem elsewhere.

## Start with one request

After installing, call the skill and paste your situation. Extra workflow instructions are unnecessary.

**Claude Code:**

```text
/4d-operations
Packing is faster, but orders still leave later. Here is the process and the timing data we have.
```

**Codex:**

```text
$4d-operations
Packing is faster, but orders still leave later. Here is the process and the timing data we have.
```

The skill checks available context, identifies uncertainty, and prepares a grounded draft automatically. Supply useful evidence when available; no fixed intake form is required. It asks only when missing information affects the decision.

## What you receive

A current-state process map, evidence-based bottleneck hypotheses, a small proposed intervention or automation pilot, exception/rollback handling, and a measurement and handoff plan.

**Example output (fictional):** Scope: eligible order to correct carrier handoff. Hypotheses: missed pickup windows, downstream capacity, or incomplete order information. Proposed pilot: one agreed shift with aligned handoff timing. Guardrails: errors, overtime, and downstream queue length. No live schedule changed.

## Review and act

You can say “make this shorter,” “compare another option,” or correct a source. Do not change live workflows, schedules, staffing assignments, customer records, automation rules, or production systems without applicable authorization. Identify the owner and effects before mutation. Use authorized read-only scoped access for investigation. Escalate safety-critical or regulated process decisions to the responsible specialist.

Compare total lead time and service quality for similar orders/shifts. If packing improves but dispatch worsens, revise the intervention rather than claiming an automation win. If follow-up data is absent, impact remains pending. No background job is created by invoking the skill.

## Install

Clone [4d-ai](https://github.com/stevengotrung/4d-ai). From its root, install for Claude Code:

```sh
mkdir -p "$HOME/.claude/skills"
cp -R -i skills/4d-operations "$HOME/.claude/skills/"
```

Review existing files before overwriting. Alternatively use the project's `.claude/skills/` directory; choose one scope. Start a new session.

In Codex:

```text
Use $skill-installer to install skills/4d-operations from https://github.com/stevengotrung/4d-ai.
```

Without the installer, copy the complete folder into the configured skill directory, commonly `~/.codex/skills/`. Start a new session. Review upstream differences before updating; uninstall only this skill's folder. Installation grants no tool access or external permissions.

## Explore and verify

- [Skill instructions](../skills/4d-operations/SKILL.md)
- [Worked example and practice guide](../skills/4d-operations/references/practice-guide.md)
- [Role demo](../examples/role-skills-demo.html): download raw HTML and open locally. All results are fictional and scripted.
- [Evaluation cases](../evals/role-skills.md)

Public preview. Static checks and reasoning reviews are distinct from live host validation, which remains pending.

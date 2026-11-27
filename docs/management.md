# Using Management & Team Coordination

For managers and cross-functional decision owners. Help a responsible manager choose a clear course of action and coordinate accountable follow-through.

## One request is enough

**Claude Code:**

```text
/4d-management
Sales wants a launch next month, but delivery says there is no capacity. Help us decide the next step.
```

**Codex:**

```text
$4d-management
Sales wants a launch next month, but delivery says there is no capacity. Help us decide the next step.
```

Evidence checking, uncertainty handling, and draft-first output are built in. Add sources or context when useful, but no long prompt or setup form is required. The skill asks only for information that changes the next decision. No connector or sibling skill is mandatory.

## What you receive

A concise decision brief with options and trade-offs, recommended next step, decision needed, proposed ownership/dependencies, and a follow-up record. Meeting agendas or updates are drafts unless sending/scheduling is authorized.

**Example (fictional):** Decision owner: to be confirmed from existing governance. Options: reduce scope, revise sequencing, or move target date. Unknown: external promise and validated capacity. Proposed next step: resolve those two facts, then choose an option with explicit trade-offs. Owners are proposed, not assigned.

## Review and follow up

Ask for a shorter version, another option, or correct a fact. Keep human accountability for decisions. Do not rank employees, infer personal traits, or make hiring, termination, promotion, or compensation decisions. Do not assign people, change budgets/deadlines, publish announcements, or commit other teams without authority. Existing explicit authority can be used without repeated approvals, but a proposal cannot manufacture stakeholder acceptance.

Review accepted ownership, actual throughput and customer/delivery outcomes at the agreed checkpoint. If tasks are closed but the constraint persists, revisit scope and assumptions rather than declaring the launch problem solved. Impact remains pending without follow-up evidence. A skill does not create a scheduled watcher.

## Install

Clone [4d-ai](https://github.com/stevengotrung/4d-ai). From its root, for Claude Code:

```sh
mkdir -p "$HOME/.claude/skills"
cp -R -i skills/4d-management "$HOME/.claude/skills/"
```

Review an existing copy before overwriting. Alternatively use the product project's `.claude/skills/` directory; choose one scope. Start a new session.

For Codex:

```text
Use $skill-installer to install skills/4d-management from https://github.com/stevengotrung/4d-ai.
```

Without the installer, copy the whole folder into the configured skill directory, commonly `~/.codex/skills/`. Start a new session. To update, review changes and replace the installed copy; uninstall only this folder. Installation grants no external access or permissions.

## Explore

- [Skill](../skills/4d-management/SKILL.md)
- [Practice guide and fictional example](../skills/4d-management/references/practice-guide.md)
- [Offline role demo](../examples/role-skills-demo.html): download raw HTML and open locally. All interactions/results are scripted; no real actions occur.
- [Evaluation scenarios](../evals/design-procurement-finance-management.md)

Public preview. Static checks and simulated reviews are distinct from live Claude Code/Codex validation, which remains pending.

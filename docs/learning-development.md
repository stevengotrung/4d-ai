# Using Learning & Development

For hr/l&d teams, trainers, and managers supporting learning. Help people develop and demonstrate a specific work capability under fair, observable conditions.

## Start with one request

After installing, call the skill and paste your situation. Extra workflow instructions are unnecessary.

**Claude Code:**

```text
/4d-learning-development
Everyone completed onboarding, but new hires still need help finishing their first task. Here is the workflow and what we observed.
```

**Codex:**

```text
$4d-learning-development
Everyone completed onboarding, but new hires still need help finishing their first task. Here is the workflow and what we observed.
```

The skill checks available context, identifies uncertainty, and prepares a grounded draft automatically. Supply useful evidence when available; no fixed intake form is required. It asks only when missing information affects the decision.

## What you receive

A task-specific learning diagnosis, draft practice activity and observable criteria, feedback tied to evidence, and a follow-up plan. Where observations are absent, provide a plan to collect evidence rather than an invented evaluation.

**Example output (fictional):** Task: complete one standard handoff accurately. Prerequisites: account access and current procedure. Practice: sanitized case with an exception requiring a decision. Evidence: observed steps and explanation, with AI assistance recorded. Feedback: specific demonstrated behavior and one next practice activity; insufficient evidence where no opportunity existed.

## Review and act

You can say “make this shorter,” “compare another option,” or correct a source. Use this skill for development, not automated employment decisions. Do not rank people, infer protected characteristics, or recommend hiring, firing, promotion, or compensation from learning records. If asked, redirect to task-specific developmental evidence and a responsible human review process. Do not send feedback, change personnel records, enroll people, or publish training without applicable authorization.

Follow independent task completion, rework, and coaching time after practice. Record opportunity/access differences; avoid attributing changes solely to training. If follow-up data is absent, impact remains pending. No background job is created by invoking the skill.

## Install

Clone [4d-ai](https://github.com/stevengotrung/4d-ai). From its root, install for Claude Code:

```sh
mkdir -p "$HOME/.claude/skills"
cp -R -i skills/4d-learning-development "$HOME/.claude/skills/"
```

Review existing files before overwriting. Alternatively use the project's `.claude/skills/` directory; choose one scope. Start a new session.

In Codex:

```text
Use $skill-installer to install skills/4d-learning-development from https://github.com/stevengotrung/4d-ai.
```

Without the installer, copy the complete folder into the configured skill directory, commonly `~/.codex/skills/`. Start a new session. Review upstream differences before updating; uninstall only this skill's folder. Installation grants no tool access or external permissions.

## Explore and verify

- [Skill instructions](../skills/4d-learning-development/SKILL.md)
- [Worked example and practice guide](../skills/4d-learning-development/references/practice-guide.md)
- [Role demo](../examples/role-skills-demo.html): download raw HTML and open locally. All results are fictional and scripted.
- [Evaluation cases](../evals/role-skills.md)

Public preview. Static checks and reasoning reviews are distinct from live host validation, which remains pending.

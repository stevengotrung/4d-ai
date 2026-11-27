# Using UX & Product Design

For ux researchers, product designers, and design partners. Help users complete a meaningful task through an understandable, usable interaction.

## One request is enough

**Claude Code:**

```text
/4d-design
Users keep closing this dialog and trying again. Here are the screenshots and behavior notes.
```

**Codex:**

```text
$4d-design
Users keep closing this dialog and trying again. Here are the screenshots and behavior notes.
```

Evidence checking, uncertainty handling, and draft-first output are built in. Add sources or context when useful, but no long prompt or setup form is required. The skill asks only for information that changes the next decision. No connector or sibling skill is mandatory.

## What you receive

A concise evidence-based UX assessment, recommended interaction and alternatives, a draft/mockup when useful, and a test or implementation handoff with states and acceptance criteria.

**Example (fictional):** Task: confidently confirm an import. Evidence: repeated close/reopen behavior and an unexplained total; cause still needs validation. Draft: explain the value source and show clear completion/error feedback. Handoff: expected states and task-based checks. No production code or design system was changed.

## Review and follow up

Ask for a shorter version, another option, or correct a fact. Draft by default. Do not contact participants, publish designs, edit a live design system, make product commitments, or change product code without applicable authorization. Preserve approved design scope and explain deviations; material changes need a decision. Engineering and product skills may receive a handoff but are optional.

Observe whether comparable users complete the import correctly without repeated attempts or facilitator help. Record mobile and assistive-technology coverage separately; untested paths remain unverified. Impact remains pending without follow-up evidence. A skill does not create a scheduled watcher.

## Install

Clone [4d-ai](https://github.com/stevengotrung/4d-ai). From its root, for Claude Code:

```sh
mkdir -p "$HOME/.claude/skills"
cp -R -i skills/4d-design "$HOME/.claude/skills/"
```

Review an existing copy before overwriting. Alternatively use the product project's `.claude/skills/` directory; choose one scope. Start a new session.

For Codex:

```text
Use $skill-installer to install skills/4d-design from https://github.com/stevengotrung/4d-ai.
```

Without the installer, copy the whole folder into the configured skill directory, commonly `~/.codex/skills/`. Start a new session. To update, review changes and replace the installed copy; uninstall only this folder. Installation grants no external access or permissions.

## Explore

- [Skill](../skills/4d-design/SKILL.md)
- [Practice guide and fictional example](../skills/4d-design/references/practice-guide.md)
- [Offline role demo](../examples/role-skills-demo.html): download raw HTML and open locally. All interactions/results are scripted; no real actions occur.
- [Evaluation scenarios](../evals/design-procurement-finance-management.md)

Public preview. Static checks and simulated reviews are distinct from live Claude Code/Codex validation, which remains pending.

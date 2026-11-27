# Using Sales & Account Management

Use `4d-sales` to understand an opportunity, investigate an objection, prepare a proposal or follow-up, and preserve promises during handoff. It works with pasted messages and notes; CRM access is optional.

## One request is enough

**Claude Code:**

```text
/4d-sales
The customer says our price is too high after the demo. Here are the conversation notes.
```

**Codex:**

```text
$4d-sales
The customer says our price is too high after the demo. Here are the conversation notes.
```

No need to specify “investigate,” “check assumptions,” or “draft only” every time. Those are defaults. Add current pricing, capability documents, and previous replies when useful, but no mandatory intake form is required.

## What you receive

- A concise opportunity assessment with facts, hypotheses, and gaps.
- A recommended next action based on the buyer's actual blockers.
- A buyer-facing reply or proposal draft when useful.
- A commercial or delivery handoff if needed, with responsibilities and follow-up.

For example, “price is high” may coexist with migration concerns and an absent budget approver. The skill should investigate rather than automatically offer a discount. It should also recognize when affordability really is the blocker.

## Other situations

Paste a situation after the same command:

- “The prospect has gone quiet after our proposal.”
- “The buyer asks for a feature we have not released.”
- “Review this proposal against the approved price and scope.”
- “The contract is signed, but implementation has not started.”
- “Prepare for this renewal using the supplied usage and support history.”

## Review and authorize

You can ask for a shorter reply, another option, or a revised proposal. The default is a draft: no messages, meetings, discounts, quotes, CRM edits, or contractual commitments are executed merely by invoking the skill.

If you want to send a specific approved reply, authorize it for the intended recipient/conversation. A configured sending policy may already cover routine actions. New commercial terms still need applicable authority. The skill should not repeatedly ask for approval already clearly granted, or claim a send succeeded without a confirmed result.

## Install

Clone [4d-ai](https://github.com/stevengotrung/4d-ai). From the clone, for Claude Code:

```sh
mkdir -p "$HOME/.claude/skills"
cp -R -i skills/4d-sales "$HOME/.claude/skills/"
```

Review existing files before overwriting. Alternatively use your project's `.claude/skills/` directory; choose one scope. Start a new session.

For Codex:

```text
Use $skill-installer to install skills/4d-sales from https://github.com/stevengotrung/4d-ai.
```

Without the installer, copy the full skill folder into your configured skills directory, commonly `~/.codex/skills/`. Start a new session. To update, review upstream changes and replace the installed copy; remove only this skill's folder to uninstall. Installation grants no service permissions.

## Explore

- [Skill instructions](../skills/4d-sales/SKILL.md)
- [Practice guide and fictional example](../skills/4d-sales/references/practice-guide.md)
- [Interactive role demo](../examples/role-skills-demo.html): download raw HTML and open it in a browser, then choose Sales & Account Management. No live AI calls or commercial actions occur.
- [Evaluation scenarios](../evals/sales.md)

Public preview. A signed deal is not proof of delivered value. Live host validation and actual business impact remain separate from static checks and fictional examples.

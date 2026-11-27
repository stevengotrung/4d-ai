# Using 4D Customer Support

Use this skill for customer questions, failures, repeated contacts, and feature requests in software, retail, or services. It produces grounded case notes, reply drafts, and handoffs. **Replies are drafts by default.** No specific helpdesk or connector is required.

## Install

Clone this repository first. For Claude Code, from its root:

```sh
mkdir -p "$HOME/.claude/skills"
cp -R -i skills/4d-customer-support "$HOME/.claude/skills/"
```

Review existing files before accepting overwrite prompts. Alternatively install in your project's `.claude/skills/` directory. Choose one scope. Start a new session and invoke `/4d-customer-support`.

In Codex, ask:

```text
Use $skill-installer to install skills/4d-customer-support from https://github.com/stevengotrung/4d-ai.
```

If the installer is unavailable, copy the full folder to your configured skill location, commonly `~/.codex/skills/`. Start a new session and invoke `$4d-customer-support`. Review upstream changes before replacing an installed copy; remove only that skill's directory to uninstall.

## Provide enough context to begin

Paste the customer message, useful previous replies, relevant documentation or policy, and the known product/order/service state. Supply sanitized examples where possible. You can start with incomplete information; the skill should identify the gaps that actually affect the response. Tools and permissions come from your environment, not from the skill.

## Try it

Replace the command with the one for your host:

```text
/4d-customer-support Investigate the request below using the supplied documentation. Separate verified facts from assumptions. Draft a customer response for my review; do not send it. Include an internal note and a handoff only if needed.

Customer: I followed your export instructions, but the report still fails.
Prior attempt: Retried the same export after refreshing.
Available context: [paste current guidance and sanitized error details]
```

Other starting prompts:

- **Repeat contact:** “Review the history. Explain what remains unresolved and propose the next useful action instead of repeating the last reply.”
- **Return/refund:** “Check this request against the supplied return policy and order status. Draft the next reply without promising or issuing a refund.”
- **Appointment:** “Draft a response to this rescheduling request. Use the supplied availability and policy; do not change the booking.”
- **Feature request:** “Clarify the job behind this request, check available options, and prepare a product handoff if needed. Do not promise delivery.”

## Review the outputs

See the [worked conversations](../examples/customer-support-walkthroughs.md) for how-to questions, repeat failures, feature requests, and retail/service requests.

Expect a concise internal assessment, a clearly marked customer draft, relevant questions/decisions, and an owner or next step. The skill should not expose internal analysis to the customer or manufacture policy details. Correct facts or ask for a shorter draft before approving.

If connected tools support sending, an explicit instruction can authorize it:

> Send this approved draft in the existing customer conversation. Do not change the account or issue a refund.

The agent should report a confirmed send separately from the customer's outcome. If no send tool exists, the draft remains ready for an authorized person to send. A scoped organizational sending policy can replace per-message approval; document its boundaries explicitly.

## Finish and follow up

Confirm the customer can complete the task, or leave a clear pending state, owner, and review trigger. Silence does not establish success. Administrative closure under your policy can coexist with an unconfirmed outcome.

## Explore the interactive demo

Download or clone the repository and open [the standalone HTML demo](../examples/customer-support-demo.html) in a browser. GitHub's file view displays source; use **Download raw file** to save and open it. The demo works offline, needs no installation, and contains software, retail, and appointment examples. It uses scripted fictional results: no AI calls, messages, bookings, or refunds occur. Reloading resets it.

## Validation status

Public preview. Documentation, structure, and the interactive demo are checked separately from agent behavior. See [support evaluation cases](../evals/customer-support.md). Live end-to-end trials in Claude Code and Codex remain pending.

# Using the coordination skill

In Claude Code, invoke `/4d-ai`; in Codex, invoke `$4d-ai`, then describe the situation. Natural-language selection depends on the host and installed descriptions; verify activation rather than assuming it happened.

Examples of sufficient requests:

- “Continue this handoff. The scope is already approved.”
- “Engineering says this is done. Help close the customer issue.”
- “Use my support and engineering skills to resolve this request.”

4D starts from supplied and accessible context. It can return a concise status, a recipient-ready handoff, a draft closure response or an outcome review, depending on what is actually needed. It does not require a long process prompt.

## With specialist plugins

Install and configure specialists separately using their own instructions. Anthropic Knowledge Work Plugins and engineering workflows such as Superpowers are possible comparison targets, not dependencies or tested integrations. Use only installed skills relevant to the current stage. Existing host/project requirements still apply.

Example: “Use 4d-ai with the support workflow I have installed. Investigate this request and prepare the engineering handoff. Do not send the customer response.”

The support workflow performs the investigation; 4D preserves evidence, decision boundaries and the next action. A later authorized engineering task continues from that record. No automatic agent spawning, plugin installation, CRM write or customer contact is implied.

## What a useful continuation looks like

“Revision r42 passed the export checks on the preview build. Production release is not confirmed. The customer reply is drafted, not sent. Next: the release owner confirms deployment; support then sends within its authority and checks whether the customer can download. Support ownership is proposed, not yet accepted.”

This is fictional. The actual response must use observed evidence and existing authority. Routine work should not accumulate status fields or extra approvals.

See the [complete example](../skills/4d-ai/references/support-engineering.md) and [comparison protocol](../evals/README.md).

# Proposals and approval

Describe the problem, evidence, confidence, proposed user-visible behavior, scope, acceptance criteria, checks, and unresolved decisions. Use a mockup when it resolves a consequential UI choice, not as a gate for every change.

Default to one approval of a sufficiently specified change. A separate design approval is useful only when design introduces material decisions beyond approved scope.

Record the approver or user context, decision, scope, and proposal version/commit when available. Clear chat approval of the preceding proposal is sufficient; do not invent an external record.

Preserve the approver's exact relevant words and a source pointer or message identifier where available. Label agent interpretations, recommendations, and technical choices separately. Do not present an expanded paraphrase as the person's decision. An agent may relay an approval, but the relay must point to the actual authorized decision; the agent's own endorsement does not supply human approval.

In tracker workflows, establish the approval convention and authorized reviewers. A configured label/status can signal approval; a self-applied label or arbitrary third-party comment cannot establish user authorization. If several proposals are pending and “ok” is ambiguous, ask one focused question.

Change requests are feedback, not approval of a revised proposal. Preserve useful investigation while revising. If new evidence changes the cause but the approved behavior and scope remain valid, explain and continue. Seek a new decision if scope, risk, or user-visible behavior changes materially.

Read conditional replies in full. “OK, implement provided no schema changes are needed” can authorize work within that explicit condition; verify and preserve the condition. “OK, but how will migration work?” may leave a consequential question unresolved. Resolve that question before dependent work. Do not strip “if” or “but” from a decision, and do not require renewed approval when a clear condition is satisfied. If the condition fails or its meaning is unclear, return for a decision.

Once a design or mockup is approved, use its agreed behavior and visual requirements as a verification reference. Document deviations and their reasons. Material deviations need approval before implementation; a note alone does not authorize them. Incidental implementation choices inside the approved intent do not require a new gate.

Keep tracker summaries concise and link detailed project documents. Keep approved versions discoverable. Do not impose particular labels, agent roles, or ticket types.

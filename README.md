# 4D Framework Skills

Turn evidence of user difficulties into reviewed, verified software improvements.

**Define → Dialogue → Discern → Determine Impact**

An English-language agent skill for **Claude Code and Codex**, based on the [4D Framework](https://4dframework.org/). Start with a bug report, customer feedback, a session replay, analytics, or logs. Investigate, propose a change for human approval, then implement and verify the approved scope and prepare a PR or MR.

## Get started

- [Install for Claude Code](docs/claude-code.md)
- [Install for Codex](docs/codex.md)
- [Read the skill](skills/4d-product-improvement/SKILL.md)
- [Understand the framework](skills/4d-product-improvement/references/framework.md)

> Use 4d-product-improvement to investigate this report. Explain what the evidence supports and propose a fix for my approval. After approval, implement it, verify it, and open a PR.

For an already approved task, provide the proposal or its location. The skill should continue from that decision rather than request approval again.

## What is included

One shared skill, focused references, a reusable finding template, and three fictional walkthroughs:

- [Session replay to a UI fix](examples/session-replay-to-fix.md)
- [Customer feedback to an improvement](examples/customer-feedback-to-improvement.md)
- [Error logs to a bug fix](examples/error-log-to-fix.md)

No particular tracker, analytics service, agent name, or label is required. Chat and repository documents are sufficient to start. Mixpanel, Jira, GitHub, and GitLab are optional integrations through tools you already have. See [integration guidance](skills/4d-product-improvement/references/integrations.md).

## Scope and status

The four Ds are recurring competencies, not four rigid steps. Professional experience and human accountability remain essential. A successful test or merged PR does not prove user impact.

This instruction-based skill is not a monitoring service or enforcement mechanism. It does not install connectors, grant permissions, schedule jobs, or guarantee agent compliance. Post-release measurement may need a later session and an agreed owner.

**Initial public preview:** structure and local references are checked. End-to-end behavioral trials on both Claude Code and Codex are pending. See the [evaluation scenarios](evals/README.md). Installation support is not a claim of production validation.

## Contributing

Report the input, expected behavior, actual behavior, host/version, and a sanitized reproduction. Never include customer recordings, credentials, private tickets, or proprietary code. Prefer corrections grounded in observed behavior over rules for hypothetical cases.

## License

This repository's instructions, examples, and tooling use the [MIT License](LICENSE). Linked third-party materials retain their own terms. The framework is a proposed competency model, not a certification.

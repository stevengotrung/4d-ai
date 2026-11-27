# 4D AI

Turn workplace evidence into better decisions, reviewable work, and measurable outcomes.

**Define → Dialogue → Discern → Determine Impact**

English-language agent skills for **Claude Code and Codex**, based on the [4D Framework](https://4dframework.org/).

| Skill | Use it for | Start here |
| --- | --- | --- |
| `4d-ai` | Evidence-led software fixes and improvements, from investigation to an approved PR/MR and impact follow-up | [Claude Code](docs/claude-code.md) · [Codex](docs/codex.md) |
| `4d-customer-support` | Customer questions, repeated contacts, grounded reply drafts, team handoffs, and confirmed outcomes across software, retail, and services | [Usage and installation](docs/customer-support.md) · [Interactive HTML demo](examples/customer-support-demo.html) |
| `4d-product` | Product discovery, opportunity prioritization, and small experiments before delivery commitments | [Usage and installation](docs/product.md) |
| `4d-marketing` | Campaign diagnosis, grounded creative drafts, and measurable growth experiments | [Usage and installation](docs/marketing.md) |
| `4d-operations` | End-to-end process diagnosis and bounded improvement or automation pilots | [Usage and installation](docs/operations.md) |
| `4d-learning-development` | Task-specific practice, developmental feedback, and learning transfer; not personnel ranking or employment decisions | [Usage and installation](docs/learning-development.md) |
| `4d-sales` | Buyer needs, opportunity blockers, grounded proposals and follow-ups, and sales-to-delivery continuity | [Usage and installation](docs/sales.md) |

For every skill, the command plus your situation is enough. Evidence checks, draft-first output, and targeted questions are built in. [Explore the role skills in an offline HTML demo](examples/role-skills-demo.html).

The support demo is a standalone offline file with three fictional cases. Download the raw HTML and open it in a browser; GitHub's file view shows the source. It makes no AI calls and sends no messages.

For text examples, read the [customer-support walkthroughs](examples/customer-support-walkthroughs.md).

## Get started

Choose a skill in the table above and follow its guide. Each skill installs independently and works with supplied context; no other skill or connector is required. The links below describe the software-improvement skill specifically.

- [Install for Claude Code](docs/claude-code.md)
- [Install for Codex](docs/codex.md)
- [Read the skill](skills/4d-ai/SKILL.md)
- [Understand the framework](skills/4d-ai/references/framework.md)

> Use 4d-ai to investigate this report. Explain what the evidence supports and propose a fix for my approval. After approval, implement it, verify it, and open a PR.

For an already approved task, provide the proposal or its location. The skill should continue from that decision rather than request approval again.

## What is included

Each skill has one shared implementation for both hosts, focused references, and a reusable case template. Software-improvement walkthroughs:

- [Session replay to a UI fix](examples/session-replay-to-fix.md)
- [Customer feedback to an improvement](examples/customer-feedback-to-improvement.md)
- [Error logs to a bug fix](examples/error-log-to-fix.md)

No particular tracker, analytics service, agent name, or label is required. Chat and repository documents are sufficient to start. Mixpanel, Jira, GitHub, and GitLab are optional integrations through tools you already have. See [integration guidance](skills/4d-ai/references/integrations.md).

## Scope and status

The four Ds are recurring competencies, not four rigid steps. Professional experience and human accountability remain essential. A successful test or merged PR does not prove user impact.

This instruction-based skill is not a monitoring service or enforcement mechanism. It does not install connectors, grant permissions, schedule jobs, or guarantee agent compliance. Post-release measurement may need a later session and an agreed owner.

**Initial public preview:** structure and local references are checked. End-to-end behavioral trials on both Claude Code and Codex are pending. See the [evaluation scenarios](evals/README.md). Installation support is not a claim of production validation.

The skill includes safeguards informed by maintainer-reported operational incidents: preserving approval conditions, testing the intended running build and affected shared consumers, reporting incomplete verification, and closing the loop with reporters. [Anonymized evaluation cases](evals/field-informed-scenarios.md) turn these lessons into checks; the incident reports alone do not establish that the skill passes them.

## Contributing

Report the input, expected behavior, actual behavior, host/version, and a sanitized reproduction. Never include customer recordings, credentials, private tickets, or proprietary code. Prefer corrections grounded in observed behavior over rules for hypothetical cases.

## License

This repository's instructions, examples, and tooling use the [MIT License](LICENSE). Linked third-party materials retain their own terms. The framework is a proposed competency model, not a certification.

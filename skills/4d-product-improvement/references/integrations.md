# Optional integrations

Use available tools and existing authentication. No connector is mandatory. Discover actual capabilities before promising to use them; tool names and permissions vary across hosts.

## Mixpanel or another analytics service

Identify the project and period from context. Use event/funnel queries for patterns and replay access for behavior when available. Some connectors expose analytics without replay viewing. State this limitation and use supplied replay notes or another authorized viewing method. Apply [source guidance](evidence-sources.md).

## Jira, GitHub Issues, Linear, or chat

Follow existing conventions: proposal location, approvers, approval signals, document location, and status meanings. No configuration file is required if instructions already establish them.

When authorized to write, keep summaries short, link detail, read recent feedback before acting, and update labels/statuses to reflect completed work. Check for existing findings and PRs before creating duplicates, particularly after retries.

## GitHub or GitLab

Resolve repository and target branch from context. Use configured tooling for the authorized PR/MR. Never publish private customer artifacts or source code just to make evidence accessible. Sanitize public descriptions and respect source access restrictions.

## Illustrative mapping

| Meaning | Tracker example | Without a tracker |
| --- | --- | --- |
| Proposal awaits decision | Existing review label/status | Proposal in chat |
| Scope approved | Authorized reviewer approves the named proposal | User says “implement this” |
| Ready for code review | PR/MR linked to ticket | PR link or patch summary |
| Impact follow-up | Task with owner and review window | Project document |

These are examples, not permissions or mandatory labels. One agent can run the workflow, or several can resume from the same record. No named agent architecture is required.

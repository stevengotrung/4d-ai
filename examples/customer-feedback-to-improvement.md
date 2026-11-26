# Customer feedback to an improvement

Fictional example using chat and a repository, without an analytics connector.

**Request:** “Customers ask for a dashboard to find overdue orders. Investigate these three messages and propose an improvement.”

**Define:** The task is finding orders needing attention. A dashboard is one possible solution. Check whether messages represent independent customers or repeated reports.

**Dialogue:** Inspect the current UI. Suppose an overdue filter already exists but is hard to find. Present surfacing the filter and building a dashboard as alternatives, explain trade-offs, and recommend a narrow change.

**Discern:** Confirm the filter uses the intended overdue rule and returns the correct orders. The user approves making it visible. Implement and verify behavior and accessibility; create a PR if authorized.

**Determine Impact:** Arrange a task-based follow-up with affected users or an agreed measure. A screenshot is implementation evidence, not proof that users find orders faster. Leave impact pending when follow-up is unavailable.

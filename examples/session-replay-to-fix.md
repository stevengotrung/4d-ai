# Session replay to a UI fix

All facts are fictional. Mixpanel, Jira, and GitLab illustrate an optional combination.

**Request:** “Review this import replay, propose a fix in our configured Jira project, and wait for approval before implementation.”

**Define:** A user imports a CSV and repeatedly closes confirmation after seeing a zero total. Their task is confirming a correctly valued receipt. One session establishes difficulty, not prevalence.

**Dialogue:** Read the project workflow and clarify missing business rules. Post an authorized summary and link detail in the repository. Show a mockup if the display choice needs review.

**Discern:** Compare the replay, frontend calculations, and stored data. Suppose the server falls back to the order price when the CSV has no cost, while the preview treats it as zero. Distinguish a misleading preview from incorrect saved data. Propose a consistent preview with a fallback explanation; do not silently change accounting behavior.

The user replies “ok” to the named proposal. Record the scope and implement. Check missing cost, explicit zero, provided cost, currency, and partial receipts as relevant. Create the authorized MR and link it to Jira. Report actual check results.

**Determine Impact:** Compare repeated attempts and completion among eligible imports; use receipt correctness as a guardrail. If tracking is absent, acknowledge unknown reach and propose instrumentation within the approval process. Report “verified, impact pending” until follow-up data exists.

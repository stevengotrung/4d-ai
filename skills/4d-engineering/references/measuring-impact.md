# Determining impact

Choose measures reflecting the user's task, not just developer output. A faster response or fewer errors may still fail to improve task completion.

Specify the outcome, eligible population, baseline/comparison, primary measure and denominator, relevant guardrails, follow-up window, and reviewer. Choose these based on release conditions and usage volume rather than a universal duration. Explain what results would support continuing, adjusting, or stopping.

Make the follow-up executable: name the actual event/report/query or manual procedure, source and filters, review date or release-relative trigger, owner, and location for recording results. If event names or access are unknown, list that dependency rather than inventing them. A release-relative trigger should be converted into a concrete review time once the release is known. Low-volume usage may need an explicit minimum sample and an inconclusive outcome.

After release, confirm the deployed version and available instrumentation. Compare like populations, account for concurrent changes and seasonality, and check unintended effects. A before/after difference alone does not establish causation. Small samples or missing tracking may make the result inconclusive.

Keep claims distinct:

- **Implemented:** the code changed.
- **Verified:** specified checks passed in a named environment.
- **Released:** deployment was confirmed.
- **Impact reviewed:** post-release evidence was evaluated; the result may be positive, negative, unchanged, or uncertain.

A PR does not complete impact measurement. Assign follow-up in the user's chosen location. A skill does not create a persistent watcher; scheduling needs a separate authorized automation.

When the review runs, save the observation period, query/procedure, results, caveats, and decision to keep, adjust, stop, or gather more evidence. A due date passing or an automation reporting “done” is not a completed impact review without recorded results.

For reporter-originated work, also track whether the affected person was notified and could access the change, including installation, enablement, permissions, or plan prerequisites when relevant. Notification is not evidence of adoption or positive impact. Prepare an authorized notification or a draft for its owner with the change, how to use it, and known prerequisites; record sent, pending, or not applicable separately from release and measurement.

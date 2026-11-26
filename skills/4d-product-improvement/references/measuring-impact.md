# Determining impact

Choose measures reflecting the user's task, not just developer output. A faster response or fewer errors may still fail to improve task completion.

Specify the outcome, eligible population, baseline/comparison, primary measure and denominator, relevant guardrails, follow-up window, and reviewer. Choose these based on release conditions and usage volume rather than a universal duration. Explain what results would support continuing, adjusting, or stopping.

After release, confirm the deployed version and available instrumentation. Compare like populations, account for concurrent changes and seasonality, and check unintended effects. A before/after difference alone does not establish causation. Small samples or missing tracking may make the result inconclusive.

Keep claims distinct:

- **Implemented:** the code changed.
- **Verified:** specified checks passed in a named environment.
- **Released:** deployment was confirmed.
- **Impact reviewed:** post-release evidence was evaluated; the result may be positive, negative, unchanged, or uncertain.

A PR does not complete impact measurement. Assign follow-up in the user's chosen location. A skill does not create a persistent watcher; scheduling needs a separate authorized automation.

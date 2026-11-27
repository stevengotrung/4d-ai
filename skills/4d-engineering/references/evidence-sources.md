# Working with evidence

Record the source, time window, relevant version/environment, and distinction between observation and inference. Use minimal excerpts and stable pointers. Keep sensitive raw evidence out of public repositories and PRs.

## Session replays

Identify the task and sequence leading to difficulty. Record timestamps and visible behavior. Repeated clicks, closed dialogs, and abandonment are signals, not proof of a bug or intent. Compare latency, unclear feedback, expected navigation, and failure as possible explanations. Corroborate with code, events, or reproduction where available.

If only event records are accessible, describe event analysis; never claim to have watched a replay. Record sampling criteria and coverage. One session can justify investigation, not broad prevalence.

Cite the original replay with the relevant timestamp or interval. Use a timestamped deep link when supported; otherwise provide the replay URL and time separately. For visual UI claims, include a screenshot when it materially helps verification and sharing is permitted, or provide a precise description and source pointer when capture is unavailable or sensitive. Never invent a screenshot or copy private visuals into a public destination.

## Product analytics

Define population, event meaning, denominator, time window, and filters. Check tracking completeness, duplicates, identity changes, and release timing. Separate relevant segments. Funnel drop-off does not explain its cause. A missing event may indicate missing tracking rather than a failed user action.

## Logs and error reports

Record the failure signature, environment/version, frequency within the observed logs, and relevant request context. Redact credentials and personal data. Separate symptoms from causes. Correlate with a reproduction, trace, or code invariant. Absence from logs does not prove absence of a problem.

## Customer feedback

Separate customer words from interpretation. Identify the task and workaround. A feature request may describe a problem an existing feature could solve. Check whether multiple reports are independent before estimating reach.

## Code, tests, screenshots, and descriptions

Code establishes possible behavior, not necessarily a production occurrence. A screenshot establishes a visible state, not a complete sequence or cause. Tests establish behavior in their environment. Supplied reports remain useful without direct tool access; mark unverified details and request corroboration only when necessary.

## Production data access

For investigation, use authorized read-only access and the smallest sufficient dataset. Select necessary fields, constrain the relevant population and time period, and prefer aggregates or redacted outputs where possible. Apply result limits to row queries, but do not assume LIMIT bounds scanned data or cost. Use query timeouts, cost estimates, partition filters, or a replica when the environment supports them and the workload warrants it. Do not run an unbounded expensive query merely because it is read-only.

Do not copy personal data or secrets into findings. Preserve a sanitized query or reproducible query description, parameter scope, execution time, and source/version as evidence in the permitted location. Keep sensitive parameter values private. Do not change production records to test a hypothesis without separate explicit authorization.

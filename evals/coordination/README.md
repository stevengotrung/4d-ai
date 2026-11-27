# Coordination comparison protocol

Status: fixtures prepared after the rewrite; comparative trials have not been run. See [completed rewrite checks](rewrite-checks.md). These are fictional development cases informed by reported failure patterns, not anonymized verbatim incident records or held-out tests.

## Question

Does adding 4D to the same specialist workflow reduce lost context, approval errors and false completion claims without increasing unnecessary work?

## Conditions

A: chosen specialist workflow alone. B: identical workflow plus the rewritten `4d-ai` skill. An optional no-specialist baseline answers a different question and must be reported separately.

Pin the repository commits, skill contents, host/model/version, tool permissions and settings for each run. Use fresh sessions with the same fixture, output budget and available tools; never carry a prior run's answers into the next. Verify and record which skills actually loaded. Counterbalance run order and use at least three repetitions per case and configuration for an exploratory comparison. Report all runs and failures, not only the best example.

Start with the five [fixtures](fixtures/01-reporter-closure.md); the other cases are [approval](fixtures/02-approval-provenance.md), [build identity](fixtures/03-served-build.md), [shared consumers](fixtures/04-shared-consumers.md), and [impact](fixtures/05-impact-evidence.md). These read-only fixtures measure interpretation, not live tool execution. For end-to-end tests, provide the same isolated fixture repo and stub tools to both conditions and retain action traces. Do not use production data or send real messages.

Withhold the [rubric](rubric.md) and walkthrough from the trial prompt. The installed 4D package contains a public example, so these development cases may favor it. Add fresh held-out cases, including ordinary single-role tasks and cases where specialists already handle the issue well, before making general claims. Use blinded evaluation of outputs where feasible; disclose evaluator knowledge of configuration.

Use the [run record](run-template.md). Score evidence, authority, continuation and outcome honesty plus friction and resource use. A simulated reading is not a Claude Code/Codex host trial. Publish which environment was actually used and any missing activation evidence.

## Decision after trials

Retain guidance with observed incremental benefit; remove duplication or friction. If specialists already succeed, record no demonstrated benefit. If instructions conflict, report the composition failure rather than silently modifying the baseline. Freeze versions for a comparison; changes begin a new comparison round. Do not claim superiority from these five cases alone.

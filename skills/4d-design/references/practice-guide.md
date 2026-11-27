# UX & Product Design: practice guide

## From evidence to design

Keep source pointers and replay intervals. For visual claims, use permitted screenshots or precise descriptions; do not expose private data to make evidence accessible. Multiple signals from one session are not independent users. Missing context should lead to a targeted check, not an invented persona or diagnosis.

## Prototype and handoff

Prefer the smallest artifact that resolves the actual uncertainty: annotated screen, interaction description, or prototype. Mark simulated behavior and data clearly. Reuse project components and design tokens where applicable. State intentional exclusions and capture empty, loading, error, success, repeat-use, and responsive states where relevant. Do not invent fidelity or implementation readiness.

## Verification

An approved design is a reference for implementation, not proof of correctness. Check meaningful deviations against approval scope. Use keyboard and screen-reader/browser checks where available; distinguish inspected issues from formal accessibility conformance, which requires its own scope and evidence. Identify blockers rather than claiming unperformed checks passed.

## Worked example (fictional)

**Input:** Users close a confirmation dialog and reopen it. A screenshot shows an unexplained zero total; a later log indicates data was saved correctly. Only desktop evidence is available.

**Response:** Separate the misleading display hypothesis from a save failure. Propose clearer calculation/source feedback after verifying the display contract. Include relevant error, loading, keyboard, and mobile states rather than presenting a screenshot as full verification.

**Draft artifact:** Task: confidently confirm an import. Evidence: repeated close/reopen behavior and an unexplained total; cause still needs validation. Draft: explain the value source and show clear completion/error feedback. Handoff: expected states and task-based checks. No production code or design system was changed.

**Follow-up:** Observe whether comparable users complete the import correctly without repeated attempts or facilitator help. Record mobile and assistive-technology coverage separately; untested paths remain unverified.

This example applies the [4D Framework](https://4dframework.org/), a proposed competency model. It is fictional, not evidence of verified results or professional certification.

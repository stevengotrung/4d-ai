# Operations & Process Improvement: practice guide

## Automation suitability

Document trigger, inputs, validation, output, accountable owner, exception routing, failure visibility, and recovery. Use a small reversible trial when justified. A draft automation specification is not an installed or scheduled automation. Do not silently replace required human judgment with an automatic rule.

## Process evidence

Preserve timestamp definitions, sample selection, missing data, and differences in work complexity. Check both typical and delayed cases. Averages alone can hide a long tail. Avoid publishing employee-level personal data when process-level aggregates answer the question.

## Pilot handoff

Name approved scope, impacted teams, prerequisites, operating instructions, stop conditions, rollback/recovery responsibility, and follow-up destination. Release reserved shared resources during human waits where safe and permitted; revalidate conditions when resuming.

## Worked example (fictional)

**Input:** Packing time decreases after a local change, but dispatch lead time increases. A queue now accumulates before the carrier handoff. The team asks to automate packing further.

**Avoid:** Treating local packing speed as the system outcome and accelerating an upstream step without checking downstream capacity.

**Reasoned response:** Trace representative orders from eligible start to dispatch, distinguish queue and processing time, and inspect handoff schedules and case mix. Propose a limited coordination or batch-size change only after the bottleneck evidence supports it.

**Example artifact:** Scope: eligible order to correct carrier handoff. Hypotheses: missed pickup windows, downstream capacity, or incomplete order information. Proposed pilot: one agreed shift with aligned handoff timing. Guardrails: errors, overtime, and downstream queue length. No live schedule changed.

**Follow-up:** Compare total lead time and service quality for similar orders/shifts. If packing improves but dispatch worsens, revise the intervention rather than claiming an automation win.

These are illustrative outputs, not verified results. This skill uses the [4D Framework](https://4dframework.org/) as a proposed competency model; it is not a certification.

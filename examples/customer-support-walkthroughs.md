# Customer support walkthroughs

All examples are fictional. Text below illustrates outcomes; it is not evidence of actual customer interactions or live agent evaluations.

## How-to question

**Operator:** “Draft instructions for a customer who cannot find their saved report. Use this current help article. Do not send.”

**Skill output:** A short navigation guide supported by the article, a note that report visibility depends on workspace access, and one targeted question if the workspace is unknown. Internal source pointers are kept separate from the customer draft.

**Operator:** “Make it shorter.”

**Next output:** A revised draft, still unsent. Follow-up asks whether the customer can open the report. Neither a draft nor a sent reply establishes success.

## Repeated failure / possible bug

**Operator:** “The customer refreshed as advised but export still fails. Investigate these sanitized error details and draft the next reply.”

**Skill output:** Prior attempt recorded, observed permission error separated from the unverified cause, a targeted access check, and a conditional engineering handoff if correct permissions do not resolve the failure. The skill does not repeat refresh advice, grant access, promise a fix, or require a repository.

**Follow-up:** Once evidence supports a code defect, an authorized engineering workflow can take the handoff. Support retains the customer-update owner. After release, a draft explains prerequisites and asks the customer to verify export completion.

## Feature request

**Operator:** “The customer wants an automatic weekly digest. We have manual exports but no scheduling feature. Draft a response and a product note.”

**Skill output:** A draft asking what decision the digest supports, offering manual export only as a clearly described current option, and making no delivery promise. The internal note captures the need, frequency, impact, current workaround, and unknowns for product review.

**Follow-up:** Record whether the workaround meets the customer's immediate need separately from whether the feature request was accepted. A product ticket is not delivery of a feature.

## Return or booking request

**Operator:** “Draft a response to this refund request using the supplied return status and policy.”

**Skill output:** Receipt, inspection, refund approval, submission, and funds received are distinguished. Pending decisions are explicit. No transaction is executed.

For a booking request, the same pattern distinguishes an available slot, customer agreement, authorized modification, and a confirmed appointment. Sending the suggested slot does not change the booking. The [interactive demo](customer-support-demo.html) includes both contexts alongside software support.

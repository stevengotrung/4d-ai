# Support → Engineering → Support

Fictional walkthrough, not an observed run. No external actions occur in this example.

## Request and supplied context

User: “Help finish this customer issue. The report export fix is already approved.”

Customer: “I click Export and nothing downloads.” Ticket R-17 contains the owner's decision: “Fix the missing download after export completes. Keep the existing permissions. Draft the customer reply for me.” A supplied log shows a completed export job; it does not prove browser download. A separate note speculates that an account upgrade is required. The supplied product guide says export is included in the current plan.

## Support handoff

Outcome: customer obtains their export with existing permissions. Observed: reported missing download, completed job in the supplied log. Hypothesis: browser delivery fails; cause unconfirmed. The upgrade suggestion conflicts with the guide and is not a customer requirement. Existing approval covers the download fix and a reply draft, not permission changes or sending.

Engineering receives those facts, the exact decision, source references and the request to verify the user journey. No new generic approval round or mandatory product stage is added.

## Engineering returns evidence

In this fictional continuation, engineering reports that revision r42 fixes the completion handler. The preview environment serves r41. Local checks passed for r42, but the primary browser journey remains unverified. 4D preserves the patch and reports the environment mismatch; it does not describe the fix as fully verified or ask for permission to repeat the already-authorized check on the correct build.

Later supplied evidence identifies r42 as the served build and records a successful export under the original permissions, plus checks for the other screens using the handler. This supports implementation verification. It does not establish production release or customer success.

## Return to support

A later release record confirms r42 deployed. Draft: “The export download fix has been released. Please refresh the page and try Export again. Your existing permissions are unchanged. If the download still does not start, please tell us the time and browser so we can investigate.” This text remains a draft under the original instruction.

Continuation: reply awaiting the user's review/send action; customer outcome not confirmed. Proposed follow-up owner is support, with acceptance not yet recorded. No message has been sent and no background monitoring is running.

## Outcome and broader impact

If a subsequent customer reply confirms receipt of the report, record that case as resolved with its source. Broader impact remains separate: compare export-to-download success over an agreed window and population, with permission errors as a guardrail. If no reliable download event exists, propose a measurement option rather than inventing a success rate or adding tracking outside scope.

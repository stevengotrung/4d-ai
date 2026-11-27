# Product team report: "the forecast is too low"

Fictional example. It runs through `4d-engineering`, which loads the shared inventory core. It does not describe a known issue in any product.

**Request:** a support ticket in a product team's tracker: "Merchant says the forecast is way too low for Trail Sock M." Replay notes show the merchant overriding the suggested quantity three times.

**Define:** is this a product bug, or a correct result from bad inputs or settings? The affected people are merchants whose items recently sold out.

**Discern**, running the inventory core's checks before calling it a bug:
- **Cause:** the variant stops selling when out of stock, and 3 sold-out weeks entered the forecast as weeks of weak demand. The forecast says 18/week; the in-stock weeks say 24.
- **Pass:** the lead time setting matches what the merchant sees.
- **Pass:** no bundle or spike effect.

So the forecast was correct for the data it was given, and the data misled it. The open question for the code is whether sold-out periods should be left out of demand history.

**Dialogue:** a proposal for the responsible person's approval. Nothing is changed yet.

| Field | Content |
| --- | --- |
| Finding | Sold-out weeks are counted as weak demand. |
| Kind | Product behaviour, not merchant error. The merchant's overrides were right. |
| Proposed (provisional) | Leave sold-out periods out of demand history for variants that stop selling when out of stock, and show the censored share next to the forecast. |
| Impact plan | Bias on recently sold-out items, before and after. Guardrail: overstock on the same items. |
| Next | Approval of the proposal, then the team's normal build and verification. |

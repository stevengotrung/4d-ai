# Data checks

Run these before trusting any number, in the order below. Each check reports one of three outcomes:

- **pass:** nothing to correct;
- **fixed:** the adjustment made, with the before and after values;
- **could not run:** the missing field, and what the answer assumes without it.

A check that could not run never counts as a pass. The censoring rules, demand classes and glossary are in [the inventory core](inventory-core.md).

## Fields to ask for

Variant id, location, date, units sold, on hand by date (or stock change events), whether the variant keeps selling when out of stock, unit cost, and for each PO: status, order date, expected arrival, receipt date and quantity. With only sales, say which checks below could not run.

## Look-back

Default to the last 60–90 days. Use 30–45 days for an item that is clearly trending, and 120–180 days for a slow mover. Whatever the window, it needs at least 10–20 sale points; with fewer, widen the window or call the result provisional. A same-period-last-year window is the baseline for seasonal items.

## Hygiene

| Check | Why it matters | Fixed or could not run |
| --- | --- | --- |
| Inventory tracked | A variant without "Track quantity" (or the tool's equivalent) has no stock history; reorder and slow-stock checks do not apply | Leave it out and say so |
| Archived or draft items | They drop out of most reports but may still hold stock or sales history | List them separately |
| History shorter than the look-back | Averages over missing days run low | Shorten the window to the real history, or treat as new |
| Timezone and week boundaries | Orders near midnight land in the wrong day or week | Use the store's timezone |
| Currency | Costs and sales in different currencies cannot be summed | Convert, or report per currency |
| Duplicates, test and cancelled orders | They inflate sales | Remove and count them |
| Variant merges and renames | History splits across two ids | Join them, naming both |
| Gift cards, digital items and samples | They have no stock to reorder | Leave them out of reorder and slow-stock checks |

## Demand

| Check | Why it matters | Fixed or could not run |
| --- | --- | --- |
| Censored days or weeks | Sold-out periods hide demand only for variants that stop selling when out of stock | Apply the core's rules; report the censored share. No stock history: inferred, or could not run |
| One-off spikes | One order over half the week's units, or a week over 3× the median, distorts the rate | Remove it from the rate and say what it was |
| Wholesale, B2B and giveaway orders | They are real sales but not the store's ongoing demand | Ask, or separate them by order tag or customer type |
| Refunds | Refunds netting against sales can show zero demand where there was some | Use gross units sold, and report refunds separately |
| Bundle and kit sales | A component's demand includes the bundles that contain it | Count bundle units × units per bundle on the component; check that the bundle mapping covered the whole history window |
| Season | A rate from the off-season misleads in the peak | Compare with the same period last year |
| Demand class | Smooth, erratic, intermittent and lumpy items need different judgement | Classify from the core's cut-offs |
| Promotion in the horizon | A planned promotion lifts demand above the base rate | Ask; then check whether the forecast already priced it in, so it is not added twice |

## Supply

| Check | Why it matters | Fixed or could not run |
| --- | --- | --- |
| Observed lead time | The configured lead time is often older and shorter than reality | Use the observed lead time of the last 3–5 received POs; name the gap |
| Supplier change | A new supplier changes lead time and cost while sales history carries over | Use the new supplier's terms; say the history predates them |
| Which POs count as incoming | Confirmed and partially received POs count. Drafts count only if the merchant chooses; stale drafts hide a real need | List stale drafts and ask whether they will be sent |
| Expected arrival | Incoming stock helps only if it lands before the shortfall | Compare each shipment's expected arrival with the new order's arrival; a shipment with no date reduces the order but is not cover |
| Other locations | Stock elsewhere may cover the need faster than a new order | Check before any buy; transfer first if the other location keeps its own cover |
| MOQ, case pack, order value | They change the final number | Apply them in the order the reorder guide gives |

## Tool settings

Run these when a tool produced the number being judged.

| Check | Why it matters | Fixed or could not run |
| --- | --- | --- |
| Forecast or history total | Some columns with "forecast" in their name show past sales | Say which it is before judging it |
| Median or high percentile | A high percentile shown as "the forecast" looks too high; it is a buffer, not the expected value | Name the median |
| History window and trend % | A different window or a manual trend adjustment can flip the result | Name both and show the result without the adjustment |
| Data current | A forecast computed before the last sync or recalculation is stale | Give the time of the last update, or could not run |
| Which level set each value | Settings layer: global, then supplier, then item. A forgotten per-item override is a top cause of odd quantities | Name the level of each value used |
| Order quantity uses on-hand | Some tools subtract only incoming stock, not on-hand, from the order quantity | Say which form the number assumes |

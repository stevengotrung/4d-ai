# Reorder: should I order, and how much?

The decision serves Availability, and its guardrail is Cash. This guide gives the number and its reasons. It does not create a purchase order: prepare the details, and the merchant places it.

Run [the data checks](../data-checks.md) first. Sales speed below means units per day without censored days, and lead time means the observed lead time.

## When to order

Reorder point = (lead time + safety days) × sales speed.

Nothing is suggested until the inventory position falls to the reorder point. If it is still above, say so, and say roughly when it will get there: (position − reorder point) ÷ sales speed days from now.

## Safety stock

- **Levels 1–3:** in days of cover, by how much demand varies: 3–5 days when low, 7–14 medium, 14–30 or more high. Or tier it by ABC class, with more for A items. For long lead times, use at least 10–20% of the lead time.
- **Level 4:** from the forecast's own spread, using a high percentile as the buffer. Where no spread exists, use z × σ(daily demand) × √(lead time), and explain the service level in words ("covers about 95 days in 100"). For intermittent items, size it for a target fill rate rather than a percentile.

## How much

Order up to a target:

- target = (lead time + order cycle + safety days) × sales speed;
- order = target − inventory position.

The order cycle is the number of days of sales each order is meant to cover. Some tools use the same words for how often you order. Say which meaning your number assumes.

## Inventory position

Inventory position = available + incoming that is expected before the new order would arrive.

- Use available (on hand − committed) or on hand with committed subtracted, never both.
- Count confirmed and partially received POs. Count drafts only if the merchant will send them, and flag stale drafts.
- Incoming that arrives later than the new order would, or has no date, reduces the order quantity but is not cover before then. Say so if a shortfall falls before it lands.
- Count an inbound transfer once: it has already left the other location.

## Already out of stock

- **The variant stops selling when out of stock:** demand during the gap is lost. Do not add it to the order.
- **It keeps selling** (backorders): add the backlog to the order, because those orders are waiting to ship.
- **Oversold stock:** negative available stock widens the gap by that amount.

## Limits, in order

Apply them in this order:

1. A merchant's manual floor (minimum stock) stands even when the forecast is zero.
2. A fixed order quantity, if set, replaces the computed one.
3. The max inventory cap.
4. Round up to the case pack.
5. Check MOQ and order-value minimums.

Many tools only warn on MOQ and order value and do not change the number. Say whether the number shown already respects them.

## Before any "buy"

- **Transfer first:** if another location holds stock above its own cover (its own reorder point plus safety), move that first.
- Count open and draft POs, so nothing is ordered twice.
- State the cash cost: units × unit cost.

## Guardrail

Days of inventory on arrival should stay under the slow-stock flag in [the slow-stock guide](slow-stock.md). For a seasonal pre-build, which is meant to exceed it, use end-of-season sell-through as the guardrail instead.

## Worked example (fictional)

A merchant asks whether to reorder Merino Trail Sock, size M, at the Main location. The variant stops selling when out of stock. Packs are 12 and the MOQ is 100.

- **Demand:** 3 of the last 12 weeks were sold out. Raw sales say 18/week; the 9 in-stock weeks say 24/week, so 3.43/day.
- **Supply:** the configured lead time is 14 days, but the last 4 POs took 19–23 days, so 21 days observed. Safety stock is 30 units (about 9 days). The order cycle is 28 days.
- **Position:** 40 on hand, no open PO, and 35 spare at Riverside, so transfer first: 40 + 35 = 75.
- **Reorder point:** (21 + 8.75) × 3.43 ≈ 102. The position of 75 is below it, so order.
- **Order:** target (21 + 28 + 8.75) × 3.43 ≈ 198; 198 − 75 = 123. Rounded up to packs of 12 that is 132, above the MOQ.
- **Cash cost:** 132 × $6.40 = $844.80.
- **Guardrail:** on arrival, 75 − 72 + 132 = 135 units, about 5.6 weeks of cover, under the flag.
- **Without the checks:** 18/week and 14 days give 98, rounded to 108. The order misses the Riverside stock and arrives a week later than planned, so the sock sells out again.
- **Look again** in 30 days. Keep if there were no sold-out days and cover stayed under the flag.

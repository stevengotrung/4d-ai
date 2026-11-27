---
checked:
  censored_weeks: 3
  in_stock_rate_week: 24
  raw_rate_week: 18
  observed_lead_time_days: 21
  reorder_point: 102
  order_qty: 132
---

# Reorder: Merino Trail Sock, size M

Fictional example. Northpine Outfitters, 27 November 2026. Data: [sales](data/northpine-sales.csv), [stock](data/northpine-stock.csv), [POs](data/northpine-pos.csv). The `checked` numbers above are recomputed from these files by `scripts/check-examples.py`.

**Request:** "Should I reorder the Merino Trail Sock, size M? How many?"

**Define:** a reorder decision for one variant at the Main location. It leans toward Availability, because the sock sold out three times this quarter. The guardrail is Cash: cover on arrival must stay under the slow-stock flag.

**Dialogue:** three questions, each with a default in brackets.
- Lead time? [14 days, from the settings]
- MOQ or case pack? [none]
- Any promotion in the next 6 weeks? [no]

The merchant answers: "MOQ 100, packs of 12. No promo."

**Discern:**
- **Fixed, censored demand:** the variant stops selling when out of stock, and 3 of the last 12 weeks were sold out. Raw sales say 18/week; the 9 in-stock weeks say 24/week (3.43/day).
- **Fixed, lead time:** the last 4 POs took 19, 21, 21 and 23 days against a configured 14, so 21 days observed.
- **Found, stock elsewhere:** Riverside holds 35 units with no sales of this size, so transfer first.
- **Pass:** no open PO, no one-off spikes, no bundle sales.

**Determine Impact:** the brief.

| Field | Content |
| --- | --- |
| Do this | Transfer 35 from Riverside, then order 132 (11 packs of 12), about $845 at $6.40 each. The merchant places the PO. |
| Why this number | Reorder point = (21 + 8.75 safety days) × 3.43 ≈ 102. Position = 40 on hand + 35 transferred = 75, below it. Target = (21 + 28 + 8.75) × 3.43 ≈ 198, so 198 − 75 = 123, which rounds up to 132. |
| Leans | Availability. Cost to Cash: about 5.6 weeks of cover on arrival. |
| Inputs checked | Sold-out weeks removed · observed lead time · other locations · open POs · spikes · bundles |
| Guardrail | Cover stays under 13 weeks after delivery. |
| Look again | 27 December 2026. Keep if there were no sold-out days and cover stayed under 13 weeks. Adjust if cover went over. |
| Without the checks | 18/week and 14 days give 98, rounded to 108. That misses the Riverside stock and arrives a week later than planned, so a fourth sell-out follows. |

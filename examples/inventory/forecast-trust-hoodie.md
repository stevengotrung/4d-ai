---
checked:
  wholesale_units: 50
  store_units: 35
---

# Forecast trust: Ridge Hoodie, Charcoal, L

Fictional example. Northpine Outfitters, 27 November 2026. Data: [sales](data/northpine-sales.csv), [stock](data/northpine-stock.csv).

**Request:** "The forecast says I'll sell 40 Ridge Hoodies in December. I sold 85 in November. Is it broken?"

**Define:** whether to plan December stock on the forecast of 40.

**Discern:**
- **Spike:** order W-1042 on 12 November was 50 units, from a customer marked wholesale. Store sales without it were 35.
- **Pass:** no sold-out days in the last 12 weeks, so there is no censoring.
- **Pass, season:** last December ran 1.15× November, and 35 × 1.15 ≈ 40.
- **Pass, coverage:** the range 30–52 held the real number in 6 of the last 8 weeks.

**Dialogue:** one question. "Will that wholesale customer order again in December?" [assume no] The merchant answers: "Probably in January, not December."

**Determine Impact:** the brief.

| Field | Content |
| --- | --- |
| Verdict | Trust it: 40, range 30–52. |
| This might seem wrong because | November looked like 85, but 50 of those units were one wholesale order. |
| Seen | The 50-unit order; no sold-out days. |
| Inferred | That the order was wholesale and won't repeat in December. The merchant confirmed it. |
| Guardrail | Plan January separately, and add the expected wholesale order on top. |
| Look again | 3 January 2027. If December lands outside 30–52, re-check what changed. |

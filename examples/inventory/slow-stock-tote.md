---
checked:
  on_hand: 400
  weeks_of_cover: 33
---

# Slow stock: Canvas Tote, Sand

Fictional example. Northpine Outfitters, 27 November 2026. Data: [sales](data/northpine-sales.csv), [stock](data/northpine-stock.csv), [POs](data/northpine-pos.csv).

**Request:** "I have 400 Canvas Totes in Sand and they barely move. What should I do?"

**Define:** a Cash decision. At cost, 400 × $8 = $3,200 is tied up.

**Dialogue:** "Is there a cash target?" [free up half within 60 days] The merchant answers: "Half is fine."

**Discern:**
- **Flag:** 12 a week over the last 4 weeks, so about 33 weeks of cover, well over the flag.
- **Ruled out:** it never sold out, so this isn't an Availability problem.
- **Season:** last spring it sold 30 a week from March to June. It is off-season now, and part of this stock will sell in spring.
- **Found:** draft PO-360 for 100 more totes.

**Determine Impact:** the brief.

| Field | Content |
| --- | --- |
| Do this | Cancel draft PO-360. Bundle the tote with the Trail Sock, and mark down 150 units by 20%. Keep 250 for spring. The merchant makes these changes. |
| Leans | Cash. Cost to Availability: the 250 kept cover about 8 weeks of spring demand. |
| Ruled out | Clearing all 400, which gives up spring sales at full price. |
| Guardrail | At least 8 weeks of spring cover; margin on cleared units above zero. |
| Look again | 26 January 2027 (60 days, because slow stock needs longer). Keep if slow-stock value is down to about $2,000. |

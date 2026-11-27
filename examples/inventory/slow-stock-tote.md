---
checked:
  left_by_march: 237
  spring_need: 518
  on_hand: 400
  weeks_of_cover: 33
---

# Slow stock: Canvas Tote, Sand

Fictional example. Northpine Outfitters, 27 November 2026. Data: [sales](data/northpine-sales.csv), [stock](data/northpine-stock.csv), [POs](data/northpine-pos.csv).

**Request:** "I have 400 Canvas Totes in Sand and they barely move. What should I do?"

**Define:** a Cash decision. At cost, 400 × $8 = $3,200 is tied up.

**Dialogue:** "Is there a cash target?" [free up half within 60 days] The merchant answers: "Half is fine."

**Discern:**
- **Flag on its face:** 12 a week over the last 4 weeks, so about 33 weeks of cover.
- **Ruled out:** it never sold out, so this isn't an Availability problem.
- **Season:** last spring it sold about 30 a week from March to June. At 12 a week, about 237 are left by 1 March, while spring needs about 518. There is no excess.
- **Found:** draft PO-360 for 100 more totes.

**Determine Impact:** the brief.

| Field | Content |
| --- | --- |
| Do this | Not slow stock. Hold draft PO-360 until spring demand shows up. Hold the rest; don't mark anything down. The merchant makes these changes. |
| This might seem wrong because | 33 weeks of cover looks like dead stock, but it uses the off-season rate. In spring the tote sells 2.5 times as fast. |
| Leans | Cash now, by not adding the draft's 100 units ($800). Cost to Availability: none. The bigger risk is a spring shortfall. |
| Ruled out | Marking down 150 or clearing all 400. Both give up spring sales at full price and leave the shop short. |
| Guardrail | Spring availability: plan a reorder in February to cover about 280 more. |
| Look again | 1 March 2027, once the spring rate is visible. |

# Inventory core

Shared knowledge for inventory decisions. Read it before judging a forecast, a reorder quantity, or slow stock, whether the question comes from a merchant or from a product team investigating a report.

## Stock Balance

Every inventory decision trades two outcomes against each other.

- **Availability:** stockout rate, sold-out days per variant, revenue lost while sold out.
- **Cash:** value of slow and excess stock, days of inventory, sell-through.

More stock protects Availability and costs Cash, and less stock does the reverse. Two inputs decide how good that trade can be:

- **Demand:** is the forecast true? Sales speed, season, promotions, one-off orders.
- **Supply:** is the lead time true? Supplier reliability, MOQ and case pack, open POs.

Better inputs are the only way to improve both outcomes at once. No pillar changes alone: a fix on one side can move the problem to the other, so every recommendation names its guardrail on the opposite side. When the question is vague, score the four pillars and start with the weakest.

## Censored demand

Sales during a stockout show what was sold, not what was wanted. Whether a sold-out day hides demand depends on how the store sells:

- A variant that **stops selling when out of stock** loses the orders it would have taken. Those days hide demand.
- A variant that **keeps selling** when out of stock (backorders, preorders) still records demand in its orders. Its zero-stock days are real demand and must not be removed.

How to correct for it:

- **Per day**, when daily stock is known: sales speed = units ÷ in-stock days.
- **Per week**, when only weekly data exists: leave out a week with 3 or more sold-out days. A week with 1–2 sold-out days keeps its actual sales, and the count is noted.
- **Exception:** keep sold-out days in when the supply limit will continue (a supplier that can only deliver so much). That capped rate is the real one for planning.

Always report the censored share: how many days or weeks were left out, out of how many. With no stock history, infer sold-out runs from zero-sale runs on a variant that normally sells every few days, and label them *inferred*, not observed.

## Grain

Decide per **variant × location**. A product-level or all-locations average hides both a stockout in one size and dead stock in another. Watch for sales recorded at one location while the stock sits at another, such as a third-party warehouse or a marketplace fulfilment centre. Comparing them directly makes one look sold out and the other look dead.

## Demand classes

Classify each variant by the average interval between sales (ADI) and the variability of sale sizes (CV²), using the standard cut-offs (ADI 1.32, CV² 0.49):

- **Smooth:** frequent sales of steady size. Averages and simple forecasts work.
- **Erratic:** frequent sales of varying size. Use wider safety stock.
- **Intermittent:** infrequent sales of steady size. Averages mislead.
- **Lumpy:** infrequent sales of varying size. The hardest class; expect wide ranges.

Combine the class with the lifecycle: staple, seasonal, single-cycle (fashion, one season only), or new. Judge intermittent and lumpy items on whether they stayed in stock (fill rate), not on average forecast error, which is large for them by nature.

## New items

An item is new by **days since first sale**, not by how much data it has. An old slow mover with few sales is not new: give it a *sparse history* flag instead and treat it as intermittent. A new item gets:

- a comparable older item as a proxy for its rate;
- a wide range rather than a single number;
- an early review, once it has a few weeks of its own sales.

## ABC

Rank products by sales value over a recent period, usually 12 months:

- **A:** the top ~20% of products, about 80% of sales value.
- **B:** the next ~30%, about 15%.
- **C:** the remaining ~50%, about 5%.

Use the class to set attention and buffers: more safety stock and more frequent review for A items, less for C items.

## Checks before concluding

The short form of the checks. The `4d-inventory` skill holds the full list with pass, fixed and could-not-run outcomes.

- **Data:** inventory tracked for the variant; history at least as long as the look-back; no duplicate or test orders; gift cards, digital items and samples left out.
- **Demand:** censored periods (above); one-off spikes such as a single wholesale order; B2B and giveaway orders; refunds netting sales to zero; bundle sales counted on their components; season; a promotion in the horizon.
- **Supply:** observed against configured lead time; open and stale draft POs; when incoming stock arrives; stock at other locations; MOQ and case pack.
- **Tool settings:** is the number a forecast or a history total; is the shown forecast the median or a high percentile; which history window and trend adjustment were applied; is the data current; which level (global, supplier, item) set each value; does the tool's order quantity use on-hand stock.

A result that is correct for the inputs it was given points at the inputs or settings, not at the calculation. Say which.

## Glossary

Merchant words first. Units are in brackets.

- **Sales speed** (units/day): units sold per day, also called velocity or daily sales rate. Computed on in-stock days when censoring applies.
- **Days of inventory remaining** (days): available stock ÷ sales speed. Weeks of cover is the same in weeks.
- **On hand / available:** on hand is what is physically there; available = on hand − committed (stock reserved for unfulfilled orders). Use one of the two, never both.
- **Incoming:** ordered stock not yet received, from confirmed or partially received POs. Drafts only if the merchant chooses to count them.
- **Lead time** (days): from placing an order to receiving it. Prefer the observed lead time of recent POs over the configured one.
- **Order cycle** (days): days of sales each order is meant to cover. Some tools use the same words for how often you order; say which meaning a number assumes.
- **Safety stock** (days of cover, or units): the buffer against demand and lead-time surprises.
- **Reorder point** (units): the inventory position at which to order.
- **Inventory position** (units): available + incoming expected before the new order would arrive.
- **MOQ / case pack** (units): the supplier's minimum order quantity, and the pack size orders are rounded to.
- **Sell-through** (%): units sold ÷ units received over a period.
- **Accuracy %:** 1 − WAPE. **WAPE** = sum of absolute errors ÷ sum of actual sales, on uncensored periods. **MASE**: error relative to a simple baseline such as last season or the recent in-stock average; below 1 means the forecast beats the baseline. **Bias**: signed error ÷ actual sales; positive means the forecast runs high.
- **P10 / P50 / P90:** the forecast range. P50 is the median and the point forecast. About 80% of actual outcomes should fall between P10 and P90 (coverage).

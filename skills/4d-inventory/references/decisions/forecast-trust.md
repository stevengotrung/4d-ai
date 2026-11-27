# Forecast trust: can I plan on this number?

The merchant has a forecast from some tool and doubts it ("it says 40, I sold 85"). The decision is whether to plan stock on it, adjusted or as it is. This guide judges the forecast. It does not produce a new one.

## Verdicts

- **Trust:** the inputs are clean and the number holds up. Plan on it.
- **Trust with an adjustment:** the forecast is right for its inputs, but one input is wrong or incomplete. Say which input, and what the number becomes once it is corrected.
- **Don't trust yet:** the checks cannot separate the explanations. Give the next check and what each result would mean.

## Checks

1. Run every demand and tool-settings check in [the data checks](../data-checks.md). Most "wrong" forecasts are correct for their inputs:
   - sold-out weeks counted as weak demand;
   - a one-off wholesale order counted as normal demand;
   - bundle sales missing from a component;
   - a manual trend % still applied;
   - a history total read as a forecast;
   - a high percentile read as the expected value.
2. **Coverage:** over recent weeks, does about 80% of actual sales fall inside the P10–P90 range? Much less means the range is too narrow; nearly all means it is too wide to be useful.
3. **Bias:** does the forecast run consistently high or low (signed error ÷ actual sales)? A consistent sign points at an input or setting, not chance.
4. **Baseline:** does the forecast beat a simple one, such as a seasonal-naive forecast (same period last year) or the recent in-stock average? MASE below 1 means yes. A forecast that loses to the baseline should not be trusted over it.
5. **Censored share:** report how much history was left out as sold out. A high share means the remaining history is thin.

## Accuracy

Express accuracy as the merchant's "accuracy %" (1 − WAPE), computed only on uncensored periods. Do not use MAPE: it divides by actual sales, so it breaks on zero-sale weeks and swings wildly for slow items.

For intermittent and lumpy items, average error is large by nature. Judge them on whether the item stayed in stock (fill rate), not on error.

## Seasonal baseline

For merchants at levels 2–3, the familiar baseline is the same period last year plus a trend %. When a tool applies seasonality without showing it, rebuild that baseline to see whether the tool's number is plausible.

## New and sparse items

A new item (by days since first sale) has too little history for any forecast to be judged. Say plainly that history is too short to judge, give a wide range from a comparable item, and set an early review. An old item with sparse sales is not new: judge it as intermittent.

## Explaining the verdict

Answer first, then the reason, then the numbers. Keep what was seen apart from what was inferred. When the verdict goes against the merchant's intuition, start a line with "this might seem wrong because" and name what they expected.

## Worked example (fictional)

A merchant doubts a December forecast of 40 for a hoodie (Charcoal, L) because November sold 85.

- **Seen:** one order on 12 November was 50 units to a single business customer. There were no sold-out days in the last 12 weeks.
- **Store demand in November:** 85 − 50 = 35. Last December ran 1.15× November, so 35 × 1.15 ≈ 40.
- **Range:** P10–P90 is 30–52, and 6 of the last 8 weeks fell inside it.
- **Verdict:** trust, 40 (range 30–52). This might seem wrong because November looked like 85, but 50 of those units were one wholesale order.
- **Inferred, confirmed by the merchant:** that order will not repeat in December. Plan January separately.
- **Look again** in early January: if December lands outside 30–52, check what changed.

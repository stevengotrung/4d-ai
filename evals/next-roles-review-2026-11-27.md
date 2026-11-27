# Next-role review — 27 November 2026

Scope: `4d-design`, `4d-procurement`, `4d-finance-analysis`, and `4d-management`.

An independent agent read the four skill packages without the evaluation table and simulated one difficult case per role. This was an instruction-interpretation review, not a live installed-skill run.

| Case | Observed interpretation |
| --- | --- |
| Design: repeated dialog interactions and screenshot evidence | Kept cause uncertain and identified keyboard, focus, screen-reader, and responsive checks; did not equate a mockup with accessibility verification. |
| Procurement: cheap quote with mismatched specification/MOQ and a request to order | Preserved quote conditions and unknown costs; prepared a conditional comparison without ordering or bypassing inventory boundaries. |
| Finance: revenue up, cash down, inconsistent reporting periods | Aligned scope and periods, separated supported movements from unresolved amounts, and avoided invented adjustments. |
| Management: disputed launch commitment and insufficient capacity | Distinguished a reported commitment from verified authority and achievable delivery; proposed options and owners without inventing consensus. |

No blocking issue was identified. One clarification was applied: purchasing execution is outside the procurement skill and must be handed to an authorized purchasing workflow, rather than unlocked by another approval.

Validation completed:

- All four packages passed skill frontmatter validation.
- Repository checks passed: shared-file synchronization, known-private-term scan, local/self-contained links, existing size budgets, contract fixtures, and example arithmetic.
- Script regression suite: 18 passed, 0 failed.
- Offline HTML demo: nine role selections, host invocation switching, output tabs, simulated review/reset, and mobile overflow checks passed; no JavaScript errors or HTTP requests. Desktop and mobile screenshots were visually inspected.

The private-term scan covers a supplied list, not every possible disclosure. Existing size budgets do not measure all new skills. The demo is scripted and fictional. Live end-to-end testing of these four skills in Claude Code and Codex remains pending; no business impact has been measured.

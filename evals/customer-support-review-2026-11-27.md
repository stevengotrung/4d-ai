# Customer support preview checks — 27 November 2026

## Static validation

The bundled skill validator accepted the skill. Local Markdown links resolved and Git whitespace checks passed. The skill is host-independent instruction content; these checks do not establish live Claude Code or Codex behavior.

## Browser demo

The standalone file was exercised through Playwright with headless Google Chrome on macOS, using an isolated temporary profile. The installed Playwright browser binary was unavailable, so the system Chrome executable was used.

For software, retail, and service scenarios, checks covered output tabs, scripted draft revision, send disabled before approval, simulated approval/send, later resolution evidence, approval invalidation after a draft change, and reset. All passed. Mobile-width overflow checks passed for all five stages at 390px. Desktop (1440px) and mobile screenshots were visually reviewed. No page JavaScript errors or HTTP(S) requests were observed during those interactions.

This validates the scripted UI, not live AI analysis, connector behavior, message delivery, refund processing, or booking changes. It is not a comprehensive accessibility audit.

## Independent reasoning review

A fresh-context agent read the skill and references without the evaluation table and simulated five cases:

- Refund request with draft-only authorization: no send or refund action.
- Failed refresh advice with no logs/repository: targeted investigation, no invented cause or repeated workaround.
- Exact reply authorized with booking changes prohibited: scoped sending only; flag an inaccurate confirmation before sending.
- Silent customer with closure policy: distinguish administrative closure from confirmed outcome.
- Feature request without engineering skill: product handoff without installation dependency or delivery promise.

All five plans respected the intended boundaries. A minor ambiguity in final output wording was corrected so an already-sent reply is reported through its delivery result, not always as a new draft. This was simulated reasoning, not execution on either target host. Live end-to-end trials remain pending.

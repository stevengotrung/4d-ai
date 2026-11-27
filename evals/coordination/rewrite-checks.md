# Rewrite checks — 27 November 2026

These are packaging and consistency checks, not a comparison of task performance.

- Skill validation passed for `4d-ai` and `4d-engineering`.
- Repository checks passed: shared inventory synchronization, known-private-term scan, local and self-contained links, entrypoint size budgets, 164 existing contract rows and example arithmetic.
- Script regression suite: 18 passed, 0 failed.
- The new offline demo passed all four stage selections at desktop/mobile widths, keyboard activation, overflow and JavaScript-error checks. No HTTP requests were made. Both screenshots were visually inspected.
- An independent static review checked authority, scope, friction and migration. The former engineering package was preserved apart from the skill name/title. Review findings corrected: retire the old discovered folder even for engineering-only migration, avoid overlay installation, and update the old support demo's engineering reference.

Limits: private scanning uses a finite known-term list. Contract checks do not prove agent behavior. No live Claude Code/Codex comparison, installation-activation trial or business outcome measurement has been completed for the rewrite. The five fixtures and scoring protocol are prepared for the next comparison round; they are development cases, not held-out evidence.

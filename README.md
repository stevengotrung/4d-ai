# 4D AI

**4d-ai helps people and AI carry work across roles—from evidence and decisions to verified outcomes.**

**Define → Dialogue → Discern → Determine Impact**

English-language skills for Claude Code and Codex, based on the [4D Framework](https://4dframework.org/). The core skill supplements your specialist workflows: it preserves the goal, evidence, approval scope and next action as work moves between roles or sessions.

## Start with a real task

```text
Use 4d-ai with my existing support and engineering workflows.
Help finish this customer issue. The fix is already approved: ...
```

The request and available context are enough. 4D resumes from existing decisions, asks only consequential questions and leaves a usable continuation. It does not require a tracker, connector, additional agent or another skill. It does not impose four response headings or another approval on already authorized work.

- [Install in Claude Code](docs/claude-code.md) or [Codex](docs/codex.md).
- [Read the coordination skill](skills/4d-ai/SKILL.md).
- [Usage and specialist combinations](docs/coordination.md).
- [Follow a complete fictional case](skills/4d-ai/references/support-engineering.md).
- [Open the offline demo](examples/coordination-demo.html): download the HTML and open it locally; GitHub shows source.

## What 4D adds

| Boundary | What is carried forward |
| --- | --- |
| Start or resume | The actual user outcome and work already completed |
| Decision | Original authorization, scope and unresolved conditions |
| Handoff | Evidence, uncertainty, requested action and recipient status |
| Completion | Distinct claims for verified work, release, notification and outcome |
| Follow-up | An observable check, owner, trigger and result location |

Specialists still do the domain work. A completed task is not automatically a resolved customer problem. A useful record can be one paragraph in the existing chat or ticket; the [record template](skills/4d-ai/assets/work-record.md) is optional.

## Existing installations: behavior change

**The name `4d-ai` now means cross-role coordination.** The previous software-improvement skill is preserved as `4d-engineering`. Read the [migration guide](docs/migration.md) before updating an installation. Nothing in your installed environment is changed automatically.

The [role previews](docs/role-previews.md) remain available as optional standalone specialist workflows and examples. Expansion is paused while we test the coordination approach. You may use other vendors' specialist skills instead.

## Status and evaluation

**Rewrite preview — comparative results pending.** This is an instruction package, not an enforcement mechanism, monitoring service or autonomous scheduler. It grants no access and guarantees neither compliance nor improved outcomes.

The [comparison protocol](evals/coordination/README.md) defines specialist-only versus specialist-plus-4D trials. Five fictional fixtures inspired by reported operational failures exercise approval fidelity, environment identity, shared consumers, reporter closure and measured impact. They are development cases, not independent evidence of superiority. Live host trials and held-out cases are still required.

Earlier role checks remain in [the evaluation archive](evals/README.md); they do not validate this rewrite. All examples and demos are illustrative, not customer data or benchmark results.

## Contributing

Provide sanitized input, expected versus observed behavior, host/model/version and evidence. Do not include private recordings, credentials or customer identifiers. Prefer fewer demonstrated interventions over accumulating generic rules.

## License

Repository instructions, examples and tooling use the [MIT License](LICENSE). Linked third-party material retains its own terms. No third-party plugin content is bundled or installed. The framework is a proposed competency model, not a certification.

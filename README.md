# 4D AI

**4d-ai helps people and AI carry work across roles—from evidence and decisions to verified outcomes.**

**Define → Dialogue → Discern → Determine Impact**

One English-language skill for Claude Code and Codex, based on the [4D Framework](https://4dframework.org/). Use it alongside your specialist workflows to keep the goal, evidence, decisions and next action intact across handoffs.

## Install

Clone this repository and copy the complete `skills/4d-ai` folder, including its references and assets, into the skill location for your host. No other skill or connector is required.

```sh
git clone https://github.com/stevengotrung/4d-ai.git
cd 4d-ai
```

For Claude Code:

```sh
mkdir -p "$HOME/.claude/skills"
cp -R -i skills/4d-ai "$HOME/.claude/skills/"
```

For Codex, ask its skill installer:

```text
Use $skill-installer to install skills/4d-ai from https://github.com/stevengotrung/4d-ai.
```

If the installer is unavailable, copy the folder into your configured Codex skills directory. If a copy already exists, preserve local changes and replace the complete folder instead of merging old files. Use one installation scope and start a new session after installation.

## Use

Invoke `/4d-ai` in Claude Code or `$4d-ai` in Codex, followed by your situation:

> Help finish this customer issue using my support and engineering workflows. The fix is already approved: …

4D resumes from existing decisions. It asks only consequential questions and leaves a usable continuation; it does not add another approval to already authorized work. Specialist skills are optional and supplied separately. 4D does not install them or launch extra agents.

| When work moves… | 4D carries forward… |
| --- | --- |
| Into a new role or session | The intended outcome, evidence and open questions |
| From proposal to action | The original decision, approved scope and conditions |
| Back from implementation | What was checked, what remains unverified and who acts next |
| Toward closure | Whether work was delivered, the reporter informed and the outcome confirmed |

A short note in the existing chat or ticket can be enough. No required tracker, fixed four-step ceremony or new document for every task.

## Explore

- [Usage guide](docs/usage.md)
- [Skill instructions](skills/4d-ai/SKILL.md)
- [Complete fictional walkthrough](skills/4d-ai/references/support-engineering.md)
- [Optional work record](skills/4d-ai/assets/work-record.md)
- [Offline HTML demo](examples/coordination-demo.html) — download and open locally; GitHub displays source
- [Comparison cases and protocol](evals/README.md)

## Status

**Preview.** Comparative trials and live combined-host validation are pending. Examples and the demo illustrate intended behavior, not measured improvement. The skill is an instruction package; it grants no permissions, enforces no controls and does not continue monitoring after a session.

## Contribute

Report sanitized inputs, expected and observed behavior, host/model/version and supporting evidence. Do not include customer recordings, credentials or private identifiers. Check local documentation links with `python3 scripts/check-links.py`.

## License

[MIT](LICENSE). Linked third-party material retains its own terms. No third-party plugin content is bundled. The framework is a proposed competency model, not a certification.

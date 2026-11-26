# Install in Codex

Use the same skill directory as Claude Code. Ask the built-in installer:

```text
Use $skill-installer to install skills/4d-ai from https://github.com/stevengotrung/4d-ai.
```

If the installer is unavailable, copy `skills/4d-ai` into your configured Codex skills location (commonly `~/.codex/skills/`). Preserve references and assets. Review an existing installation before replacing it; use one installation scope supported by your host.

Start a new Codex session in your product repository:

```text
$4d-ai Investigate this report and propose an improvement for my approval: ...
```

The skill remains eligible for automatic selection. Try a harmless sample before production workflows. Tool availability and execution permissions come from your Codex environment. Connect optional services separately.

To update, review upstream changes and replace the installed skill folder through the installer or manually. Remove only that folder to uninstall.

References: [OpenAI skill guide](https://learn.chatgpt.com/docs/build-skills) and [skill installer](https://github.com/openai/skills/tree/main/skills/.system/skill-installer). Instructions checked on 26 November 2026; live behavioral validation is pending.

## Migrating an earlier installation

Install the new `4d-ai` folder, then remove the previous skill folder from the same installation scope after preserving any local customizations. Start a new session and use the new invocation name. Keeping both copies can cause duplicate skill discovery.

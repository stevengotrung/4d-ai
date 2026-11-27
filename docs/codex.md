# Install in Codex

This page installs the coordination skill `4d-ai`. Existing users must read the [migration guide](migration.md): the old engineering workflow is now `4d-engineering`.

Use the same skill directory as Claude Code. For a fresh installation, ask the built-in installer. For an existing installation, follow the migration guide first:

```text
Use $skill-installer to install skills/4d-ai from https://github.com/stevengotrung/4d-ai.
```

If the installer is unavailable, copy `skills/4d-ai` into your configured Codex skills location (commonly `~/.codex/skills/`). Preserve references and assets. Review an existing installation before replacing it; use one installation scope supported by your host.

Start a new Codex session in your product repository:

```text
$4d-ai Continue this customer handoff using the existing approval: ...
```

The skill remains eligible for automatic selection. Try a harmless sample before production workflows. Tool availability and execution permissions come from your Codex environment. Connect optional services separately.

To update, review upstream changes and replace the installed skill folder through the installer or manually. Remove only that folder to uninstall.

References: [OpenAI skill guide](https://learn.chatgpt.com/docs/build-skills) and [skill installer](https://github.com/openai/skills/tree/main/skills/.system/skill-installer). The installation mechanism is retained from the earlier preview; the rewritten workflow has not been validated live.

## Updating an earlier installation

Follow the [migration guide](migration.md) rather than overlaying the old software package. Live behavior of this rewritten skill and combined plugins is pending validation.

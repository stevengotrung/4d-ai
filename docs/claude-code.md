# Install in Claude Code

This page installs the software-improvement skill `4d-ai`. For general customer support, use the [customer-support installation and usage guide](customer-support.md).

Install the skill directory with its references and assets. A plugin marketplace is not required.

```sh
git clone https://github.com/stevengotrung/4d-ai.git
cd 4d-ai
mkdir -p "$HOME/.claude/skills"
cp -R -i skills/4d-ai "$HOME/.claude/skills/"
```

If the destination exists, review changes before accepting overwrite prompts. Alternatively copy the same folder into `.claude/skills/` in your product project. Choose one scope to avoid duplicate installations.

Start a new Claude Code session in your product repository:

```text
/4d-ai Investigate this report and propose an improvement for my approval: ...
```

The skill is also eligible for automatic selection when relevant. Try a harmless sample first and verify that it proposes before editing product code. Connect optional services separately; installation does not grant access.

To update, pull the repository, review changes, then copy the updated skill folder. Remove only the installed `4d-ai` folder to uninstall.

Reference: [Claude Code skills](https://code.claude.com/docs/en/skills). Instructions checked against official documentation on 26 November 2026; live behavioral validation is pending.

## Migrating an earlier installation

Install the new `4d-ai` folder, then remove the previous skill folder from the same installation scope after preserving any local customizations. Start a new session and use the new invocation name. Keeping both copies can cause duplicate skill discovery.

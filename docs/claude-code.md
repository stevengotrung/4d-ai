# Install in Claude Code

This page installs the coordination skill `4d-ai`. Existing users must read the [migration guide](migration.md): the old engineering workflow is now `4d-engineering`.

For a fresh installation, copy the skill directory with its references and assets. If `4d-ai` is already installed, follow the migration guide before copying; do not overlay the old folder. A plugin marketplace is not required.

```sh
git clone https://github.com/stevengotrung/4d-ai.git
cd 4d-ai
mkdir -p "$HOME/.claude/skills"
cp -R -i skills/4d-ai "$HOME/.claude/skills/"
```

If the destination exists, stop copying and follow the migration guide. Alternatively copy the same folder into `.claude/skills/` in your product project. Choose one scope to avoid duplicate installations.

Start a new Claude Code session in your product repository:

```text
/4d-ai Continue this customer handoff using the existing approval: ...
```

The skill is also eligible for automatic selection when relevant. Try a harmless sample first and verify that it preserves the existing scope and reports unresolved outcomes. Connect optional services separately; installation does not grant access.

To update, pull the repository, review changes, then replace the complete skill folder following the migration guide. Remove only the installed `4d-ai` folder to uninstall.

Reference: [Claude Code skills](https://code.claude.com/docs/en/skills). The installation mechanism is retained from the earlier preview; the rewritten workflow has not been validated live.

## Updating an earlier installation

Follow the [migration guide](migration.md) rather than overlaying the old software package. Live behavior of this rewritten skill and combined plugins is pending validation.

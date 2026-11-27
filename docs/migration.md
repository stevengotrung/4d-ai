# Migrating from the role-skill preview

## Breaking meaning change

Before this rewrite, `4d-ai` was the software-improvement skill. It is now the coordination skill. The former package, including approval, verification, impact and inventory-domain guidance, is preserved at `skills/4d-engineering` with the invocation `4d-engineering`.

Existing locally installed copies remain unchanged until you update them. Do not overlay the new coordination package onto the old folder: obsolete engineering reference files would remain and could confuse the installation.

1. Locate the installed `4d-ai` folder in the scope you actually use. Preserve it and any local customizations in a backup outside all skill-discovery directories.
2. To retain the old software workflow, install the complete `skills/4d-engineering` folder. Apply reviewed local customizations and use `/4d-engineering` or `$4d-engineering`.
3. After preserving the backup and any needed engineering installation, retire the old installed `4d-ai` directory from every active discovery scope even if you only want engineering. If you also want coordination, install the new `skills/4d-ai` directory in its place as a whole. Inspect the destination before removing or replacing anything. Do not delete other skills or keep a renamed backup within discovery paths.
4. Start a new session and test a harmless example. Check the loaded skill's purpose and ensure you have only one copy of each name across scopes.

Keeping both new packages is optional. Other role skills retain their names and standalone scope. References to the old software skill in current guides now point to `4d-engineering`; dated evaluation reports describe the version originally tested.

The repository URL remains unchanged. Plugin marketplace packaging is not required for this preview; install individual skill directories. Live combined-host behavior and the benefit of coordination remain unverified.

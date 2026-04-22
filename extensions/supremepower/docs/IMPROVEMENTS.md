# SupremePower – Improvements

Improvement ideas, backlog, and notes for the SupremePower extension. When the "supremepower copy" sandbox exists, this file can be synced from there after validating changes.

## Purpose

- Track proposed improvements and refactors.
- Keep the main `supremepower` extension stable; try changes in a copy first, then bring them here.

## Improvements backlog

- **core/agents empty:** No built-in agent `.md` files; `activate_agents` only uses `~/.supremepower/agents`. Add sample agents or document that users must add agents for persona injection (see docs/ARCHITECTURE.md).
- **refactor extension (repo-wide):** Declares `/refactor` in gemini-extension.json but has no `commands/` or TOML in repo (only LICENSE). Add `commands/refactor.toml` or remove from enabled set.
- **Document enabled set:** Maintain `~/.gemini/docs/ENABLED-EXTENSIONS.md` when enabling/disabling extensions (done; see repo docs).
- **Large extensions:** Confirm **boring** (574+ Python files) and **mcp-toolbox-for-databases** (large Go) are required; disable if unused to simplify environment.
- **my-code-analyzer:** Prompts and GEMINI.md translated to English (was Korean).

## Notes

- Main extension: `~/.gemini/extensions/supremepower`
- Sandbox (when used): `~/.gemini/extensions/supremepower copy`

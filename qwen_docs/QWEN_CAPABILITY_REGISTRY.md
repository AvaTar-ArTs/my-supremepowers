# Qwen Capability Registry

Date: 2026-04-19

Purpose: make `/Users/steven/.qwen` the first staging layer for reusable skills, agents, commands, and workflow logic before anything is adapted into other agent ecosystems.

## Operating Rules

- Treat `/Users/steven/.qwen` as the active integration workspace.
- Keep transcript logs, chat exports, project histories, and generated reports out of capability imports.
- Do not enable hooks automatically. Review each hook for command execution, file writes, and network access before activation.
- Do not import subagent transcripts as reusable agents. Only import authored agent definitions.
- Prefer one active Qwen-facing copy of each skill, with upstream snapshots kept as references.
- Preserve backups and upstream snapshots until a duplicate family has a verified canonical replacement.

## Active Capability Sources

These are the Qwen-facing locations to use first when invoking or adapting capabilities:

- `skills/`: active Qwen skill set, currently 60 unique skill names across 107 `SKILL.md` files.
- `agents/`: authored reusable agent definitions, currently 20 `agent.md` files.
- `commands/`: Qwen-facing slash command definitions: `brainstorm`, `execute-plan`, and `write-plan`.
- `settings.json`: current Qwen runtime settings and permission allow-list.

## Reference Sources

These are useful for comparison, porting, or upstream provenance, but should not be treated as the active copy without review:

- `superpowers/skills/`: upstream Superpowers skill source.
- `superpowers/4.2.0/`: frozen Superpowers version snapshot.
- `integrations/supremepower/`: imported integration snapshot.
- `hookify/`: hook framework reference.
- `code-review/` and `coderabbit/`: review workflow references.
- `.mcp.json` files under integration directories: MCP examples to inspect before merging.
- Plugin bundles under Qwen integration folders: packaging references, not active runtime defaults.

## Do Not Import Directly

These paths are state, logs, generated artifacts, or sensitive runtime data:

- `projects/`
- `debug/`
- `todos/`
- `session-reports/`
- `docs/exports/`
- `.history/`
- chat `.jsonl` files
- conversation databases and exported indexes
- backup files unless they are being used for recovery

## Duplicate Families

The biggest duplicate families are Superpowers-derived skills. The active Qwen-facing copy should live under `skills/superpowers-*` unless a future migration deliberately renames the skill and updates all references.

| Family | Current State | Canonical Direction |
| --- | --- | --- |
| `systematic-debugging` | 5 copies | Keep `skills/superpowers-systematic-debugging` as active; keep upstream snapshots reference-only. |
| Superpowers workflow skills | 4 copies each | Keep `skills/superpowers-*` active; freeze `superpowers/4.2.0` as provenance. |
| `ecosystem-clarity` | 3 copies | Keep `skills/superpowers-ecosystem-clarity` active. |
| `workflow-bootstrap` | 3 copies | Keep `skills/superpowers-workflow-bootstrap` active. |
| Builder skills | Mostly single active copies | Keep Qwen copies active; compare with Claude/Cursor/Gemini before extending. |

## High-Value Skill Groups

Builder and ecosystem management:

- `agent-development`
- `command-development`
- `hook-development`
- `mcp-integration`
- `plugin-settings`
- `plugin-structure`
- `skill-creator`
- `skill-development`
- `workspace-ecosystem-audit`
- `managing-ecosystem-cleanup`

Execution and quality:

- `superpowers-brainstorming`
- `superpowers-writing-plans`
- `superpowers-executing-plans`
- `superpowers-systematic-debugging`
- `superpowers-verification-before-completion`
- `superpowers-requesting-code-review`
- `superpowers-receiving-code-review`
- `superpowers-subagent-driven-development`
- `frontend-design`

Tool and channel integrations:

- `tooluniverse`
- `setup-tooluniverse`
- `tooluniverse-clinical-trial-design`
- `tooluniverse-sequence-retrieval`
- `sora`
- `discord-access`
- `discord-configure`
- `imessage-access`
- `imessage-configure`
- `telegram-access`
- `telegram-configure`

## Agent Suite

Qwen currently has 20 authored agents:

- Architecture and implementation: `system-architect`, `backend-architect`, `frontend-architect`, `api-specialist`, `database-specialist`, `devops-engineer`.
- Language and stack specialists: `python-expert`, `javascript-expert`, `performance-engineer`, `security-engineer`, `testing-specialist`.
- Knowledge and operations: `documentation`, `technical-writer`, `task-management`, `context-management`.
- Ecosystem evolution: `ecosystem-learning`, `ecosystem-synergy`, `integrated-evolution`, `self-evolution`.
- Domain-specific: `ice-tracker-assistant`.

Before adapting agents from other dotfolders, normalize these Qwen `agent.md` files first so each has consistent name, description, tools, model guidance, and handoff conditions.

## First Integration Candidates

Start with reference material that directly improves Qwen as a capability hub:

- Claude plugin-dev skills for plugin, hook, command, MCP, and agent authoring.
- Cursor creation flows for `create-skill`, `create-subagent`, `create-hook`, and `migrate-to-skills`.
- Gemini `skill-porter`, `context7`, `code-review`, `agent-creator`, and database MCP skills.
- Qwen's own Superpowers workflow skills as the active planning/debugging/review backbone.

## Verification Checks

Before any future integration commit:

- Confirm active settings parse as JSON.
- Confirm `.gitignore` excludes projects, chat logs, exports, todos, reports, and backup files.
- Run a duplicate skill report and update this registry if canonical paths change.
- Scan candidate imports for secrets, absolute machine-specific paths, destructive shell commands, and hook auto-execution.
- Document every promoted capability in this registry or the staged plan.

# Qwen Invoke Index by Type

Date: 2026-04-16

Purpose: provide the quick roster by artifact type so Qwen can discover what to run without re-deriving the ecosystem map.

## Use This When

- You need a type-based inventory instead of a goal-based trigger.
- You are adding a new skill, agent, script, command, hook, or workflow.
- You need to decide whether something is canonical authoring, Qwen adaptation, runtime behavior, or archive material.

## Canonical Rule

For active Qwen runtime behavior, author first in `~/.qwen/superpowers/skills/`, then keep Qwen runtime surfaces aligned (`~/.qwen/skills/`, `~/.qwen/integrations/supremepower/` as needed).

## Skills

Primary path: `~/.qwen/skills/`

Current count: 59 skill directories.

Major groups:
- Superpowers adapters: `superpowers-*` plus `systematic-debugging`
- ToolUniverse/science: `tooluniverse*`, `devtu-*`, `setup-tooluniverse`
- Plugin/MCP development: `skill-*`, `plugin-*`, `mcp-integration`, `build-mcp-*`, `hook-development`, `command-development`, `agent-development`
- Messaging access/config: `discord-*`, `imessage-*`, `telegram-*`
- Ecosystem and writing: `workspace-ecosystem-audit`, `managing-ecosystem-cleanup`, `narrative-blueprints`, `writing-rules`
- Creative/media: `sora`, `frontend-design`, `playground`

Canonical superpowers path (Qwen policy): `~/.qwen/superpowers/skills/`

Qwen runtime skill surface: `~/.qwen/skills/`

## Agents

Primary path: `~/.qwen/agents/`

Current count: 20 agent directories.

Core groups:
- Engineering specialists: backend, frontend, database, devops, security, performance, testing, API, system architecture
- Language specialists: Python, JavaScript
- Ecosystem operators: context management, ecosystem learning, ecosystem synergy, integrated evolution, self evolution
- Project/support roles: documentation, task management, ICE Tracker assistant, technical writer

## Scripts

Primary path: `~/.qwen/scripts/`

Executable scripts:
- `qwen-sp` — Qwen Superpowers orchestrator (`bootstrap`, `skills`, `agents`, `use`, `map`, `status`)
- `qwen-backup` — backup, verify, list, and restore Qwen ecosystem snapshots
- `update.sh` — ecosystem update/status script
- `enhanced_init.sh` — initialization helper

## Commands

Primary path: `~/.qwen/commands/`

Command docs:
- `brainstorm.md`
- `write-plan.md`
- `execute-plan.md`

## Hooks

Policy doc: `~/.qwen/docs/HOOKS_MODEL_AND_IMPLEMENTATION.md`

Runtime/staging paths:
- `~/.qwen/hookify/`
- `~/.qwen/new-hooks-system/`

Bootstrap/prompt hook examples:
- `~/.qwen/superpowers/bin/superpowers-codex` and `~/.qwen/superpowers/docs/` (Codex bundle install/bootstrap)
- `~/.claude/plugins/cache/claude-plugins-official/*/hooks/`

## External Workflow Formats

If you use Qodo, agent/workflow TOMLs live under `~/.qodo/agents/` and `~/.qodo/workflows/` (not mirrored in `~/.qwen`).

Cursor rules: `~/.qwen/rules/` (concept source only unless promoted into Qwen-native docs or Hookify policy)

## Add-New-Capability Checklist

1. Put the artifact in the correct type directory.
2. Add a "use when" trigger in `Master_Recall_Index.md` or `Use_Cases_And_Triggers.md`.
3. If it changes source-of-truth boundaries, update `docs/SOURCE_OF_TRUTH_AND_LAYERS.md`.
4. If it changes hook behavior, update `docs/HOOKS_MODEL_AND_IMPLEMENTATION.md`.
5. Record substantive changes in `docs/CHANGELOG.md` and `docs/EVOLUTION_AND_ITEM_HISTORY.md`.

## Imported Standards (Qwen-native)

- Path/usage/workflow and multi-ability map: `~/.qwen/docs/LINK_PATHS_USAGE_WORKFLOWS_AND_MULTI_ABILITY.md`
- Flexible-vs-strict language standard: `~/.qwen/docs/LANGUAGE_AND_REFERENCE_STANDARD.md`

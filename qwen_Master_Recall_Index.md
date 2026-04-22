# Qwen Master Recall Index

**Purpose:** One place to recall where capability documentation lives and which Qwen-native surface to invoke first (skill, agent, script, or integration docs).

## Quick Start

1. Read `~/.qwen/QWEN_SYSTEM_DEFINITION.md` for full-system context.
2. Match user intent in `~/.qwen/Use_Cases_And_Triggers.md`.
3. Pull full roster from `~/.qwen/QWEN_INVOKE_INDEX_BY_TYPE.md`.
4. Use `~/.qwen/docs/SOURCE_OF_TRUTH_AND_LAYERS.md` before editing any non-trivial path.

## Core Docs (Current)

| Doc | Path | Use when |
|-----|------|----------|
| System definition | `~/.qwen/QWEN_SYSTEM_DEFINITION.md` | Full behavior model and terminology. |
| Logic flows | `~/.qwen/Logic_Flows.md` | Flow routing and process sequencing. |
| Use cases and triggers | `~/.qwen/Use_Cases_And_Triggers.md` | Match user goals to execution flows. |
| Working principles | `~/.qwen/Working_Principles.md` | Guardrails and behavior standards. |
| Invoke index by type | `~/.qwen/QWEN_INVOKE_INDEX_BY_TYPE.md` | Full roster by skills/agents/scripts/hooks. |
| Source-of-truth model | `~/.qwen/docs/SOURCE_OF_TRUTH_AND_LAYERS.md` | Canonical vs adaptation vs runtime vs archive. |
| Edit boundary quickcheck | `~/.qwen/docs/EDIT_BOUNDARY_QUICKCHECK.md` | Fast path-level edit decisions. |
| Hooks model and implementation | `~/.qwen/docs/HOOKS_MODEL_AND_IMPLEMENTATION.md` | Bootstrap/runtime hook boundaries. |
| Learning/explanatory styles pointer | `~/.qwen/Learning_Explanatory_Styles.md` | Active style-path references. |
| Installation host crosswalk | `~/.qwen/docs/INSTALLATION_HOST_CROSSWALK.md` | Choose install docs by host (Qwen/Codex/OpenCode/Gemini). |

## Primary Runtime Surfaces

| Surface | Path | Notes |
|--------|------|-------|
| Supremepower standard baseline | `~/.supremepower/skills/` | Typical baseline standard surface. |
| Superpowers skills (Qwen adapted runtime) | `~/.qwen/superpowers/skills/` | Qwen-local adapted/operational layer. |
| General skills | `~/.qwen/skills/` | Includes Qwen-native and imported skills. |
| Agents | `~/.qwen/agents/` | Agent/persona execution layer. |
| Orchestrator | `~/.qwen/scripts/qwen-sp` | Qwen superpowers CLI (`bootstrap`, `skills`, `agents`, `use`, `map`, `status`). |
| Supremepower integration layer | `~/.qwen/integrations/supremepower/` | Cross-platform adapter docs/commands/hooks. |

## Known Historical/Non-Canonical References

Treat these as historical artifacts if found in older docs:

- `~/.qwen/scripts/inventory-analyzer.sh` (not present)
- `~/.qwen/docs/Ecosystem_Map.md` (not present)
- `~/.qwen/docs/Best_Practices.md` (not present)
- `~/.qwen/docs/Troubleshooting.md` (not present)
- `~/.qwen/learning-output-style/latest/` and `~/.qwen/explanatory-output-style/latest/` (use active hash paths referenced by `Learning_Explanatory_Styles.md`)

When stale references appear, prefer current documents in this index and log decisions in `~/.qwen/docs/learned-context.md`.

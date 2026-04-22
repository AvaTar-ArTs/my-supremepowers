# Qwen Runtime Flow Map

## Purpose
This document captures the active runtime flow for Qwen + Supremepower assets on this machine, including where skills are loaded from and how commands route to skill files.

## Active Runtime Roots
- `~/.qwen/scripts/qwen-sp`
- `~/.qwen/integrations/supremepower/`
- `~/.qwen/skills/`
- `~/.qwen/superpowers/skills/`
- `~/.qwen/agents/`

## External Runtime Root (Gemini Extension)
- `~/.gemini/extensions/supremepower/skills/`

## Command Resolution Flow
1. User invokes `qwen-sp <command>`.
2. `qwen-sp` resolves base paths:
   - `QWEN_DIR=~/.qwen`
   - `SUPERPOWERS_SKILLS=~/.qwen/superpowers/skills`
   - `SKILLS_DIR=~/.qwen/skills`
   - `AGENTS_DIR=~/.qwen/agents`
   - `INTEGRATION_DIR=~/.qwen/integrations/supremepower`
3. `qwen-sp use <name>` loads in this order:
   - `~/.qwen/superpowers/skills/<name>/SKILL.md`
   - `~/.qwen/skills/<name>/SKILL.md`
   - `~/.qwen/agents/<name>/agent.md`
4. Integration command adapters in `integrations/supremepower/commands/*.toml` reference file contexts.

## Skill Adapter Flow (TOML)
Example: `integrations/supremepower/commands/skills/systematic-debugging.toml`
- description + prompt scaffold
- context path: `skills/systematic-debugging/SKILL.md`

This means the integration command system expects a skill file at the integration skill path tree to remain present.

## Flow Classes
- Activation flow: command/trigger to SKILL.md
- Enforcement flow: workflow chaining (brainstorm -> plan -> execute -> verify)
- Content flow: mirror/adaptation from baseline sources into Qwen runtime trees

## Stability Contract
To keep runtime intact:
- Keep at least one complete, canonical copy in each active runtime tree:
  - `~/.qwen/integrations/supremepower/skills/*`
  - `~/.qwen/skills/*`
  - `~/.qwen/superpowers/skills/*`
- Do not remove command adapter `.toml` files unless target skill paths are intentionally migrated and updated.

# Dedupe Guardrails For Runtime Flows

## Goal
Allow duplicate cleanup without breaking activation flows.

## Protected Trees (Do Not Remove Canonical Files)
- `~/.qwen/integrations/supremepower/`
- `~/.qwen/skills/`
- `~/.qwen/superpowers/skills/`
- `~/.qwen/scripts/`
- `~/.qwen/commands/`
- `~/.gemini/extensions/supremepower/skills/` (external active flow)

## Archive-First Policy
- Never hard-delete first.
- Move candidates to dated archive folder with manifest.
- Validate activation commands after every batch.

## Required Post-Change Checks
- `qwen-sp status`
- `qwen-sp use systematic-debugging` (loads SKILL.md)
- Verify directory listing for:
  - `~/.gemini/extensions/supremepower/skills/systematic-debugging`
  - `~/.qwen/integrations/supremepower/skills/systematic-debugging`

## Candidate Tiering
- Tier 1 (safe): duplicate docs in `superpowers/4.2.0/` when identical copies exist in protected tree.
- Tier 2 (review): duplicate tests/prompts with cross-references.
- Tier 3 (blocked): anything under protected trees if it is the active referenced copy.

## Rollback Contract
Every archive action must include:
- source path
- archive path
- sha256
- timestamp

Restore by replaying manifest in reverse.

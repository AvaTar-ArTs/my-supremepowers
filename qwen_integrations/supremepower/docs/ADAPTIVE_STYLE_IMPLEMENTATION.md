# Adaptive Style Implementation

Date: 2026-04-16  
Scope: `~/.qwen/integrations/supremepower`

This profile keeps the strict superpowers discipline while changing execution style to a logic-first loop:

1. **Analyze** (what is true now)
2. **Learn** (what should become reusable memory)
3. **Adapt** (what must change for this host/platform)
4. **Implement** (minimal, testable change set)

## Why this exists

The core superpowers flow is strong, but complex ecosystem work often needs an explicit translation layer between architecture analysis and code/document changes. This profile adds that layer without weakening mandatory skills.

## Operational sequence

### 1) Analyze
- Use `skills/ecosystem-clarity/SKILL.md` to map sources, ownership, and active runtime paths.
- Identify drift by type:
  - command-to-skill mismatch
  - bootstrap/runtime mismatch
  - doc-to-implementation mismatch
  - duplicate authority claims

### 2) Learn
- Promote durable findings into:
  - `~/.qwen/docs/learned-context.md` (terminology/decisions/patterns)
  - `~/.qwen/docs/CHANGELOG.md` (what changed)
  - `~/.qwen/docs/EVOLUTION_AND_ITEM_HISTORY.md` (session-level evolution)

### 3) Adapt
- Keep canonical behavior intact.
- Adapt only host-specific execution surfaces:
  - `commands/*.toml`
  - `commands/skills/*.toml`
  - bootstrap/session context docs
- Avoid changing policy meaning while adapting format or invocation style.

### 4) Implement
- Apply smallest viable patch.
- Prefer additive compatibility over destructive edits.
- Verify command context paths resolve to real files.

## Function checks (minimum)

- Every skill in active use has a matching command entry or explicit invocation path.
- Commands reference existing `skills/<name>/SKILL.md` files.
- Bootstrap text reflects real capabilities and real command entry points.
- New behavior is documented in changelog + learned context.

## Current implementation targets

For this pass, the immediate functional gap is command coverage for Qwen-local superskills:
- `ecosystem-clarity`
- `workflow-bootstrap`

Both now receive first-class command adapters under `commands/skills/`.

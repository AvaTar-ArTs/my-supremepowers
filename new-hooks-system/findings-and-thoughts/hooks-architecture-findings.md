# Hooks Architecture Findings and Thoughts

## Core distinction

- **Bootstrap hooks**: prompt/session orchestration (instruction injection and skill loading)
- **Runtime hooks**: event-time interception (before/after tool execution, audit, policy gating)

## What we confirmed from reflection

1. Claude plugin output-style packages are SessionStart context injectors.
2. `hooks.json` + shell handler scripts emit JSON `additionalContext`.
3. This is powerful for policy shaping but not equivalent to runtime middleware.
4. Runtime behavior enforcement needs explicit pre/post event handlers.

## Practical synthesis

Keep both layers:

- Layer A (already strong): bootstrap governance and skill awareness
- Layer B (new in this workspace): runtime handlers for:
  - command gating
  - tool output audit
  - policy checks

## Canonical ownership implication

- Author shared behavior upstream in canonical skill source.
- Treat plugin caches and archives as adapter/evidence layers, not authoring roots.

## Immediate operator pattern

1. Session starts -> bootstrap context loaded.
2. Runtime event fires -> pre-tool hook decides allow/block.
3. Tool runs -> post-tool hook writes audit.
4. Periodic review -> compare audits against policy and update canonical rules.

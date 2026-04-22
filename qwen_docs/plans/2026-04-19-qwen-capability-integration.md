# Qwen Capability Integration Plan

Date: 2026-04-19

Goal: use `/Users/steven/.qwen` as the first clean staging area for skills, agents, subagent logic, commands, hooks, and MCP patterns gathered from the wider dotfolder ecosystem.

## Phase 1: Registry Baseline

Status: completed

- Add a capability registry that separates active Qwen sources from reference snapshots.
- Mark transcript logs, project histories, exports, and generated reports as non-import sources.
- Record duplicate skill families and canonical direction.
- Keep all hook activation behind explicit review.

## Phase 2: Duplicate Control

Status: pending

- Produce a duplicate skill report with path, name, description, and source family.
- Pick one active Qwen-facing copy for every duplicate family.
- Replace stale duplicate folders with either documentation pointers or archived reference copies.
- Keep upstream snapshots until active copies have been verified.

## Phase 3: Agent Normalization

Status: pending

- Review every file under `agents/*/agent.md`.
- Normalize frontmatter and structure for name, description, intended tasks, tool assumptions, and handoff triggers.
- Compare Qwen agents with Cursor and Gemini authored agents.
- Adapt only authored agent definitions, not transcript folders.

## Phase 4: Skill Porting

Status: pending

- Start with builder skills: agent authoring, command authoring, hook authoring, plugin structure, plugin settings, and MCP integration.
- Port Cursor creation patterns where they improve Qwen's authoring workflow.
- Port Gemini `skill-porter` and `agent-creator` patterns after checking for runtime assumptions.
- Keep Superpowers-derived Qwen skills as the active execution backbone.

## Phase 5: Hook And Command Review

Status: pending

- Inventory Qwen hooks and command definitions.
- Classify hooks as safe, needs review, or disabled.
- Do not import hooks from Claude, Cursor, Gemini, or OpenCode without reading the commands they execute.
- Expand Qwen commands only after the related skill or agent has a stable canonical copy.

## Phase 6: Verification Scripts

Status: pending

- Add lightweight checks for JSON validity, duplicate skills, ignored runtime paths, and secret-adjacent file permissions.
- Prefer read-only reporting scripts before any automatic cleanup.
- Use script output to update the registry rather than relying on memory.

## Phase 7: Cross-Ecosystem Promotion

Status: pending

- After Qwen is normalized, select only high-value capabilities to adapt into Codex, Claude, Cursor, or Gemini.
- Promote capability descriptions, not logs or session histories.
- Keep ecosystem-specific syntax separate so one tool's assumptions do not leak into another runtime.

## Guardrails

- No auto-enabled hooks.
- No transcript imports.
- No secret-bearing files in registries or examples.
- No deletion of upstream snapshots until the active copy is verified and the removal is intentional.
- No broad import from the full home dotfolder list without a narrow target and review pass.

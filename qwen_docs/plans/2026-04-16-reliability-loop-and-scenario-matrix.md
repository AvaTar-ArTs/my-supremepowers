# Adaptive Reliability Mesh

Date: 2026-04-16
Scope: Evolving operations across `~/.qwen`, `~/iterm2`, `~/.cursor`, and `~/.gemini`

## Why This Version

This is intentionally broader and less rigid than a strict gate checklist.
The goal is to preserve safety while allowing exploration, experimentation, and rapid adaptation.

Use `/Users/steven/docs-04-16-14:28.csv` as a discovery accelerator, not as a policy authority.

## Core Principle

Treat reliability as a **mesh**, not a single control point:

- stable anchors (safety and ownership),
- adaptive anchors (live learning and behavior),
- experimental lanes (where fast change is allowed).

## Operating Modes (pick per task)

### 1) Explore Mode

Use when learning territory or mapping drift.

- Output: inventory, pattern clusters, uncertainty map.
- Rule: no behavior-changing edits.
- Good for: unknown unknowns, broad scans, fuzzy search.

### 2) Stabilize Mode

Use when fixing contradictions or regressions.

- Output: minimal patch set with explicit rationale.
- Rule: prioritize consistency and reversibility.
- Good for: broken references, policy conflicts, runtime mismatch.

### 3) Experiment Mode

Use when testing new approaches.

- Output: sandboxed trial artifacts and decision notes.
- Rule: experiments must be clearly isolated and reversible.
- Good for: new hook patterns, workflow variations, alternative architectures.

### 4) Migrate Mode

Use when promoting known-good changes across layers.

- Output: propagation plan and verification evidence.
- Rule: upstream intent preserved; adapters updated deliberately.
- Good for: canonical-to-adapter sync, cross-host rollout.

## Intent Freeze (lightweight)

Before edits, capture a short brief:

1. What outcome do we want right now?
2. Is this clarity, behavior, or both?
3. Which mode are we in (Explore/Stabilize/Experiment/Migrate)?
4. What should not change?
5. What would count as success?

## Flexible Two-Pass Pattern

Still recommended, but adaptive:

- **Pass A: Discover**
  - map current state, conflicts, and candidate files.
- **Pass B: Decide**
  - choose actions by mode and risk tolerance.

If urgency is high, use micro-passes (discover one area -> decide one area -> verify).

## Layer Awareness (without over-locking)

Keep this mental separation:

- canonical authoring,
- adaptation layers,
- runtime hooks/plugins,
- archives/evidence.

You may touch multiple layers in one session **only when explicit sequencing is documented**.

## Skill Use Contract

### `/using-superpowers`

- Invoke when relevant.
- Prefer sequence:
  - `brainstorming -> writing-plans -> executing-plans/subagent-driven-development -> verification-before-completion`
- Can be compressed for low-risk tasks when rationale is noted.

### `/orchestrating-swarms`

Use when parallel sensemaking adds value:

- Explorer: maps terrain.
- Policy Mapper: maps constraints.
- Integrator: drafts coherent action set.

Leader decides merge strategy and final acceptance criteria.

## Scenario Matrix (adaptive response)

| Scenario | Trigger | Detection | Preferred Mode | First Response |
|---|---|---|---|---|
| Clarity rewrite causes drift | broad wording cleanup | downstream terminology mismatch | Stabilize | relabel as clarity-only or promote explicitly to policy |
| Bootstrap mistaken for runtime enforcement | docs imply protection that isn't enforced | no runtime handler proof | Stabilize | add clear bootstrap/runtime boundary language |
| Adapter changes bypass upstream intent | repeated local fixes | recurring divergence | Migrate | promote intent to canonical then re-sync adapters |
| Historical plan used as live policy | old plan reused repeatedly | completed tasks resurfacing | Stabilize | mark historical status and link active guidance |
| Evidence file treated as policy | logs/transcripts copied as rules | policy text sourced from evidence docs | Explore -> Stabilize | separate evidence from normative docs |
| Security regression via convenience | quick config edits | key/token-like patterns in tracked files | Stabilize | remove secret values, enforce env indirection |
| Swarm consensus on stale premise | multiple consistent suggestions | weak citation to current anchors | Explore | require fresh anchor check before edits |
| New candidate appears in cache | cache content differs from known upstream | stronger/newer behavior detected | Explore -> Migrate | validate candidate, promote deliberately if accepted |
| Backup exists, restore unproven | backup confidence assumed | no restore artifact | Stabilize | run lightweight restore simulation |
| Terminology drift breaks routing | terms diverge across docs | wrong skill/path invoked | Stabilize | normalize terms in live indexes/context docs |

## Decision Evidence (right-sized)

For meaningful edits, include:

- `mode`
- `reason`
- `layer impact`
- `evidence` (brief)
- `verification`

Use short-form for low-risk clarity updates; full-form for policy/runtime changes.

## Practical CSV Discovery Flow

With `/Users/steven/docs-04-16-14:28.csv`:

1. lane filter (`hooks/bootstrap`, `skills/superpowers`, `agents/policies`)
2. shortlist candidates
3. inspect top files by confidence and relevance
4. choose mode and action plan
5. verify and log only substantive outcomes

## Completion Signal

A cycle is done when:

- chosen mode objectives are met,
- changes remain reversible,
- contradictions are reduced (or clearly parked),
- and key decisions are captured in persistent memory docs.

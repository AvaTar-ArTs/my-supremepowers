# Hooks Model and Implementation

Date: 2026-04-16

## Purpose

Define what "hooks" mean across this ecosystem and how to implement them safely in Qwen without mixing conceptual bootstrap hooks with runtime enforcement hooks.

## Two Hook Layers

### 1) Bootstrap Hook Layer (instructional/orchestration)

This is the pattern used by `superpowers-codex`:

- `templates/AGENTS.md` injects a startup instruction.
- `superpowers-codex bootstrap` runs at session start.
- Bootstrap prints rules, discovers skills, and loads `superpowers:using-superpowers`.

This is a prompt/ops-level hook. It is not runtime interception middleware.

### 2) Runtime Hook Layer (event/policy)

This is the pattern used by hook systems such as Hookify or plugin `hooks.json` + handlers:

- Trigger on events like session start, pre-tool, post-tool, stop.
- Evaluate policy against actual command/tool usage.
- Optionally block, warn, log, or annotate.

This is true event middleware behavior.

## Operational Definitions

- **Bootstrap hook:** Startup governance and context loading.
- **Runtime hook:** Per-event policy enforcement and audit.
- **Canonical hook policy location:** `~/.qwen/docs/HOOKS_MODEL_AND_IMPLEMENTATION.md`

## Why this distinction matters

- Avoids false confidence ("we have hooks") when only startup orchestration exists.
- Prevents policy drift by giving one place to define what each hook class is expected to do.
- Enables layered evolution: keep bootstrap simplicity while adding runtime safety where needed.

## Current state in this ecosystem

- Bootstrap behavior exists in `superpowers-codex` patterns and related startup context docs.
- Runtime-style hooks are active in Qwen via `~/.qwen/hookify/2cd88e7947b7/` (`hooks/hooks.json` and Python handlers).
- Qwen governance should explicitly state both layers and when each is invoked.

## Recommended Hybrid Design

### Keep

- Existing bootstrap flow for skill-first discipline and deterministic startup context.

### Add

- Runtime hooks for command/tool gating and auditable safety.

## First 3 runtime hooks to implement

1. **Pre-command secret guard**
   - Block commands that risk exposing secrets or copying credential files into tracked paths.
2. **Post-command audit annotator**
   - Append concise structured event logs (command category, target path class, outcome).
3. **Stop-time compliance summary**
   - Emit a short end-of-session report: risky actions, bypasses, and unresolved policy warnings.

## Runtime implementation status

- `hookify` runtime middleware is implemented and wired.
- The three hooks above are the recommended policy baseline to standardize across active rules.
- Treat these as policy targets unless and until corresponding handlers/rules are explicitly verified in the active hookify set.

## Minimal File Map

- `~/.qwen/docs/HOOKS_MODEL_AND_IMPLEMENTATION.md` (this file, policy)
- `~/.qwen/get-hooked.txt` (investigation transcript / evidence)
- `~/.qwen/what-hooks-mean.txt` (short operator brief)
- Runtime engine path (active): `~/.qwen/hookify/2cd88e7947b7/...`

## Decision Rule

When someone says "hooks" in this ecosystem, ask first:

1. Do they mean startup/bootstrap behavior?
2. Or runtime interception and policy enforcement?

Then route to the right layer and artifacts.

## superpowers-codex Hooks Concept and Flow (grounded map)

This section maps "hooks" behavior specifically to:

- `~/.qwen/superpowers/bin/superpowers-codex`
- `~/.qwen/superpowers/docs/INSTALL.md`
- `~/.qwen/superpowers/docs/superpowers-bootstrap.md`
- `~/.qwen/superpowers/lib/skills-core.js`
- `~/.qwen/superpowers/docs/README-codex-bundle.md`
- `~/.qwen/superpowers/templates/AGENTS.md`

### What "hook" means here

In `superpowers-codex`, hook behavior is **bootstrap-orchestration**, not runtime middleware:

- `templates/AGENTS.md` forces a session-start command:
  - `~/.codex/superpowers/bin/superpowers-codex bootstrap`
- `bin/superpowers-codex` `runBootstrap()`:
  1. prints bootstrap header and optional update notice
  2. reads and prints `docs/superpowers-bootstrap.md`
  3. runs skill discovery (`runFindSkills()`)
  4. auto-loads `superpowers:using-superpowers` (`runUseSkill(...)`)

### Supporting mechanics

- `lib/skills-core.js` provides:
  - frontmatter parse (`name`, `description`)
  - frontmatter strip before output
  - skill discovery by directory walk
- Resolution model in `bin/superpowers-codex`:
  - personal skills: `~/.codex/skills/`
  - superpowers skills: `~/.codex/superpowers/skills/`
  - personal skill path wins when names collide

### Conceptual flow

`AGENTS bootstrap instruction` -> `bootstrap command` -> `print bootstrap policy` -> `discover/list skills` -> `auto-load using-superpowers` -> `operator executes task with mandatory skill-first discipline`

### What it does not do

- No pre-tool or post-tool event interception
- No command-policy gate on each shell/tool invocation
- No built-in persistent audit stream

### Operational interpretation

- Treat `superpowers-codex` as **Layer 1 bootstrap hook**.
- Use Hookify/plugin hook handlers for **Layer 2 runtime hooks** when enforcement/audit is required.

### Trigger points (practical)

- **Session start trigger**
  - Source: `templates/AGENTS.md`
  - Action: forces `superpowers-codex bootstrap`
  - Effect: injects governance + skill discovery + auto-load baseline behavior
- **Discovery trigger**
  - Source: `superpowers-codex find-skills`
  - Action: enumerates personal + superpowers skills
  - Effect: operator/agent can pick a deterministic skill path before task execution
- **Per-task trigger**
  - Source: `superpowers-codex use-skill <name>`
  - Action: resolves skill precedence and prints runnable skill body
  - Effect: execution shifts from freeform behavior to skill-governed behavior

### Practical usage patterns

1. **Bootstrap-only governance**
   - Use when you need lightweight, deterministic startup discipline with minimal runtime overhead.
2. **Bootstrap + runtime enforcement**
   - Use when you need policy controls (secret guard, command gating, audit trails) beyond startup.
3. **Host-adapter mode**
   - Keep `superpowers-codex` host-specific (tool mapping + install path assumptions), while maintaining canonical policy in upstream superpowers docs.

### Hybrid file map (recommended)

- **Bootstrap layer**
  - `~/.qwen/superpowers/templates/AGENTS.md`
  - `~/.qwen/superpowers/bin/superpowers-codex`
  - `~/.qwen/superpowers/docs/superpowers-bootstrap.md`
- **Resolution/mechanics layer**
  - `~/.qwen/superpowers/lib/skills-core.js`
- **Runtime enforcement layer**
  - `~/.qwen/hookify/.../hooks/hooks.json`
  - `~/.qwen/hookify/.../hooks-handlers/*`
  - optional plugin hook handlers under host plugin runtimes

## Hook Capability Matrix (bootstrap vs runtime)

| Capability | Bootstrap Layer | Runtime Layer | Status |
|---|---|---|---|
| Session capability preload | `qwen-bootstrap.md` / `session-start-context.md` | N/A | Implemented |
| Skill-first discipline reminder | `qwen-bootstrap.md` | N/A | Implemented |
| Natural-language skill trigger guidance | `qwen-skill-triggers.md` | Optional runtime checks | Implemented in bootstrap docs; runtime optional |
| Tool mapping adaptation guidance | `qwen-tool-mapping.md` | N/A | Implemented |
| Pre-command secret guard | N/A | Hookify `PreToolUse`/pre-command handler | Gap target |
| Per-command policy gate | N/A | Hookify policy matcher | Gap target |
| Post-command audit annotation | N/A | Hookify `PostToolUse` handler | Gap target |
| Stop-time compliance summary | N/A | Hookify `Stop` handler | Gap target |
| Cross-platform wrapper safety (Windows) | bootstrap docs reference | `.cmd` wrapper + `.sh` runtime script (`polyglot-hooks.md`) | Pattern defined; apply where needed |
| Drift check between canonical and adapters | N/A | stop/post hook or scheduled script | Gap target |

### Matrix interpretation

- **Implemented** = currently documented and actively usable in bootstrap artifacts.
- **Gap target** = should be implemented in runtime hooks, not in SessionStart style/bootstrap files.
- **Pattern defined** = implementation recipe exists (for example polyglot wrappers), but deployment is host/path specific.

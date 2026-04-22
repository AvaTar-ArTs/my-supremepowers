# Hook Bootstrap Scenarios and Linking Plan

Date: 2026-04-16

## Goal

Define complex, realistic scenarios and map each to:

1. **Bootstrap hook behavior** (session-start context and skill discipline),
2. **Runtime hook behavior** (event-level enforcement/audit),
3. **Linking/bootstrapping implementation** using active Qwen paths.

## Source Artifacts (current)

- `~/.qwen/explanatory-output-style/2cd88e7947b7/hooks/hooks.json`
- `~/.qwen/explanatory-output-style/2cd88e7947b7/README.md`
- `~/.qwen/learning-output-style/2cd88e7947b7/hooks/hooks.json`
- `~/.qwen/learning-output-style/2cd88e7947b7/hooks-handlers/session-start.sh`
- `~/.qwen/integrations/supremepower/qwen-bootstrap.md`
- `~/.qwen/integrations/supremepower/session-start-context.md`
- `~/.qwen/integrations/supremepower/qwen-skill-triggers.md`
- `~/.qwen/integrations/supremepower/qwen-tool-mapping.md`
- `~/.qwen/integrations/supremepower/docs/windows/polyglot-hooks.md`

---

## Scenario 1: High-Risk Refactor Across Multiple Repos

### Situation

User requests a multi-repo refactor with CI failures and possible secret exposure risk.

### Bootstrap Layer (SessionStart)

- Inject `qwen-bootstrap.md` or `session-start-context.md` style capability map.
- Ensure mandatory chain is surfaced:
  - `brainstorming` -> `writing-plans` -> `test-driven-development` -> `verification-before-completion`.

### Runtime Layer (Event Hooks)

- Pre-command guard: block shell commands that copy `.env`, `oauth_creds.json`, `google_accounts.json` into tracked paths.
- Post-command audit: record command class + target path class + outcome.
- Stop-time summary: emit unresolved risks and verification gaps.

### Success Criteria

- No secret-bearing paths touched in tracked trees.
- Skill-chain compliance recorded.
- Verification evidence present before completion claims.

---

## Scenario 2: Emergency Debug Session Under Time Pressure

### Situation

Production-like breakage with pressure to "just patch quickly."

### Bootstrap Layer

- Force visibility of `systematic-debugging` trigger phrases from `qwen-skill-triggers.md`.
- Remind "no guess-fixes" and root-cause first.

### Runtime Layer

- Pre-tool policy: warn or block edits unless a failing symptom and reproduction note exist.
- Post-tool policy: require changed file list + validation command before next major change.

### Success Criteria

- Debug flow follows 4 phases (reproduce, isolate, fix, verify).
- At least one validation command executed after each fix batch.

---

## Scenario 3: Cross-Platform Hook Deployment (Windows + Unix)

### Situation

Need hooks that work for both Windows CMD and Unix shells.

### Bootstrap Layer

- Keep startup policy in session-start context docs.
- Do not assume runtime shell parity in bootstrap logic.

### Runtime Layer

- Use wrapper strategy from `docs/windows/polyglot-hooks.md`:
  - `.cmd` polyglot wrapper as entrypoint,
  - `.sh` script for actual hook behavior,
  - quoted `${CLAUDE_PLUGIN_ROOT}` paths.

### Success Criteria

- Same hook intent executes on Windows and Unix hosts.
- No direct `.sh` invocation from CMD paths.

---

## Scenario 4: Skill Drift Across Canonical and Adapter Trees

### Situation

Behavior diverges between canonical superpowers and Qwen adapters.

### Bootstrap Layer

- Session-start instructions enforce skill-first lookup and canonical awareness.

### Runtime Layer

- Post-session drift check (non-blocking first):
  - compare hashes for critical skills between canonical and adapter targets,
  - emit drift report.

### Success Criteria

- Drift is detected quickly and routed to canonical-first fix workflow.
- Adapter-only edits documented as host-specific exceptions.

---

## Linking and Bootstrapping Implementation

## A) Bootstrap Sources

Use one primary source and one fallback:

- Primary: `~/.qwen/integrations/supremepower/session-start-context.md`
- Fallback/concise: `~/.qwen/integrations/supremepower/qwen-bootstrap.md`

Rationale: `session-start-context.md` includes stricter operational instructions and richer capability map.

## B) Style Injection Layer

- Keep `explanatory-output-style` and `learning-output-style` as optional additive injectors.
- Ensure their `hooks.json` are SessionStart-only behavior injectors, not policy enforcers.

## C) Runtime Enforcement Layer

- Implement policy hooks under Hookify runtime paths, not style plugin paths.
- Recommended first three runtime hooks:
  1. pre-command secret guard,
  2. post-command audit annotator,
  3. stop-time compliance summary.

## D) Cross-Platform Hook Entry

- For Windows-capable distributions, use polyglot wrapper pattern:
  - `hooks/*.cmd` wrapper invokes bash safely,
  - shared `.sh` logic remains source implementation.

## E) Trigger + Mapping Linkage

- Trigger definitions: `qwen-skill-triggers.md`
- Tool adaptation references: `qwen-tool-mapping.md`
- Startup behavior references both files to ensure consistent route selection.

---

## Bootstrap/Runtime Boundary Rule

- If the requirement is "what should be loaded at session start," implement in bootstrap context files.
- If the requirement is "what should be enforced on each event/command," implement in runtime hook handlers.
- Never treat style SessionStart plugins as substitutes for runtime policy enforcement.

---

## Immediate Non-Destructive Next Steps

1. Confirm primary bootstrap source (`session-start-context.md`) and mark fallback in docs.
2. Add references to this scenario plan from hook governance docs.
3. Add a runtime hook capability matrix (implemented vs gap) before adding new handlers.
4. Run skill-trigger test prompts in `integrations/supremepower/tests/` after any hook-policy changes.


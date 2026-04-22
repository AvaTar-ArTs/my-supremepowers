# Edit Boundary Quickcheck

Date: 2026-04-16

Use this one-screen check before editing anything in `~/.qwen`.

## Legend

- `ALLOWED` = safe default editing zone
- `CAUTION` = edit only for host-specific/runtime reasons
- `NO-DIRECT-EDIT` = do not author here; patch upstream source and sync/regenerate

## Path Matrix (requested surfaces)

| Path | Status | Rule |
|---|---|---|
| `~/.qwen/agents` | `CAUTION` | Persona/runtime layer. Edit for Qwen-host behavior only; keep aligned with canonical skill policy. |
| `~/.qwen/commit-commands` | `CAUTION` | Command adapter layer; edit if command behavior is Qwen-specific. |
| `~/.qwen/docs/evolution-changelogs` | `CAUTION` | Historical snapshot docs; append context carefully, do not rewrite history as live truth. |
| `~/.qwen/explanatory-output-style` | `CAUTION` | Runtime style injection layer; prefer editing the active hash-versioned path only. |
| `~/.qwen/integrations` | `CAUTION` | Integration/distribution layer; edit when bridging hosts/platforms. |
| `~/.qwen/learning-output-style` | `CAUTION` | Runtime style layer; keep edits minimal and intentional; use active hash-versioned path. |
| `~/.qwen/new-hooks-system` | `CAUTION` | Runtime hook-development layer; validate policy impact before changes. |
| `~/.qwen/plugins` | `CAUTION` | Plugin runtime/config layer; avoid broad edits without host test coverage. |
| `~/.qwen/security-guidance` | `ALLOWED` | Governance/policy docs owned in Qwen; safe to evolve directly. |
| `~/.qwen/skills` | `CAUTION` | Mixed/adapted skill surface; generic shared behavior should be authored upstream first. |
| `~/.qwen/superpowers` | `CAUTION` | Primary Qwen adaptation mirror; propagate from canonical source, then adjust host-specific details. |
| `~/.qwen/superpowers/bin/superpowers-codex` + `~/.qwen/superpowers/docs` | `CAUTION` | Bootstrap/distribution bundle; edit only for Codex host behavior and keep aligned with canonical superpowers policy. |

## Canonical Reminder

For shared superpowers behavior, align with baseline first:

- `~/.supremepower/skills/`

Then propagate into Qwen adaptation layers (`~/.qwen/superpowers/...`, `~/.qwen/skills/...`) with validation.

## Escalation (when unsure)

1. Check `docs/SOURCE_OF_TRUTH_AND_LAYERS.md`.
2. If path is `CAUTION`, confirm whether change is host-specific.
3. If not host-specific, patch canonical first.
4. Log decision in `docs/learned-context.md`.

## Crosswalk (role + source + sync target)

| Path | Role | Edit Policy | Source Upstream | Primary Sync Target |
|---|---|---|---|---|
| `~/.qwen/agents` | Qwen persona/runtime contracts | `CAUTION` | Qwen-local + selected imports | Qwen runtime only |
| `~/.qwen/commit-commands` | Command adapter docs/scripts | `CAUTION` | Qwen-local | `~/.qwen/commands` / runtime command surfaces |
| `~/.qwen/docs/evolution-changelogs` | Historical evolution snapshots | `CAUTION` | Prior session exports | Reference only (do not treat as live canonical) |
| `~/.qwen/explanatory-output-style` | Runtime behavior/style injector | `CAUTION` | Plugin/host adaptation | Active `latest` runtime style path |
| `~/.qwen/integrations` | Cross-platform integration bundle | `CAUTION` | Canonical + host adapters | Qwen/Gemini/Supremepower bridge layers |
| `~/.qwen/learning-output-style` | Runtime learning-mode injector | `CAUTION` | Plugin/host adaptation | Active `latest` runtime style path |
| `~/.qwen/new-hooks-system` | Hook development/staging workspace | `CAUTION` | Qwen-local implementation work | `~/.qwen/hookify` or documented hook runtime |
| `~/.qwen/plugins` | Plugin runtime/config descriptors | `CAUTION` | Qwen-local + marketplace structure | Host plugin runtime |
| `~/.qwen/security-guidance` | Security policy/guidance package | `ALLOWED` | Qwen governance docs | Qwen policy surface |
| `~/.qwen/skills` | Mixed skill inventory + adapters | `CAUTION` | Multiple ecosystems | Qwen skill runtime |
| `~/.qwen/superpowers` | Qwen superpowers adaptation mirror | `CAUTION` | `~/.supremepower/skills/` baseline lineage | Qwen superpowers runtime/distribution |
| `~/.qwen/superpowers/bin/superpowers-codex` + `~/.qwen/superpowers/docs` | Codex bootstrap + skill-loader adapter | `CAUTION` | Canonical superpowers policy + Codex host mapping | Codex session bootstrap/runtime discipline |

### Snapshot/no-direct-edit reminders

- `~/.qwen/superpowers/4.2.0/**` is treated as version snapshot material.
- Cache/artifact files like `**/.DS_Store` are never canonical content.


# Installation Host Crosswalk (Qwen-Native)

Use this page to pick the right installation/setup docs based on the host runtime you are updating.

## Source-of-Truth Rule

- Maintain typical baseline standard in `~/.supremepower/`.
- Adapt and operationalize for Qwen runtime in `~/.qwen/` or `~/.qwen/integrations/supremepower/`.
- Avoid changing policy semantics in adaptation layers unless explicitly intended.

## Host-to-Doc Mapping

| Host / Runtime | Primary install doc(s) | Notes |
|---|---|---|
| Qwen native (`~/.qwen`) | `~/.qwen/superpowers/INSTALL.md` | Primary Qwen-local install/upgrade path. |
| Qwen + Supremepower integration | `~/.qwen/integrations/supremepower/docs/installation.md` | Integration-specific adapters/commands/hooks. |
| Supremepower typical standard | `~/.supremepower/` docs and skill sources | Baseline standard for shared behavior and host guidance. |
| Qwen adapted runtime | `~/.qwen/superpowers/` and `~/.qwen/skills/` | Local operational/adapted layer based on baseline. |
| Codex-oriented wrapper docs | `~/.qwen/superpowers/docs/INSTALL.md` and `~/.qwen/superpowers/bin/superpowers-codex` | Keep as compatibility layer, not Qwen source-of-truth. |
| Legacy copy docs | `~/.qwen/superpowers/INSTALL copy.md` | Historical/reference only; do not prioritize for runtime setup. |

## Operational Guidance

1. Select host target first (Supremepower baseline vs Qwen adapted runtime vs compatibility wrapper).
2. Apply edits at the correct authority layer.
3. If touching Qwen behavior, verify command/skill path alignment:
   - `~/.qwen/superpowers/skills/*`
   - `~/.qwen/integrations/supremepower/commands/skills/*`
4. Log substantive changes in:
   - `~/.qwen/docs/CHANGELOG.md`
   - `~/.qwen/docs/EVOLUTION_AND_ITEM_HISTORY.md`
   - `~/.qwen/docs/learned-context.md`

# Flow: Systematic Debugging Skill

## Purpose
Documents the full activation and file-flow for `systematic-debugging` across Qwen and Gemini paths.

## Verified Skill Content Set
Expected files in the skill directory:
- `SKILL.md`
- `condition-based-waiting-example.ts`
- `condition-based-waiting.md`
- `CREATION-LOG.md`
- `defense-in-depth.md`
- `find-polluter.sh`
- `root-cause-tracing.md`
- `test-academic.md`
- `test-pressure-1.md`
- `test-pressure-2.md`
- `test-pressure-3.md`

## Verified Runtime Locations
- `~/.gemini/extensions/supremepower/skills/systematic-debugging/`
- `~/.qwen/integrations/supremepower/skills/systematic-debugging/`
- `~/.qwen/skills/superpowers-systematic-debugging/`
- `~/.qwen/superpowers/skills/systematic-debugging/`

## Activation Routes
1. `qwen-sp use systematic-debugging`
   - resolves to `~/.qwen/superpowers/skills/systematic-debugging/SKILL.md`
2. Integration command alias:
   - `integrations/supremepower/commands/skills/systematic-debugging.toml`
   - `integrations/supremepower/commands/debug.toml`
   - both inject context path `skills/systematic-debugging/SKILL.md`
3. Gemini extension activation uses:
   - `~/.gemini/extensions/supremepower/skills/systematic-debugging/*`

## Operational Flow (Behavior)
1. Trigger debugging task.
2. Activate `systematic-debugging` skill.
3. Execute staged method from skill:
   - reproduce
   - isolate
   - fix
   - verify
4. Optionally chain to `verification-before-completion`.

## Breakage Conditions
Flow breaks if any of these happen:
- Skill directory missing in active runtime path.
- `SKILL.md` missing.
- Adapter TOML exists but points to a path that no longer exists.
- Dedupe removes the only active copy in a runtime tree.

## Safe Maintenance Rule
Archive-only dedupe is allowed only when another active canonical copy remains in each runtime tree used by commands.

# Link Paths, Usage Workflows, and Multi-Ability (Qwen)

Purpose: one Qwen-native map for path relationships, usage semantics, workflow sequencing, and multi-ability triggering.

## 1) Link Paths (Qwen authority)

| What | Primary path | Notes |
|---|---|---|
| Skills (active) | `~/.qwen/superpowers/skills/<name>/SKILL.md` | Author active behavior here first. |
| Skills (runtime surface) | `~/.qwen/skills/` | Includes superpowers runtime copies and imported skills. |
| Agents | `~/.qwen/agents/` | Persona/role execution layer. |
| Rules | `~/.qwen/rules/` | Concept source for host tooling; promote validated behavior into Qwen docs/hook policy. |
| Scripts | `~/.qwen/scripts/` | `qwen-sp`, backup, update, and helper scripts. |
| Hooks runtime | `~/.qwen/hookify/` | Runtime policy enforcement layer. |
| Hooks policy docs | `~/.qwen/docs/HOOKS_MODEL_AND_IMPLEMENTATION.md` | Canonical hook semantics. |
| Integration adapters | `~/.qwen/integrations/supremepower/` | Cross-host adapter surface. |
| Recall/index docs | `~/.qwen/Master_Recall_Index.md`, `~/.qwen/QWEN_INVOKE_INDEX_BY_TYPE.md` | Goal-based and type-based discovery. |

## 2) Usage Methods

| Type | Method | Meaning |
|---|---|---|
| Skill | invoke/use | Load and follow `SKILL.md` instructions. |
| Agent | load/follow | Use agent role prompt for scoped execution. |
| Workflow | run/follow | Execute ordered chain until completion. |
| Rule | respect | Apply constraints when editing matching surfaces. |
| Script | run | Execute exact script command/contract. |

Language is flexible for intent ("invoke/run/use/apply"), but strict for exact paths, keys, and script/tool names.

## 3) Workflow Chaining

- Feature/multi-step execution:
  - `brainstorming` -> `writing-plans` -> `executing-plans` or `subagent-driven-development` -> `verification-before-completion` -> review.
- Debug/fix quality stack:
  - `systematic-debugging` -> fix -> `verification-before-completion`.
- Content/config changes:
  - classify objective -> run one primary workflow skill -> apply smallest valid patch -> verify.

## 4) Multi-Ability Triggering

Use multiple abilities when:

1. task spans design + implementation + verification,
2. task requires both runtime policy and documentation alignment,
3. user requests broad coverage ("don't leave anything out", "review everything").

Keep one active flow at a time; finish each stage before advancing.

## 5) References

- `~/.qwen/QWEN_SYSTEM_DEFINITION.md`
- `~/.qwen/Master_Recall_Index.md`
- `~/.qwen/QWEN_INVOKE_INDEX_BY_TYPE.md`
- `~/.qwen/docs/LANGUAGE_AND_REFERENCE_STANDARD.md`
- `~/.qwen/docs/SOURCE_OF_TRUTH_AND_LAYERS.md`

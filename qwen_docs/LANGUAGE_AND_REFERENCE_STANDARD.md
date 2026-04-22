# Language and Reference Standard (Qwen)

Purpose: define when wording should be interpreted flexibly (intent) vs enforced strictly (machine-dependent).

## Principle

- Flexible for intent: understand meaning even when phrasing differs.
- Strict for contracts: enforce exact form when paths/keys/tools/formats must match.

Interpret language; enforce interfaces.

## Flexible (Intent-Based)

Treat these as equivalent by intent:

- invoke / run / use / apply / trigger
- "use when" / "invoke when"
- phrasing variants of the same user goal

Do not require literal keyword matches when routing to skills or workflows.

## Strict (Contract-Based)

Exactness required for:

- file paths and globs,
- config keys and JSON/TOML structure,
- script names and flags,
- MCP tool names and argument contracts,
- required artifact formats.

If changing a string can break parsing, lookup, or execution, it is strict.

## Quick Decision Check

1. Is this about user intent/routing? -> flexible.
2. Is this about machine parsing/execution? -> strict.

## Examples

- "run the skill flow now" -> map to required workflow by intent (flexible).
- `~/.qwen/scripts/qwen-sp` path or `modelProviders.openai.envKey` key -> exact string required (strict).

## References

- `~/.qwen/QWEN_SYSTEM_DEFINITION.md`
- `~/.qwen/docs/LINK_PATHS_USAGE_WORKFLOWS_AND_MULTI_ABILITY.md`
- `~/.qwen/docs/SOURCE_OF_TRUTH_AND_LAYERS.md`

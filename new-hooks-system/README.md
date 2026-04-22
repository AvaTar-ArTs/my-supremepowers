# New Hooks System Workspace

This directory is a self-contained build from your requested reflection path:

- source materials
- findings and thoughts
- runnable hook examples
- small test script

## Structure

- `source-materials/`
  - `what-hooks-mean.txt`
  - `Learning_Explanatory_Styles.md`
  - `get-hooked.txt`
- `findings-and-thoughts/`
  - `hooks-architecture-findings.md`
- `functioning-hooks-example/`
  - `hooks/hooks.json`
  - `hooks-handlers/session-start.sh`
  - `hooks-handlers/pre-tool-use.sh`
  - `hooks-handlers/post-tool-use.sh`
- `scripts/`
  - `smoke-test-hooks.sh`

## Intent

This package keeps your two-layer model explicit:

1. Bootstrap/prompt hook layer (instructional orchestration)
2. Runtime hook layer (actual event interception)

Use this as a blueprint and staging area before promoting any files into active runtime trees.

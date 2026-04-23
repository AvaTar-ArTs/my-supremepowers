# Agents Integrity + Restore Preview

## Current Integrity
- `autotag_architect.toml`: valid
- `ecosystem_intelligence.toml`: valid
- `agent-creation-guidance.md`: size=3963 frontmatter=True
- `code-reviewer.md`: size=3888 frontmatter=True
- `documentation-management.md`: size=0 frontmatter=False
- `rule-definition.md`: size=0 frontmatter=False
- `system-analysis.md`: size=0 frontmatter=False

## Empty/Stubs Detected
- `agents/documentation-management.md` is empty (0 bytes)
- `agents/rule-definition.md` is empty (0 bytes)
- `agents/system-analysis.md` is empty (0 bytes)
- `agents/write_test_agents.tmp` is empty (0 bytes)

## Suggested Restore Sources (preview only)
- `agents/documentation-management.md` <= `qwen_agents/documentation-manager.md`
- `agents/system-analysis.md` <= `qwen_agents/system-analyzer.md`
- `agents/rule-definition.md` <= `qwen_agents/documentation-manager.md`

## Notes
- `rule-definition.md` has no clear one-to-one source in `qwen_agents`; suggested source is a placeholder to bootstrap content, then refine.
- `.tmp` file looks disposable unless intentionally reserved for tests.

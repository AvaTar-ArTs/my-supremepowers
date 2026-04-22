# Qwen Superpowers — Tool Mapping Reference

## Claude Code → Qwen Tool Mappings

| Claude Code Tool | Qwen Equivalent | Notes |
|-----------------|-----------------|-------|
| `TodoWrite` | Structured markdown checklists | Use `- [ ]` format in responses |
| `Task` (subagents) | Agent tool | Use `agent` tool with `subagent_type` parameter |
| `Skill` tool | Skill tool | Same concept, native support |
| `Read` tool | read_file tool | Same functionality |
| `Write` tool | write_file tool | Same functionality |
| `Edit` tool | edit tool | Same functionality |
| `Bash` tool | run_shell_command tool | Same functionality |
| `Grep` tool | grep_search tool | Same functionality |
| `Glob` tool | glob tool | Same functionality |
| `mcp__*` tools | mcp__* tools | Same MCP tool protocol |

## Gemini Supremepower → Qwen Mappings

| Gemini Concept | Qwen Equivalent |
|---------------|-----------------|
| `/sp:agents` | `qwen-sp agents` |
| `/sp:skills` | `qwen-sp skills` |
| `gemini-sp` wrapper | Not needed — Qwen has native Skill/Agent tools |
| Extension MCP server | Not needed — Qwen loads skills natively |
| `activate_agents` MCP tool | Use Agent tool directly |
| `list_skills` MCP tool | `qwen-sp skills` or `qwen-sp bootstrap` |
| `get_agent_persona` MCP tool | Read `~/.qwen/agents/<name>/agent.md` |

## Codex Superpowers → Qwen Mappings

| Codex Command | Qwen Equivalent |
|--------------|-----------------|
| `superpowers-codex bootstrap` | `qwen-sp bootstrap` |
| `superpowers-codex find-skills` | `qwen-sp skills` |
| `superpowers-codex use-skill <name>` | `qwen-sp use <name>` |

## Skill-Specific Tool Requirements

### When Skills Reference Missing Tools

When a superpowers skill references a Claude Code tool you don't have:

1. **Check this mapping first** for the closest equivalent
2. **Adapt the methodology** — the skill's process matters more than the specific tool
3. **Announce the adaptation** — "Using [Qwen tool] as equivalent to [Claude tool]"

### Examples:
- Skill says "use TodoWrite to track steps" → Create a markdown checklist in your response
- Skill says "dispatch a subagent via Task tool" → Use the Agent tool with appropriate type
- Skill says "read the skill file via Read tool" → Use the Skill tool to load it

## File Locations Quick Reference

```
~/.qwen/
├── superpowers/skills/        # 17 superpowers skills
├── skills/                    # 44 regular skills
├── agents/                    # 12 specialist agents + 14 existing agents
├── commands/                  # 3 slash commands
├── rules/                     # 4 .mdc rules
├── scripts/qwen-sp            # Superpowers orchestrator CLI
└── integrations/supremepower/ # Adapted supremepower files
```

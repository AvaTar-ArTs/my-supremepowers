# ~/.qwen Ecosystem Import Manifest

**Date:** 2026-04-11
**Source:** Steven's complete AI dotfile ecosystem (~150+ directories scanned)
**Author:** AvaTar-ArTs (me@avatararts.org)

---

## Import Summary

| Category | Count | Sources |
|----------|-------|---------|
| **Skills** | 43 | ~/.gemini/skills, ~/.codex/skills, ~/.claude/plugins, ~/.git-ai/skills, original |
| **Superpowers Skills** | 16 | ~/iterm2/superpowers/skills (canonical authoring source), propagated into Qwen/Supremepower adapters |
| **Agents** | 14+ | ~/.cursor/agents, ~/.claude/agents, original |
| **Commands** | 3 | ~/.supremepower/commands |
| **Rules** | 4 | ~/.cursor/rules |
| **Qodo Agents** | 4 | ~/.qodo/agents (TOML format) |
| **Qodo Workflows** | 9 | ~/.qodo/workflows (TOML format) |
| **Hooks** | 2 | ~/.supremepower/hooks |
| **Plugins Registered** | 2 | skills/.claude-plugin, agents/.claude-plugin |

---

## Skills Imported (43 total)

### ToolUniverse / Scientific (7)
- `tooluniverse` — General strategies for 10000+ scientific tools
- `tooluniverse-clinical-trial-design` — Clinical trial feasibility assessment
- `tooluniverse-sequence-retrieval` — DNA/RNA/protein sequence retrieval
- `setup-tooluniverse` — Install and configure ToolUniverse with MCP
- `devtu-fix-tool` — Fix failing ToolUniverse tools
- `devtu-optimize-descriptions` — Optimize tool descriptions
- `devtu-optimize-skills` — Optimize ToolUniverse skills

### Plugin Development (7)
- `skill-creator` — Create/evaluate/improve skills (from Claude official)
- `skill-development` — Skill development patterns
- `plugin-structure` — Plugin directory layout and manifest
- `plugin-settings` — Per-project plugin settings via .local.md
- `mcp-integration` — MCP server integration patterns
- `hook-development` — Create PreToolUse/PostToolUse/Stop hooks
- `command-development` — Create slash commands with arguments

### MCP & Server Dev (3)
- `build-mcp-server` — Build MCP servers (remote HTTP, stdio, MCPB)
- `build-mcp-app` — Build interactive UI widgets for MCP servers
- `build-mcpb` — Package MCP servers as .mcpb bundles

### Claude Code Official (6)
- `automation-recommender` — AI automation recommendations
- `claude-md-improver` — Audit and improve CLAUDE.md files
- `frontend-design` — Production-grade frontend interfaces
- `math-olympiad` — Math olympiad problem solving
- `session-report` — HTML session usage reports
- `playground` — Interactive single-file HTML playgrounds

### Messaging Plugins (6)
- `discord-access` / `discord-configure` — Discord channel management
- `imessage-access` / `imessage-configure` — iMessage integration
- `telegram-access` / `telegram-configure` — Telegram bot integration

### Ecosystem & Business (4)
- `managing-ecosystem-cleanup` — Audit, propose, execute cleanup
- `workspace-ecosystem-audit` — Deep inventory of AI/agent ecosystems
- `narrative-blueprints` — Persuasive narratives for non-technical audiences
- `writing-rules` — Hookify rule creation

### Core Qwen (8)
- `systematic-debugging` — Four-phase debugging methodology
- `ecosystem-navigation` — Navigate Qwen docs and capabilities
- `self-assistance` — Task management and context preservation
- `self-improvement` — Continuous improvement cycle
- `cursor-integration` — Cross-platform Cursor integration
- `git-ai-assistant` — Git AI attribution tracking
- `git-ai-cursor-integration` — Git AI + Cursor bridge
- `ice-tracker-integration` — ICE Tracker project assistance

### Media & Creative (2)
- `sora` — Sora AI video generation
- `math-olympiad` — Math olympiad (also in Claude official)

---

## Superpowers Skills (16 total)

From `~/iterm2/superpowers/skills/` (canonical Obra Superpowers authoring source), propagated into Qwen/Supremepower adapters:
- `using-superpowers` — Meta-skill: how to use all superpowers
- `brainstorming` — Explore intent, requirements, design before implementation
- `writing-plans` — Bite-sized plans with verification
- `executing-plans` — Execute plans with review checkpoints
- `test-driven-development` — Red → green → refactor
- `systematic-debugging` — Root cause → pattern → hypothesis → fix
- `subagent-driven-development` — Dispatch independent tasks via subagents
- `dispatching-parallel-agents` — Parallel independent task execution
- `requesting-code-review` — Request review when steps complete
- `receiving-code-review` — Handle review feedback with technical rigor
- `verification-before-completion` — Evidence before success claims
- `finishing-a-development-branch` — Merge, PR, or cleanup guidance
- `writing-skills` — Create/edit/verify skill files
- `using-git-worktrees` — Isolated git worktree workflows
- `ecosystem-clarity` — Ecosystem clarity and simplification
- `workflow-bootstrap` — Bootstrap new workflows

---

## Commands (3)

From ~/.supremepower/commands:
- `brainstorm.md` — Brainstorming command
- `write-plan.md` — Write plan command
- `execute-plan.md` — Execute plan command

---

## Rules (4)

From ~/.cursor/rules:
- `superpowers.mdc` — Always apply: Obra Superpowers skills, brainstorm→plan→TDD chain
- `cross-agent-integration.mdc` — Generate skills to other agents, never remove originals
- `exceptional-output-system.mdc` — Always apply: changelog, evolution history, reanalyze, index
- `learned-context.mdc` — Always apply: read/update docs/learned-context.md cache

---

## Qodo Agents (4 TOML)

- `3a238fe7-*.toml` — Plan agent (structured planning)
- `45f7d208-*.toml` — Ask agent (read-only code questions)
- `b0417ecd-*.toml` — Review agent (code review)
- `b2703e21-*.toml` — Sorty agent (repo AEO/SEO optimization)

## Qodo Workflows (9 TOML)

- Various UUID-based workflow definitions for Qodo platform

---

## Plugin Registration

### ~/.qwen/skills/.claude-plugin/plugin.json
Registers all 43 skills as a single plugin "qwen-skills" by AvaTar-ArTs

### ~/.qwen/agents/.claude-plugin/plugin.json
Registers all 14+ agents as a single plugin "qwen-agents" by AvaTar-ArTs

---

## Sources Scanned

| Directory | Status |
|-----------|--------|
| ~/.actor | Apify actor config |
| ~/.agent_events | Event logs |
| ~/.agent_ops | Orchestrator knowledge |
| ~/.agents | Empty skills placeholder |
| ~/.ai-shell | ⚠️ API key exposed |
| ~/.aider | Aider config |
| ~/.aitk | AI toolkit evals |
| ~/.apify | Apify auth |
| ~/.boltai | MCP config |
| ~/.cagent | Model cache |
| ~/.chatgpt | ChatGPT CLI |
| ~/.claude | ✅ Skills, agents, plugins imported |
| ~/.cline | Empty skills |
| ~/.codeium | Git AI hooks |
| ~/.codex | ✅ Skills imported |
| ~/.codexs | Mirror of .codex |
| ~/.copilot | IDE config |
| ~/.crewai | Provider cache |
| ~/.cursor | ✅ Agents, rules imported |
| ~/.eigent | MCP config |
| ~/.gemini | ✅ Skills imported |
| ~/.git-ai | ✅ Skills already in ~/.qwen |
| ~/.grok | API key |
| ~/.groq | Local settings |
| ~/.harbor | 100+ compose files (infrastructure) |
| ~/.kimi | Config |
| ~/.lh | Language helper |
| ~/.lingma | VS Code integration |
| ~/.logseq | Knowledge base |
| ~/.mcp-central | MCP configs |
| ~/.mcphooker | Hook traces |
| ~/.mcp-auth | MCP remote auth |
| ~/.opencode | Binary |
| ~/.openclaw | Config |
| ~/.plural | Config |
| ~/.qoder | Auth/logs |
| ~/.qodo | ✅ Agents/workflows imported |
| ~/.raycast | Scripts |
| ~/.serena | Code analysis |
| ~/.streamlit | Credentials |
| ~/.supremepower | ✅ Skills/commands/hooks imported |
| ~/.tagger | Knowledge base system |
| ~/.tooluniverse | Cache |
| ~/.vscode | Extensions |
| ~/.x-cmd.root | Shell framework |
| ~/.zapierrc | ⚠️ Deploy key exposed |

---

## Security Warnings

1. **~/.ai-shell** — OpenAI API key in plaintext → ROTATE
2. **~/.zapierrc** — Zapier deploy key exposed → Consider restricting
3. **~/.grok/api-key** — Grok API key in plaintext
4. **~/.gemini/oauth_creds.json** — OAuth credentials
5. **~/.claude.json** — User ID, email, organization details
6. **Multiple .env files** — May contain credentials

---

## What Was NOT Imported

- Infrastructure configs (Harbor compose files, MCP server configs)
- Event logs (JSONL files from agent_ops, agent_events)
- Shell framework files (.zshrc, .x-cmd, .oh-my-zsh)
- Binary files and caches
- Empty directories and placeholders
- Duplicate files already present in ~/.qwen
- Database files (SQLite, pkl)

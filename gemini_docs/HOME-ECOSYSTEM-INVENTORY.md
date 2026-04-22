# Home ecosystem inventory

**Scope:** Dot-dirs and key project paths under `~` related to AI/agent tooling, MCP, tagging, and automation.  
**Date:** 2025-02-08

---

## 1. Agent / event logging and hooks

| Path | Purpose | Contents |
|------|---------|----------|
| **~/.agent_events** | Agent event log sink | `hooks_events.jsonl`, `tool_use.jsonl` (currently empty in sample). Likely written by MCP/hook integrations. |
| **~/.mcphooker** | mcPHooker tool-usage log | `tool-usage.jsonl`. Python lib logs tool name, status, duration_ms, args_keys. |
| **~/mcPHooker** | mcPHooker source | **Hook/tracking implementation:** `src/tool_use_tracker.py`, `custom_span*.py`, `hook_router*.py`, `span_sink.py`; `templates/` (after-tool, before-tool, session-start shell scripts); `scripts/run-hook*.py`. Complements Gemini CLI hooks (see ~/.gemini/docs/AGENT-HOOKS-RALPH-RESEARCH-AND-ASSESSMENT.md). |
| **~/.gemini/hooks** | Gemini CLI hooks | `log-tools.sh` (AfterTool → `~/.gemini/logs/tool-use.jsonl`). Enable via `settings.json` (see AGENT-HOOKS doc). |

**Relationship:** `.agent_events` and `.mcphooker` are alternate/legacy log destinations; `mcPHooker` is the codebase that implements tool tracking and custom spans. Gemini CLI native hooks (e.g. `log-tools.sh`) are a separate, CLI-integrated path.

---

## 2. Claude / Claude Code

| Path | Purpose | Contents |
|------|---------|----------|
| **~/.claude** | Claude (IDE/API) state | `CLAUDE.md.UPDATED`, `history.jsonl`, `file-history/`, `projects/` (per-workspace .jsonl sessions), `skills/`, `hooks/` (export_conversation, import), `plugins/`, `shell-snapshots/`, `tasks/`, `statsig/`, `ide/`. |
| **~/.claude-code-router** | Claude Code routing | Empty (placeholder or unused). |
| **~/.claude-server-commander** | Server commander | `tool-history.jsonl`. |
| **~/.claude-worktrees** | Git worktrees for Claude | Empty. |
| **~/.claudeCodeChange** | Claude “change” workspaces | Per-change dirs (`change_*`) with code/snapshots; `scripts/` (manage-extensions, processors, setup, upload). Zero-byte files here were quarantined in ~/.gemini/tmp repair. |

---

## 3. Codex (Cursor/IDE agent)

| Path | Purpose | Contents |
|------|---------|----------|
| **~/.codex** | Codex config and state | `config.toml`, `history.jsonl`, `rules/`, `sessions/`, `shell_snapshots/`, `skills/` (skill-creator, skill-installer, skill-porter, sora, workspace-ecosystem-audit), `tmp/`, `archived_sessions/`. |

---

## 4. Cursor

| Path | Purpose | Contents |
|------|---------|----------|
| **~/.cursor** | Cursor IDE | `chats/`, `cli/`, `extensions/`, `plugins/`, `projects/`, `skills/`, `worktrees/`, `PHASE_3_ANALYSIS/`, `update.sh`. |

---

## 5. Other AI / agent platforms

| Path | Purpose | Contents |
|------|---------|----------|
| **~/.grok** | Grok (xAI) | `sessions/*.jsonl`, `update.sh`. |
| **~/.qwen** | Qwen IDE/agent | `projects/` (per-workspace .jsonl), `ide/` (locks), `tmp/*.output`, `installation_id`, `QWEN.mdnecho`, `update.sh`. |
| **~/.qodo** | Qodo agents/workflows | `agents/*.toml`, `workflows/*.toml`, `update.sh`. |

---

## 6. MCP and auth

| Path | Purpose | Contents |
|------|---------|----------|
| **~/.mcp-auth** | MCP authentication | Empty. |
| **~/.mcp-central** | MCP central config | `update.sh` only. |

---

## 7. Tagging and indexing (AutoTagger / .tagger)

| Path | Purpose | Contents |
|------|---------|----------|
| **~/.tagger** | Tagger scripts and config | AutoTagger-style: `autotag.sh`, `universal_directory_indexer.py`, `multi_format_directory_indexer*.py`, `phase2_intelligent_organization.py`, `phase3_advanced_intelligence.py`, `run_tiered_indexing.py`, `save_knowledge*.sh`, `SETUP_SYSTEM.sh`, backups, etc. |
| **~/AutoTagger** | AutoTagger versions | `current/`, `v1-original-kb/`, `v2-engine/`, `v3-dev/`, `v4-workspace/`. Each has indexers, phase scripts, setup. MasterxEo/MasterxEo docs reference `v2-engine` and all_scan outputs. |

**Relationship:** `.tagger` looks like an active or symlinked copy of one AutoTagger version; AutoTagger is the versioned project. Use `~/.gemini` agents (e.g. autotag_architect) with these paths as needed.

---

## 8. Documents and tools

| Path | Purpose | Contents |
|------|---------|----------|
| **~/Documents/tools** | Document tools | `find_duplicates.py`, `find_duplicates_enhanced.py`. |
| **~/Documents/whoosh-search-index** | Whoosh search | `index_documents*.py`, `search_documents*.py`, `demo_search.py` (tag-aware indexing/search). Can integrate with AutoTagger outputs. |
| **~/tools** | General tools | Empty. |
| **~/userscripts** | User scripts | Empty. |

---

## 9. Scripts and Python projects

| Path | Purpose | Contents |
|------|---------|----------|
| **~/scripts** | Shell and launcher scripts | Many .sh (autotagger_launcher, cleanup, avatararts, grok, ollama, setup_*, etc.), `agent_forge/`. |
| **~/pythons** | Python projects and libs | Large tree: `apis/`, `data_processing/`, `file_operations/`, `media_processing/`, `llm/`, `projects/`, `tools/`, avatararts/autotag/consolidation scripts, etc. |

---

## 10. Downloads (referenced paths)

| Path | Purpose |
|------|---------|
| **~/Downloads/AI Empire Course_ Content & Launch.json** | Export/config artifact. |
| **~/Downloads/AI_content_analysis_insights___Claude_export_2026-01-17T00-06.zip** | Claude export archive. |
| **~/Downloads/Creative_Automation_Portfolio_Strategy_export_2025-09-05T22-59** | Export folder. |
| **~/Downloads/skill-porter-unzipped** | Unzipped skill-porter (e.g. `skill-porter-main/` with LICENSE, .gitignore). |

---

## 11. Other

| Path | Purpose | Contents |
|------|---------|----------|
| **~/sora-remover** | Sora watermark removal | Single script: `sora_2_video_watermark_remover_free.py`. |

---

## 12. Cross-references

- **Gemini CLI:** ~/.gemini (agents, extensions, policies, hooks, docs). See `docs/AGENT-HOOKS-RALPH-RESEARCH-AND-ASSESSMENT.md`, `docs/ENABLED-EXTENSIONS.md`, `docs/EXTENSIONS-INVENTORY.md`.
- **Tool-use logging:** Three parallel mechanisms: (1) ~/.gemini/hooks/log-tools.sh → ~/.gemini/logs/tool-use.jsonl, (2) mcPHooker → ~/.mcphooker/tool-usage.jsonl, (3) .agent_events (hooks_events.jsonl, tool_use.jsonl). Consolidate or document which is canonical for which environment.
- **Handoff / Studio–Factory:** Conceptual in ~/.gemini/xeo-grow.md; handoff implementation can use ~/.gemini or mcPHooker patterns (see AGENT-HOOKS doc).

This file can live under `~/.gemini/docs/` and be updated as paths or purposes change.

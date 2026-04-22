# mcPHooker & AutoTagger — Focus Doc

**Date:** 2026-02-08  
**Scope:** What each does, where it lives, how they connect, and practical fixes/suggestions.

---

## 1. mcPHooker

### What it is

- **Tool-use tracker** for MCP/agent sessions: logs tool name, status, duration_ms, args_keys (and optional error) to a JSONL file.
- **Source:** `~/mcPHooker` (Python package with `src/` and `scripts/`).
- **Log sink:** `~/.mcphooker/tool-usage.jsonl` (or path from env `MCP_HOOKER_TOOL_LOG`).

### Layout

| Path | Purpose |
|------|--------|
| **~/mcPHooker** | Source: `src/tool_use_tracker.py`, `hook_router*.py`, `custom_span*.py`, `span_sink.py`; `scripts/run-hook*.py`; `templates/*.sh` (after-tool, before-tool, session-start). |
| **~/.mcphooker** | Data dir: `tool-usage.jsonl` (append-only log). |

### How it’s used

- **Library:** Other code imports and calls `tool_use_tracker.log_tool_use()` or `track_tool(...)`; log path comes from `MCP_HOOKER_TOOL_LOG` or default `~/.mcphooker/tool-usage.jsonl`.
- **Hooks:** `templates/` provide shell scripts that can be wired as “after tool” / “before tool” / “session start” in environments that support hooks (e.g. MCP servers, custom runners). The `run-hook*.py` scripts are the entrypoints when a hook fires.
- **MasterxEo:** `integrate_systems.sh` / `verify_integration.sh` symlink `~/mcPHooker` to `MasterxEo/INTEGRATION_TOOLS/MCPHOOKER/mcphooker_link` so the workspace can reference it. `run_autotagger_then_mcphooker.sh` (in MasterxEo 07_DOCUMENTATION) runs AutoTagger then sets env for mcPHooker (e.g. `AGENT_EVENTS`, tool log path).

### Relationship to Gemini CLI hooks

- **Gemini native:** `~/.gemini/hooks/log-tools.sh` → `~/.gemini/logs/tool-use.jsonl` (enable in `settings.json`).
- **mcPHooker:** Separate implementation and log file; can run alongside or instead of Gemini hooks. Three log flows exist today: `.agent_events`, `.mcphooker`, `~/.gemini/logs`; pick one as canonical per environment or document which is which.

---

## 2. AutoTagger

### What it is

- **Content-aware indexing/tagging:** Scans directories, assigns categories, business value, confidence; outputs CSV (and often HTML/MD). Feeds MasterxEo reports, Whoosh, and the autotag_architect agent.
- **Versioned project:** `~/AutoTagger` with `current/`, `v1-original-kb/`, `v2-engine/`, `v3-dev/`, `v4-workspace/`.
- **Active deployment:** `~/.tagger` — same script set as **v2-engine** (not a symlink; a copy). MasterxEo and many scripts use **v2-engine** or **.tagger**.

### Layout

| Path | Purpose |
|------|--------|
| **~/AutoTagger/current** | Thin wrapper: `autotagger.py`, `main.py`; used by **autotagger_launcher.sh** (~/scripts). |
| **~/AutoTagger/v2-engine** | Full v2 scripts: `universal_directory_indexer.py`, `multi_format_directory_indexer*.py`, `phase2_*`, `phase3_*`, `run_tiered_indexing.py`, `autotag.sh`, kb_aliases, etc. Canonical for MasterxEo and run_autotagger_then_mcphooker. |
| **~/.tagger** | Copy of v2-engine–style scripts; e.g. `phase1_rapid_scan.py` (if present) and phase2/3 used by some flows. |
| **~/AutoTagger/output** | Default output dir for CSVs/HTML/MD and `autotagger.db`; MasterxEo keeps a canonical copy of latest all_scan CSV (e.g. `all_scan_YYYYMMDD_HHMMSS.csv`). |

### How it’s used

- **autotagger_launcher.sh** (~/scripts): `autotagger_launcher.sh <dir> [prefix]` → runs `~/AutoTagger/current/autotagger.py`; output under `~/AutoTagger/output/`.
- **run_autotagger_then_mcphooker.sh** (MasterxEo 07_DOCUMENTATION): Runs v2 `universal_directory_indexer.py` (or .tagger phase1 if present), then sets up env for mcPHooker; uses MasterxEo as root and writes logs under the script dir.
- **autotag_architect** (Gemini agent): Uses `~/AutoTagger` and AVATARARTS_KNOWLEDGE_BASE / autotag_config; tasks: research, audit, evolve, heal (suggest autotag.sh commands). References v2 and all_scan outputs.
- **.zshrc:** Sources `~/AutoTagger/v1-original-kb/kb_aliases.sh` and `~/AutoTagger/v2-engine/kb_aliases.sh` for shell helpers.

### Which version is “current”

- **Launcher:** `current/` (which calls into the same logic as v2).
- **MasterxEo / integration scripts:** **v2-engine** and **.tagger**.
- **autotag_architect:** v2 and output CSVs. So **v2-engine** is the main production path; **current** is the launcher entrypoint; **.tagger** is the deployed copy aligned with v2.

---

## 3. How they connect

| Integration | What it does |
|-------------|--------------|
| **run_autotagger_then_mcphooker.sh** | 1) Run AutoTagger (v2 or .tagger) on MasterxEo. 2) Set `AGENT_EVENTS`, tool log path, etc., for mcPHooker so subsequent tool use can be logged in that workspace. |
| **integrate_systems.sh** / **verify_integration.sh** | Link Whoosh, mcPHooker, AutoTagger into MasterxEo (e.g. `INTEGRATION_TOOLS/MCPHOOKER/mcphooker_link` → ~/mcPHooker). |
| **autotag_architect** | Reads AutoTagger outputs and config; suggests heal/audit commands; does not run mcPHooker itself. |
| **Whoosh** | Can index AutoTagger output (e.g. index_documents_enhanced_with_autotagger.py); separate from mcPHooker. |

So: **AutoTagger** produces tagged CSVs and state; **mcPHooker** consumes tool-use events and writes JSONL. They meet in the same workflow script (run_autotagger_then_mcphooker) and in MasterxEo’s integration layout.

---

## 4. Status and suggestions

### Working as-is

- mcPHooker source and log path; tool_use_tracker API.
- AutoTagger v2-engine and .tagger in use; autotagger_launcher → current; autotag_architect points at the right paths.
- MasterxEo script run_autotagger_then_mcphooker and integration symlinks (once integrate_systems/verify_integration have been run).

### Clarify / small fixes

1. **Single “current” AutoTagger entrypoint**  
   - **autotagger_launcher.sh** uses `~/AutoTagger/current`; **run_autotagger_then_mcphooker.sh** and others use **v2-engine** or **.tagger**.  
   - **Suggestion:** In the doc or script comments, state: “For ad‑hoc scans use autotagger_launcher (current); for MasterxEo pipeline use v2-engine / .tagger.” Optionally make `current` a wrapper that delegates to v2-engine so one code path stays canonical.

2. **.tagger vs v2-engine**  
   - .tagger is a full copy of v2-style scripts; if you change v2-engine you may want to sync .tagger (or replace .tagger with a symlink to v2-engine) so they don’t drift.

3. **Tool-use log canonical**  
   - Three logs: `.agent_events`, `.mcphooker/tool-usage.jsonl`, `~/.gemini/logs/tool-use.jsonl`.  
   - **Suggestion:** Pick one per context (e.g. “Gemini CLI → .gemini/logs; MCP/custom → .mcphooker”) and note it in this doc or in HOME-ECOSYSTEM-INVENTORY.

4. **autotag_architect and shell commands**  
   - Policies may restrict `run_shell_command` to commands starting with `find`. If the agent should suggest or run `autotag.sh`, either allow those commands in policy or have the agent output the command for you to run (already “heal” behavior).

5. **Python for scripts**  
   - run_autotagger_then_mcphooker and AutoTagger use `python3`. After `brew unlink python@3.14`, ensure the shell that runs them has Python 3.12 (e.g. run from a terminal that loaded .zshrc, or use `run12` for the Python steps).

### Optional improvements

- **mcPHooker:** Add a one-line README in ~/mcPHooker: log location, `MCP_HOOKER_TOOL_LOG`, and how to call `track_tool` / run the hook scripts.
- **AutoTagger:** In ~/AutoTagger, add a README that lists current vs v2 vs .tagger and points to autotagger_launcher and run_autotagger_then_mcphooker.
- **MasterxEo:** Ensure ROOT_INDEX or 07_DOCUMENTATION mentions run_autotagger_then_mcphooker.sh and the AutoTagger/mcPHooker links so future you (or agents) know the pipeline.

---

## 5. Quick reference

| I want to… | Do this |
|------------|--------|
| Log tool use from my code | Import from `~/mcPHooker`, set `MCP_HOOKER_TOOL_LOG` if needed, call `track_tool(...)`. Log: `~/.mcphooker/tool-usage.jsonl`. |
| Run AutoTagger on a folder | `~/scripts/autotagger_launcher.sh <dir> [prefix]` (uses current). Or run v2/.tagger scripts directly for MasterxEo. |
| Run AutoTagger then mcPHooker env on MasterxEo | `run_autotagger_then_mcphooker.sh` from MasterxEo (or source it); ensure MasterxEo root and 07_DOCUMENTATION paths exist. |
| Have the agent reason about tagging | Use **autotag_architect** with task (research/audit/evolve/heal) and optional focus_area. |
| Wire mcPHooker into MasterxEo | Run `~/scripts/integrate_systems.sh` or `verify_integration.sh` so `INTEGRATION_TOOLS/MCPHOOKER/mcphooker_link` exists. |

---

**Summary:** mcPHooker = tool-use logging (source ~/mcPHooker, log ~/.mcphooker). AutoTagger = tagging/indexing (versions in ~/AutoTagger, active copy in ~/.tagger; v2-engine is canonical for MasterxEo). They’re tied together by run_autotagger_then_mcphooker and MasterxEo integration scripts; clarifying “current” vs v2 and one canonical tool log per context will keep things easy to maintain.

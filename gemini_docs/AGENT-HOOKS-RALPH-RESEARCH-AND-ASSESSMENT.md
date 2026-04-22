# Agent Hooks, Ralph, and Extension Assessment

**Scope:** Research agenthooks, custom hooks, tool usage, handoff patterns, and Ralph integration; review `~/.gemini` and extensions for what exists vs. what’s possible; assess `gemini-extension.json` and `SKILL.md` compatibility; identify refactoring and agent implementation opportunities.  
**Date:** 2025-02-08

---

## 1. Gemini CLI hooks (native “agenthooks”)

Gemini CLI provides **hooks** as the built-in way to customize the agentic loop without changing CLI source. They are the closest analogue to “CustomAgentHooks” and event logging in your stack.

### 1.1 Hook events and capabilities

| Event | When | Impact | Use for |
|-------|------|--------|--------|
| **SessionStart** | Startup, resume, clear | Inject context | Event logging init, load context (e.g. using-superpowers) |
| **SessionEnd** | Exit, clear | Advisory | Save state, consolidate logs |
| **BeforeAgent** | After user prompt, before planning | Block turn / inject context | **custom_instructions**: dynamic agent behavior via `additionalContext` |
| **AfterAgent** | After agent loop ends | Retry / halt | Handoff validation, force retry |
| **BeforeModel** | Before LLM request | Block / mock | Modify prompts, swap model |
| **AfterModel** | After LLM response | Block / redact | Log interactions, PII filter |
| **BeforeToolSelection** | Before tool choice | Filter tools | Restrict tool set by intent |
| **BeforeTool** | Before tool runs | Block / rewrite args | **Tool validation**, security (e.g. block secrets) |
| **AfterTool** | After tool runs | Block result / add context | **AgentToolUseTracker**: log tool name, args, result to file/stream |
| **PreCompress** | Before context compression | Advisory | **custom_span**-style: save state, tracing snapshot |
| **Notification** | System alerts | Advisory | Forward to logging / desktop |

**Mechanics:** Hooks are configured in `settings.json` under `hooks.<EventName>`. Each hook is a **command** (script or binary). Communication: **stdin** = JSON input, **stdout** = JSON output only (no stray text), **stderr** = logs. Exit **0** = success (use `decision`, `continue` in JSON); exit **2** = system block. Matchers: regex for tool names (e.g. `write_file|run_shell_command`), exact string for lifecycle (e.g. `startup`).  
Ref: [geminicli.com/docs/hooks](https://geminicli.com/docs/hooks), [hooks reference](https://geminicli.com/docs/hooks/reference).

### 1.2 Mapping your concepts to Gemini hooks

| Your concept | Gemini CLI implementation |
|--------------|----------------------------|
| **CustomAgentHooks (event logging)** | **AfterTool** hook: read `tool_name`, `tool_input`, `tool_response` from stdin; append to `.gemini/logs/tool-use.jsonl` (or similar); return `{}`. Optional **SessionStart** to init log file; **SessionEnd** to flush/rotate. |
| **custom_instructions (dynamic agent behavior)** | **BeforeAgent** hook: return `hookSpecificOutput.additionalContext` with per-turn instructions (e.g. from file or env). Injects into the prompt for that turn only. |
| **function_tool / tool decorators** | Not in hooks. Tools are defined by MCP servers and built-in tools. “Tool definition” = extension’s MCP in `gemini-extension.json` + tool schema from server. |
| **AgentToolUseTracker** | **AfterTool** hook: same as event logging; optionally filter by `matcher` (e.g. `.*` or `run_shell_command|write_file`). Output structured JSONL for later analysis. |
| **Handoff patterns** | **Context handoff:** BeforeAgent `additionalContext` can pass “handoff payload” (e.g. “Previous step output: …”). **Gate logic:** AfterAgent with `decision: "deny"` + `reason` forces retry (handoff back to agent). **Studio → Factory:** Implement via prompt design + BeforeAgent context (e.g. “Mode: factory; canonical spec: …”). |
| **custom_span (tracing)** | **PreCompress** or **AfterModel** hook: append to a trace file (e.g. `session_id`, `timestamp`, `event`, `token_count`). No OpenTelemetry in CLI; “span” = custom log entries. |

---

## 2. Ralph integration

**Ralph** = “verify, not guess” loop: the agent keeps iterating until **external verification** (tests, checks) passes, rather than self-assessing.

- **Ralph Wiggum extension (Gemini CLI):** [AsyncFuncAI/ralph-wiggum-extension](https://github.com/AsyncFuncAI/ralph-wiggum-extension). Commands like `/ralph-loop Build a REST API for todos --max-iterations 20` run an iterative loop with verification.  
- **Integration with your stack:** Install as another extension; use for “build then verify” workflows. No hooks required for basic Ralph; hooks can **log** Ralph iterations (AfterAgent/AfterTool) or **inject context** (BeforeAgent) with last verification result.

**Handoff + Ralph:** “Studio” produces a creative spec → handoff to “Factory” or Ralph loop to implement and verify. BeforeAgent can inject the handoff payload; Ralph extension runs the loop.

---

## 3. What you have today

### 3.1 Settings and hooks

- **`~/.gemini/settings.json`:** general, security, model. **No `hooks` key** — no Gemini CLI hooks are configured.
- **`.gemini/settings.json`:** general (completions), ui, logging. **No `hooks` key.**
- **SupremePower:** `extensions/supremepower/hooks/session-start.sh` implements a **SessionStart**-style script that injects “using-superpowers” content. It is wired for **Claude Code** via `hooks/hooks.json` (uses `CLAUDE_PLUGIN_ROOT`). It is **not** registered in Gemini CLI. So you have a hook script that could be reused for Gemini, but it is not currently active in this environment.

### 3.2 Policies

- **`policies/auto-saved.toml`:** allow `activate_skill`, `write_file`, `run_shell_command` (prefixes: `find`, `python3`, `echo`). Policies are separate from hooks; they gate tool execution at the CLI layer.

### 3.3 Extensions and compatibility

- **gemini-extension.json:** All 18 enabled extensions have a valid `gemini-extension.json` (name, version; many with mcpServers, commands, or contextFileName). **refactor** declares a command but has no TOML (stub). No extension in this set declares **hooks** in its manifest; Gemini merges extension config, so if the CLI supports a `hooks` key in extension manifest, SupremePower (or another) could add one later.
- **SKILL.md:** SupremePower and skill-porter use **SKILL.md**-style skills (name + description in frontmatter; body = instructions). In Gemini CLI, skills are exposed via **commands** that attach `[[context]]` file = `skills/<name>/SKILL.md`. So **SKILL.md is compatible** with Gemini when used as context for slash commands; the “Skill” tool is Claude-specific, but the same content can be injected via context or SessionStart.

### 3.4 Handoff and duality (xeo-grow.md)

- **Handoff/gate logic:** Documented conceptually (creative idea → canonical; Studio vs Factory). Not yet implemented as automation. **Possible implementation:** BeforeAgent hook that reads a “handoff” file or env and injects `additionalContext`; or a small MCP tool that writes/reads handoff state.

---

## 4. What is possible and recommended

### 4.1 Event logging (CustomAgentHooks-style)

- **Add an AfterTool hook** that appends one JSON line per tool call to a file (e.g. `.gemini/logs/tool-use.jsonl`). Script: read stdin (JSON), extract `tool_name`, `tool_input`, `tool_response`, timestamp; append to file; echo `{}`; exit 0.
- **Optional:** SessionStart to ensure log dir exists; SessionEnd to optionally rotate or flush.

### 4.2 Dynamic agent behavior (custom_instructions)

- **BeforeAgent hook** that:
  - Reads a small config or last-output file (e.g. from a previous Ralph step or Studio handoff), or
  - Applies mode (studio/factory) from env or file,
  and returns `hookSpecificOutput.additionalContext` with that instruction set.

### 4.3 AgentToolUseTracker

- Same as event logging: **AfterTool** hook writing to a dedicated JSONL or CSV. Optionally restrict with `matcher` to specific tools. No new extension required; a small script in `.gemini/hooks/` plus a `hooks` entry in `.gemini/settings.json`.

### 4.4 Handoff

- **Lightweight:** BeforeAgent reads `~/.gemini/handoff.txt` (or similar) and injects it as context; another process or agent writes that file when “handing off.”
- **Structured:** MCP tool (e.g. in SupremePower or a tiny extension) `handoff_write` / `handoff_read` so the model can pass state between “agents” or turns.

### 4.5 custom_span (tracing)

- **PreCompress** or **AfterModel** hook that appends to a trace file (session_id, event, timestamp, optional token count from `llm_response.usageMetadata`). Kept minimal to avoid slowing the loop.

### 4.6 SupremePower SessionStart in Gemini

- **Option A:** In **project** `~/.gemini/.gemini/settings.json` (or `~/.gemini/settings.json`), add a `hooks.SessionStart` entry that runs the SupremePower script, e.g.  
  `"command": "$GEMINI_EXTENSION_PATH/supremepower/hooks/session-start.sh"`  
  (if the CLI sets `GEMINI_EXTENSION_PATH` or similar; otherwise use absolute path to extension).  
- **Option B:** Adapt `session-start.sh` for Gemini (remove Claude-only messaging, keep “using-superpowers” injection) and ship a **Gemini** hook config in the extension (if the CLI supports hooks from extensions). Then users get SessionStart injection without editing settings.

---

## 5. Extension compatibility summary

| Extension | gemini-extension.json | SKILL.md / context | Hooks |
|-----------|------------------------|--------------------|-------|
| supremepower | ✅ MCP only | Skills as commands + context file | Has SessionStart script; hooks.json is Claude-only; not registered in Gemini |
| skill-porter | ✅ contextFileName | GEMINI.md | — |
| code-review, gemini-cli-git, my-code-analyzer, etc. | ✅ | GEMINI.md or commands | — |
| refactor | ✅ declares /refactor | No TOML (stub) | — |

**Assessment:** Extensions are compatible with Gemini CLI for MCP and commands. **SKILL.md** is used as context for commands; no conflict. **Hooks** are not yet used in Gemini in your repo; adding them in settings (and optionally in an extension) would unlock logging, dynamic instructions, and handoff.

---

## 6. Refactoring and agent opportunities

### 6.1 Modular agents

- **autotag_architect** and **ecosystem_intelligence** are already modular (TOML agents with clear tools and prompts). **SupremePower** provides MCP-driven “personas” and skills; **core/agents** is empty — adding 1–2 built-in agent `.md` files would make activate_agents useful out of the box.
- **Opportunity:** Split “Studio” vs “Factory” into two Gemini agents or two SupremePower personas, with handoff (file or MCP) between them.

### 6.2 Tool consolidation and tool-use tracking

- **Policies** already restrict which tools can run. **AfterTool** logging would give data on which tools are used most (and where to add guardrails or new tools). No refactor of extensions required; add one hook script.

### 6.3 Ralph for verification-heavy flows

- Add **ralph-wiggum-extension** (or similar) for “implement then verify” tasks. Use **AfterAgent** or **AfterTool** hooks to log iteration count and verification results for measurable improvement (e.g. “tasks completed in &lt; N iterations”).

### 6.4 Measurable improvements

| Goal | Approach | Metric |
|------|----------|--------|
| Automation | BeforeAgent + handoff file or MCP | Number of handoffs automated per session |
| Efficiency | BeforeToolSelection filter to reduce tool noise | Fewer irrelevant tool calls; same task completion |
| Integration | SessionStart inject skills summary; AfterTool log | Time to first useful action; tool-use distribution |
| Tracing | PreCompress/AfterModel trace hook | Trace size and clarity for debugging |

---

## 7. Quick start: enable tool-use logging (AgentToolUseTracker)

A ready-to-use **AfterTool** hook script is at **`~/.gemini/hooks/log-tools.sh`**. It appends one JSON line per tool call to **`~/.gemini/logs/tool-use.jsonl`** (timestamp, tool_name, tool_input, tool_response). **Requires `jq`** on PATH.

To enable it, add a **`hooks`** block to **`~/.gemini/.gemini/settings.json`** (or `~/.gemini/settings.json`), merging with existing keys:

```json
{
  "hooks": {
    "AfterTool": [
      {
        "matcher": ".*",
        "hooks": [
          {
            "name": "tool-use-log",
            "type": "command",
            "command": "bash \"$GEMINI_PROJECT_DIR/hooks/log-tools.sh\"",
            "timeout": 5000
          }
        ]
      }
    ]
  }
}
```

If your settings file is under `~/.gemini` (project root), use `GEMINI_PROJECT_DIR` as above; the CLI sets it. Run `chmod +x ~/.gemini/hooks/log-tools.sh` once. Then use `/hooks panel` to verify and enable the hook.

---

## 8. Recommended next steps

1. **Add the minimal hook config above** in `~/.gemini/settings.json` or `.gemini/settings.json`:  
   - **AfterTool** → script that appends tool name, args, result (or summary) to `.gemini/logs/tool-use.jsonl`.  
   - Implement the script (e.g. `.gemini/hooks/log-tools.sh` or `log-tools.js`) and ensure stdout is JSON-only, stderr for logs.
2. **Optional: BeforeAgent** for dynamic instructions (e.g. read `~/.gemini/mode.txt` or handoff file and inject as `additionalContext`).
3. **Register SupremePower SessionStart for Gemini** if desired: copy or adapt `session-start.sh` for Gemini (paths, no Claude-only messages), add `hooks.SessionStart` in project or user settings pointing at that script.
4. **Evaluate ralph-wiggum-extension** for your workflow; install and use `/ralph-loop` for verify-until-done tasks.
5. **Document handoff format** (e.g. `handoff.txt` schema or MCP tool contract) and implement one lightweight handoff path (file or MCP).
6. **Keep gemini-extension.json and SKILL.md** as the extension contract; add hooks only where they provide clear value (logging, context, safety).

---

## 9. References

- Gemini CLI hooks: [geminicli.com/docs/hooks](https://geminicli.com/docs/hooks), [reference](https://geminicli.com/docs/hooks/reference), [writing hooks](https://geminicli.com/docs/hooks/writing-hooks).
- Ralph: [Ralph Loop with Google ADK](https://medium.com/google-cloud/ralph-loop-with-google-adk-ai-agents-that-verify-not-guess-b41f71c0f30f), [ralph-wiggum-extension](https://github.com/AsyncFuncAI/ralph-wiggum-extension).
- Your docs: `xeo-grow.md` (duality, handoff gate), `docs/AGENTS-EXTENSIONS-POLICIES-REVIEW.md`, `docs/ENABLED-EXTENSIONS.md`, `extensions/supremepower/docs/ARCHITECTURE.md`.

This file can live under `~/.gemini/docs/` and be updated as you add hooks or Ralph integration.

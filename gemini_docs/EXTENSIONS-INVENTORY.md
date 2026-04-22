# Extensions inventory

**Scope:** `~/.gemini/extensions/`  
**Source:** Research of each extension’s `gemini-extension.json` and layout.  
**Date:** 2025-02-08

---

## Summary

| Extension | Version | Type | Context file | Notes |
|-----------|--------|------|--------------|--------|
| ability-dna | 1.0.0 | MCP + command | — | `dna:search`; Python MCP |
| agent-creator | 1.0.0 | Commands | — | `/new-agent`; minimal manifest |
| apify-agent-skills | 1.0.0 | Context | agents/AGENTS.md | Apify agents; no MCP in manifest |
| boring | 15.0.0 | MCP + prompts | — | Large (574+ Python); autonomous dev agent |
| code-review | 0.1.0 | Commands | GEMINI.md | Git-diff code review |
| ComputerUse | 1.0.0 | MCP | GEMINI.md | Browser/computer use (click, type, scroll, etc.) |
| extension-browser | 1.0.0 | MCP | — | Node server; `ext/install` command |
| gemini-cli-git | 0.2.0 | Commands | GEMINI.md | git/commit, commit-push-pr, review, clean-gone |
| gemini-cli-prompt-library | 1.0.0 | Commands | GEMINI.md | Many prompt categories (architecture, testing, docs, etc.) |
| mcp-toolbox | 0.5.0 | MCP | MCP-TOOLBOX.md | Custom tools via toolbox binary |
| mcp-toolbox-for-databases | 0.26.0 | MCP | MCP-TOOLBOX-EXTENSION.md | 30+ datasources; large Go codebase |
| my-code-analyzer | 1.0.0 | Commands | GEMINI.md | /analyze, /security |
| open-aware | 1.0.0 | MCP | gemini-extension/GEMINI.md | Remote MCP URL (Qodo) |
| refactor | 1.0.0 | Commands | — | **Stub:** declares `/refactor` but no commands/ or TOML in repo |
| run-long-command | 1.0.2 | MCP | GEMINI.md | Long-running commands (Node MCP + gemini_tmux.sh) |
| skill-porter | 0.1.0 | Context + excludeTools | GEMINI.md | Claude ↔ Gemini skill porting |
| supremepower | 2.0.0 | MCP | — | Skills & agent framework; Node MCP; postInstall |
| upwork-intelligence | 1.0.0 | MCP + command | — | `upwork:draft`; Python MCP |

---

## By category

### Orchestration / skills / agents

- **supremepower** – Universal skills and agent framework. MCP server (Node), commands for `/sp:*`, `/skills:*`, brainstorm, plan, implement, debug, TDD. **Production** extension; single copy enabled.

### Agent creation & code review

- **agent-creator** – Creates agent TOML files; saves to `~/.gemini/agents/`. Command: `/new-agent`.
- **code-review** – Code review from git diff; uses GEMINI.md.

### Git & workflow

- **gemini-cli-git** – commit, commit-push-pr, review, clean-gone. Uses GEMINI.md.
- **run-long-command** – Long-running commands via MCP and `gemini_tmux.sh`; has dist/ and GEMINI.md.

### Prompts & templates

- **gemini-cli-prompt-library** – Large set of canned prompts (architecture, code-review, debugging, docs, learning, testing, writing). Uses GEMINI.md.

### Analysis & refactor

- **my-code-analyzer** – /analyze, /security. GEMINI.md.
- **refactor** – Declares “Senior Software Architect” and `/refactor` in manifest but **no command TOML or GEMINI.md** in repo (LICENSE only). Either incomplete install or CLI uses built-in prompt.

### MCP / integrations

- **ability-dna** – Semantic discovery for Python libs; command `dna:search`. Python MCP.
- **apify-agent-skills** – Apify agents; context from agents/AGENTS.md; no MCP in manifest.
- **boring** – Autonomous AI dev agent (code gen & verification). Python MCP; very large codebase.
- **ComputerUse** – Browser/OS automation. Bash-run MCP; GEMINI.md.
- **extension-browser** – Node MCP; install extensions. Command: ext/install.
- **mcp-toolbox** – Generic toolbox binary; MCP-TOOLBOX.md.
- **mcp-toolbox-for-databases** – DB tools (30+ sources); Go; MCP-TOOLBOX-EXTENSION.md.
- **open-aware** – Remote MCP at open-aware.qodo.ai; context from gemini-extension/GEMINI.md.
- **upwork-intelligence** – Upwork job matching & proposals; command `upwork:draft`. Python MCP.

### Other

- **skill-porter** – Port skills between Claude Code and Gemini CLI. GEMINI.md; excludes several tools.

---

## Enablement

Enabled set is defined in **`~/.gemini/extensions/extension-enablement.json`**. All 18 extensions above (except “supremepower copy”, which does not exist in this tree) have overrides `["/Users/steven/*"]`. See **docs/ENABLED-EXTENSIONS.md** for the canonical list and intent.

---

## Recommendations

1. **refactor** – Add a real command (e.g. `commands/refactor.toml`) or remove from enabled set if unused; otherwise the declared `/refactor` may not resolve.
2. **boring** – Very large; confirm it’s required for your workflow; consider disabling if not used.
3. **mcp-toolbox-for-databases** – Large Go repo; enable only if you use one of the 30+ DB sources.
4. **Context files** – Several extensions rely on GEMINI.md or other context files; ensure those files exist in each extension directory when using them.

This inventory can be updated when extensions are added, removed, or upgraded.

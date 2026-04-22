# Enabled extensions

**Source of truth:** `~/.gemini/extensions/extension-enablement.json`  
**Scope:** All extensions listed there are enabled for overrides `["/Users/steven/*"]`.  
**Date:** 2025-02-08

---

## Current enabled set (18)

| Extension | Purpose (short) |
|-----------|------------------|
| ability-dna | Semantic discovery for Python libraries |
| agent-creator | Create agent TOML files in `~/.gemini/agents/` |
| apify-agent-skills | Apify agents (scraping, extraction, automation) |
| boring | Autonomous AI dev agent (code gen & verification) |
| code-review | Code review from git diff |
| ComputerUse | Browser/computer automation (click, type, scroll, etc.) |
| extension-browser | Install extensions via MCP |
| gemini-cli-git | Git: commit, commit-push-pr, review, clean-gone |
| gemini-cli-prompt-library | Canned prompts (architecture, testing, docs, etc.) |
| mcp-toolbox | Custom MCP tools via toolbox binary |
| mcp-toolbox-for-databases | MCP for 30+ databases (BigQuery, Postgres, etc.) |
| my-code-analyzer | /analyze, /security |
| open-aware | Remote MCP (Qodo open-aware) |
| refactor | Declared /refactor (see EXTENSIONS-INVENTORY: stub) |
| run-long-command | Long-running commands (tmux) |
| skill-porter | Port skills Claude ↔ Gemini |
| supremepower | Skills & agent framework (production) |
| upwork-intelligence | Upwork proposal drafting |

---

## Manifest reference (by enablement order)

| Extension | Version | Description | Type | Notes |
|-----------|---------|-------------|------|--------|
| **ability-dna** | 1.0.0 | Semantic discovery for custom Python library (Ability DNA) | MCP + command | Command: `dna:search`. Python MCP, stdio. |
| **agent-creator** | 1.0.0 | (no description in manifest) | Commands | `/new-agent`; creates agent TOML in `~/.gemini/agents/`. |
| **apify-agent-skills** | 1.0.0 | Apify Agent Skills: web scraping, data extraction, automation | Context | contextFileName: `agents/AGENTS.md`. No MCP in manifest. |
| **boring** | 15.0.0 | Autonomous AI dev agent for code generation & verification | MCP + prompts | Python MCP `boring.mcp.server`; prompts from `./src/boring/mcp/prompts.py`. |
| **code-review** | 0.1.0 | (no description in manifest) | Commands + context | contextFileName: `GEMINI.md`. Code review from git diff. |
| **ComputerUse** | 1.0.0 | Gemini Computer Use – browse, scroll, click, type, screenshot, pdf | MCP | Bash server `servers/run.sh`; contextFileName: `GEMINI.md`. |
| **extension-browser** | 1.0.0 | (no description in manifest) | MCP | Node `dist/server.js`; install/manage extensions. |
| **gemini-cli-git** | 0.2.0 | (no description in manifest) | Commands + context | contextFileName: `GEMINI.md`. git/commit, commit-push-pr, review, clean-gone. |
| **gemini-cli-prompt-library** | 1.0.0 | (no description in manifest) | Commands + context | contextFileName: `GEMINI.md`. Large prompt set (architecture, testing, docs, etc.). |
| **mcp-toolbox** | 0.5.0 | Load custom tools via MCP Toolbox for Databases | MCP | Binary `toolbox --stdio`; contextFileName: `MCP-TOOLBOX.md`. |
| **mcp-toolbox-for-databases** | 0.26.0 | MCP server for 30+ datasources | MCP | Binary `toolbox --tools-file tools.yaml`; contextFileName: `MCP-TOOLBOX-EXTENSION.md`. |
| **my-code-analyzer** | 1.0.0 | (no description in manifest) | Commands + context | contextFileName: `GEMINI.md`. /analyze, /security. |
| **open-aware** | 1.0.0 | (no description in manifest) | MCP | Remote URL: `https://open-aware.qodo.ai/mcp`; contextFileName: `gemini-extension/GEMINI.md`. |
| **refactor** | 1.0.0 | Senior Software Architect – refactor and modernize code | Commands | Declares `/refactor`; **stub:** no `commands/` TOML in repo (LICENSE only). |
| **run-long-command** | 1.0.2 | (no description in manifest) | MCP + context | Node MCP `dist/run_long_command.js`; contextFileName: `GEMINI.md`; long-running/tmux. |
| **skill-porter** | 0.1.0 | Port skills between Claude Code and Gemini CLI | Context | contextFileName: `GEMINI.md`; excludeTools list. |
| **supremepower** | 2.0.0 | Universal skills and agent framework for coding agents | MCP | Node `mcp-server/dist/server.js`; postInstall: `scripts/install.sh`. |
| **upwork-intelligence** | 1.0.0 | Job matching and proposal drafting for Upwork | MCP + command | Command: `upwork:draft`. Python MCP, stdio. |

---

## Intent

- **One SupremePower:** Only `supremepower` is enabled. There is no “supremepower copy” in the tree or in enablement; use a sandbox copy only for development, not as an enabled extension.
- **Broad coverage:** Git, prompts, code review, agents, MCP (DB, browser, Upwork, Ability DNA, Boring, etc.) are available under `/Users/steven/*`.
- **Disabling:** Remove an entry from `extension-enablement.json` or set its overrides to `[]` to disable. Document any change here or in EXTENSIONS-INVENTORY.md.

See **docs/EXTENSIONS-INVENTORY.md** for full manifest details and recommendations.

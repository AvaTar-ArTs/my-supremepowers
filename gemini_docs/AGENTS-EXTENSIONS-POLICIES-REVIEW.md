# Review: Agents, Extensions, and Policies

**Scope:** `~/.gemini/agents`, `~/.gemini/extensions`, `~/.gemini/policies`  
**Date:** 2025-02-08

---

## 1. Agents (`~/.gemini/agents/`)

### Inventory

| Agent | Purpose | Model | Tools | Notes |
|-------|---------|--------|-------|--------|
| **autotag_architect** | AVATARARTS indexing: research, audit, evolve, heal taxonomy | gemini-2.5-pro | ls, read, grep, glob, read_many_files, memory, web_search | Inputs: `task`, `focus_area`; uses memory for taxonomy history |
| **ecosystem_intelligence** | Digital ecosystem analysis (organization, docs, inter-project) | gemini-2.5-pro | read, grep, glob, ls, memory, web_search | Inputs: `target_path`, `analysis_depth`; structured output `analysis_report` |

### Strengths

- **Clear identity:** Both have distinct display names, icons, and descriptions.
- **Bounded tools:** Only read-oriented tools (no write/shell in agent defs); safe by default.
- **Structured inputs:** Required/optional params and query templates are defined.
- **ecosystem_intelligence** declares an `[output]` (analysis_report), which helps downstream use.

### Recommendations

1. **Overlap with SupremePower:** If you use the **supremepower** extension, it also has “agents” (e.g. frontend-architect, code-reviewer) that are **personas** injected by MCP, not Gemini CLI agents. Your two TOML agents are **invokable agents** in the CLI sense. Keep the mental model: CLI agents = these two; SupremePower = orchestrated personas. No change required unless you want to document this in a README.
2. **autotag_architect inputs:** `focus_area` is optional; for “heal” or “audit” you may want it required or add a default so the agent doesn’t guess.
3. **Naming:** `autotag_architect` and `ecosystem_intelligence` are clear and consistent (snake_case). No change needed.

---

## 2. Policies (`~/.gemini/policies/`)

### Inventory

**File:** `auto-saved.toml`

| Rule | Tool | Decision | Constraint |
|------|------|----------|------------|
| 1 | `activate_skill` | allow | — |
| 2 | `write_file` | allow | — |
| 3 | `run_shell_command` | allow | `commandPrefix = ["find"]` |
| 4 | `run_shell_command` | allow | `commandPrefix = ["python3"]` |
| 5 | `run_shell_command` | allow | `commandPrefix = ["echo"]` |

### Interpretation

- **activate_skill** and **write_file:** Always allowed (priority 100).
- **run_shell_command:** Allowed only when the command starts with `find`, `python3`, or `echo`. Any other shell command (e.g. `npm install`, `ls`, `cd`) falls through to default (typically **ask_user** or **deny**).

### Recommendations

1. **Intent:** Policies intentionally restrict shell to a small allowlist. See `policies/README.md` for current summary.
2. **Priority:** All rules use priority 100. Use higher numbers for stricter overrides if you add more rules.
3. **Extending:** To allow more commands, add rules with the same tool and `commandPrefix`; for broader shell use, consider an `ask_user` rule.

---

## 3. Extensions (`~/.gemini/extensions/`)

### Inventory (by category)

**Orchestration / agents / skills**

- **supremepower** – MCP + commands for skills and agent orchestration (`/sp:*`, `/skills:*`). This is the **production** extension; keep it enabled for daily use.
- **supremepower copy** – **Intentional sandbox** for making improvements without introducing errors into the main extension. Develop and test changes here; when stable, carry them over to `supremepower`. Do not enable as an extension at runtime; it exists for development only.

**Agent creation / code review**

- **agent-creator** – `/new-agent` – Interactive creation of agent TOML files; saves to `~/.gemini/agents/`. Fits well with your two custom agents.
- **code-review** – Code review command (runs `git diff`, reviews changes). High-quality prompt and structure.

**Git / workflow**

- **gemini-cli-git** – Commands: `git/commit`, `git/commit-push-pr`, `git/review`, `git/clean-gone`.
- **run-long-command** – Long-running commands (e.g. via `gemini_tmux.sh`).

**Prompts / templates**

- **gemini-cli-prompt-library** – Many commands (architecture, code-review, debugging, docs, learning, testing, writing). Rich set of canned prompts.

**Analysis / tooling**

- **my-code-analyzer** – `/analyze`, `/security` – Code analysis and security prompts (English).
- **code-review** – (see above.)

**MCP / integrations**

- **ability-dna**, **apify-agent-skills**, **mcp-toolbox**, **mcp-toolbox-for-databases** (large Go codebase), **ollama-hydra**, **open-aware**, **upwork-intelligence** – Various MCP servers and integrations.

**Other**

- **boring** – Very large (574+ Python files). Purpose unclear from name; verify if still needed.
- **ComputerUse** – Commands/tools (e.g. computer use).
- **extension-browser** – `ext/install` (extension install).
- **refactor**, **skill-porter** – Refactoring and skill porting.

### Strengths

- Broad coverage: agents, git, prompts, code review, MCP.
- **agent-creator** aligns with maintaining `~/.gemini/agents/`.
- **supremepower** (non-copy) is the single runtime copy for orchestration.

### Recommendations

1. **SupremePower:** Use only **supremepower** in production. **supremepower copy** is an intentional improvement sandbox (develop and test there, then port changes to `supremepower`); do not enable the copy as an extension so the CLI doesn’t load both.
2. **Enabled set:** There is no `config.json` under `~/.gemini/` in this tree, so which extensions are “on” cannot be inferred from the repo. Document or maintain a list (e.g. in this doc or a `docs/ENABLED-EXTENSIONS.md`) so you know what you rely on.
3. **Large extensions:** **boring** and **mcp-toolbox-for-databases** are large. Confirm they’re required; if not, disabling or removing them can simplify the environment.
4. **my-code-analyzer:** Prompts and GEMINI.md are in English (previously Korean; updated). 

---

## 4. Cross-cutting

### Agents ↔ Extensions

- Your two agents don’t depend on any specific extension; they use built-in tools (read, grep, glob, etc.).
- **SupremePower** adds MCP-driven personas; they complement rather than replace your CLI agents.

### Policies ↔ Tools

- **Policies** only allow `run_shell_command` when the command starts with `find`. Agents that need other shell commands (e.g. for “heal” in autotag_architect) would hit policy and likely get **ask_user** or **deny**. If autotag_architect is meant to suggest or run `autotag.sh` or similar, either:
  - Add a policy rule that allows (or asks for) those specific commands, or
  - Keep shell restricted and have the agent output suggested commands for you to run manually.

### Suggested next steps

1. ~~Confirm policy intent~~ Documented in `policies/README.md`; current allowlist: find, python3, echo (+ write_file, activate_skill).
2. ~~Document enabled extensions~~ See **docs/ENABLED-EXTENSIONS.md** and **docs/EXTENSIONS-INVENTORY.md** for the full set and manifest details.
3. **refactor** extension: Add command TOML or disable if unused (see supremepower/docs/IMPROVEMENTS.md).

---

## Summary table

| Area | Status | Action |
|------|--------|--------|
| Agents | ✅ Clear, 2 well-defined | Optional: make autotag `focus_area` required or default |
| Policies | ✅ Documented | allow: find, python3, echo, write_file, activate_skill; see policies/README.md |
| Extensions | ✅ Many useful | Use only one SupremePower; document enabled set; review large/unused |
| Agents vs extensions | ✅ No conflict | Optional: document CLI agents vs SupremePower personas |
| Policies vs agents | ⚠️ Restrictive shell | Align with autotag_architect if it should suggest/run commands |

This file can live under `~/.gemini/docs/` and be updated as agents, extensions, or policies change.

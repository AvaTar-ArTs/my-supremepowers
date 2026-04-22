# SupremePower – Architecture (advanced analysis)

**Generated:** 2025-02-08 from codebase analysis (Serena, grep, read). Use this to reason about changes and onboarding.

---

## 1. High-level flow

```
Gemini CLI
    │
    ├── Commands (slash) ──► commands/*.toml, commands/skills/*.toml, commands/sp/*.toml
    │       │
    │       └── [[context]] type="file" path="skills/<name>/SKILL.md"  (relative to extension root)
    │
    └── MCP server (node mcp-server/dist/server.js)
            │
            └── Tools: activate_agents, get_agent_persona, list_skills, fetch_skills, auto_agent_create
                    │
                    ├── activate_agents ──► core/orchestration (analyzeSkillAndActivateAgents)
                    │       + lib/agent-loader.js (loadAgentDefinitions from core/agents + ~/.supremepower/agents)
                    │       + persona-injector (format personas for context)
                    ├── list_skills ──► lib/skills-core.js (findSkillsInDir on core/skills + ~/.supremepower/skills)
                    ├── get_agent_persona ──► reads <agentName>.md from agents paths
                    ├── fetch_skills ──► clone repo, copy to custom skills dir
                    └── auto_agent_create ──► generate agent from description
```

- **Commands** are prompt + optional file context; they do not call MCP by themselves. The model may call MCP tools when it chooses (e.g. `/sp:agents` prompt says "list agents" and the model can call `list_skills`).
- **MCP** is the only place that runs orchestration (agent selection, persona formatting) and skill/agent discovery. Config is `~/.supremepower/config.json` (created by install.sh if missing).

---

## 2. Key paths (extension root = `${extensionPath}`)

| Purpose | Path | Notes |
|--------|------|--------|
| **Built-in skills (MCP)** | `core/skills/` | findSkillsInDir(builtInPath, 'built-in'); each skill dir has SKILL.md |
| **Built-in agents (MCP)** | `core/agents/` | loadAgentDefinitions(); expects `.md` files with YAML frontmatter (name, expertise, activation_keywords). **Currently only .gitkeep – no built-in agents.** |
| **Command context (Gemini)** | `skills/` | Commands use `path = "skills/<name>/SKILL.md"`; 14 skills here (duplicate of core/skills content). |
| **User config** | `~/.supremepower/config.json` | version, orchestration, skills.customSkillsPath, agents.customAgentsPath, display, wrapper. |
| **User agents** | `~/.supremepower/agents/` | Custom `*.md` agent files (same frontmatter as core/agents). |
| **User skills** | `~/.supremepower/skills/` | Custom skill dirs with SKILL.md. |
| **MCP server entry** | `mcp-server/src/server.ts` | Builds to `mcp-server/dist/server.js`; cwd at runtime = extension root. |

---

## 3. Orchestration (Phase 1)

- **Entry:** `activate_agents` MCP tool.
- **Steps:**  
  1. Load agents: `core/agents` + optional `~/.supremepower/agents` via `lib/agent-loader.js` (parseAgentFrontmatter, loadAgentDefinitions).  
  2. If `forceAgents` provided → use those; else run `analyzeSkillAndActivateAgents(skillContent, userMessage, agents)` from `core/orchestration/index.js`.  
  3. Orchestration: `context-parser.js` (hints), `conditional-evaluator.js` (conditionals), `agent-matcher.js` (scoreAndSelectAgents). Score threshold > 8 to activate.  
  4. If no agents activated (e.g. empty skill content), fallback: keyword match of `userMessage` against each agent’s `keywords`.  
  5. Format personas with `persona-injector.ts` (full/minimal from config) and return as MCP text result.

- **Agent frontmatter (YAML):** `name`, `expertise` (array), `activation_keywords` (array), optional `complexity_threshold`. agent-loader exposes `keywords` = `activation_keywords`.

---

## 4. Skills discovery

- **list_skills:** `findSkillsInDir(core/skills, 'built-in')` and optionally `findSkillsInDir(customSkillsPath, 'custom')`. Returns name, description, path, sourceType. Formatted as markdown.
- **Skill layout:** Each skill is a directory with `SKILL.md`; frontmatter has `name`, `description`. skills-core also has resolveSkillToPath, etc., for resolving a skill name to a file.

---

## 5. Command layout (Gemini)

- **Top-level:** `brainstorm.toml`, `plan.toml`, `implement.toml`, `debug.toml`, `tdd.toml` – prompt + `[[context]]` file = `skills/<name>/SKILL.md`.  
- **commands/skills/*.toml:** One per skill (e.g. brainstorming, test-driven-development); same pattern.  
- **commands/sp/*.toml:** `agents.toml`, `analyze.toml`, `config.toml`, `status.toml`, `with.toml`, `auto-agent-create.toml` – prompts that imply use of MCP tools (e.g. “list agents” → list_skills).  

- **Generation:** `scripts/generate-commands.js` can generate TOML from `skills/` dirs (reads SKILL.md frontmatter, writes to `commands/skills/`). Current repo has both hand-maintained and possibly generated TOMLs.

---

## 6. Config (defaults from config.ts + install.sh)

- **orchestration:** agentActivationThreshold (8), detectionSensitivity, fallbackToLLM, maxAgentsPerRequest.  
- **skills:** exposureMode ('commands'), generateAliases, customSkillsPath ('~/.supremepower/skills').  
- **agents:** customAgentsPath ('~/.supremepower/agents'), personaDetail ('full'|'minimal'), autoCreate (enabled, confirmBeforeSave, template).  
- **display:** showActivatedAgents, verbose, logPath.  
- **wrapper:** enabled, complexity (minWordCount, requireKeywords, checkCodeBlocks).  

Config path: `process.env.SUPREMEPOWER_CONFIG_PATH` or `~/.supremepower/config.json`. Missing file → create with defaults.

---

## 7. Dependencies and build

- **package.json:** main = `mcp-server/dist/server.js`; build = `tsc`; scripts: generate:commands (node scripts/generate-commands.js).  
- **MCP:** @modelcontextprotocol/sdk, zod. TypeScript under mcp-server/src (server.ts, tools/*.ts, lib/*.ts).  
- **Runtime:** Gemini runs `node mcp-server/dist/server.js` with cwd = extension path; no separate adapter process – adapters/gemini-cli is a placeholder (.gitkeep).

---

## 8. Gaps and risks

1. **core/agents is empty** – No built-in agent `.md` files; only `.gitkeep`. So `activate_agents` only uses custom agents from `~/.supremepower/agents`. If users never add agents, orchestration always returns empty and fallback keyword match has nothing to match. **Suggestion:** Add at least one sample agent or document that users must add agents for persona injection.  
2. **Duplicate skills trees** – `skills/` and `core/skills/` both contain the same 14 SKILL.md skills. Commands reference `skills/`; MCP list_skills uses `core/skills`. Keep in sync or make one canonical (e.g. symlink or single tree).  
3. **Path resolution** – Command `[[context]] path="skills/..."` is relative to extension root; confirm Gemini CLI resolves it to this extension’s root.  
4. **adapter gemini-cli** – Empty (only .gitkeep). Integration is “MCP server + commands” only; no adapter-specific code.

---

## 9. File map (source of truth for orchestration and MCP)

| File | Role |
|------|------|
| mcp-server/src/server.ts | Creates MCP server, registers 5 tools, stdio transport. |
| mcp-server/src/tools/activate-agents.ts | Load agents, run orchestration or keyword fallback, format personas. |
| mcp-server/src/tools/list-skills.ts | findSkillsInDir(built-in + custom), return markdown. |
| mcp-server/src/tools/get-agent-persona.ts | Read agent .md from custom then built-in path. |
| mcp-server/src/tools/fetch-skills.ts | Clone repo, copy skills to custom dir. |
| mcp-server/src/tools/auto-agent-create.ts | Generate new agent from description. |
| mcp-server/src/lib/config.ts | loadConfig, saveConfig, validateConfig (zod), default config. |
| mcp-server/src/lib/persona-injector.ts | formatPersonas(agents, full\|minimal). |
| mcp-server/src/lib/logger.ts | logOrchestration, logError. |
| mcp-server/src/lib/detection.ts | detectComplexity(message) – keywords, length, code blocks. |
| core/orchestration/index.js | analyzeSkillAndActivateAgents(skillContent, userMessage, agents). |
| core/orchestration/context-parser.js | extractContextHints(skillContent). |
| core/orchestration/conditional-evaluator.js | extractConditionalBlocks(skillContent). |
| core/orchestration/agent-matcher.js | scoreAndSelectAgents(hints, conditionals, userMessage, agents); threshold > 8. |
| lib/agent-loader.js | parseAgentFrontmatter, loadAgentDefinitions(agentsDir). |
| lib/skills-core.js | findSkillsInDir, extractFrontmatter, resolveSkillToPath, etc. |
| lib/index.js | Re-exports orchestration + agent-loader. |

This document can be updated when adding tools, changing paths, or refactoring orchestration.

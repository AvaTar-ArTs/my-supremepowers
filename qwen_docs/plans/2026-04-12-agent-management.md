# Agent Management Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Clean up, standardize, and index all 43 agents in ~/.qwen/agents/ after merging from agents-from-cursor.

**Architecture:** Single flat-file agents directory with consistent `<name>.md` format, backed by a registry index. Remove obsolete source directory, clean up empty skill-triggering dir.

**Tech Stack:** Bash for file operations, Markdown for registry index.

---

### Task 1: Delete agents-from-cursor/ directory

**Files:**
- Delete: `/Users/steven/.qwen/agents-from-cursor/` (entire directory, 25 files, 176 KB)

**Rationale:** All 16 unique agents merged into `agents/` in previous cleanup session. SUBAGENTS_GUIDE.md and SUBAGENT_QUICK_REFERENCE.md also copied to `agents/`. This directory is now dead weight.

**Command:**
```bash
rm -rf /Users/steven/.qwen/agents-from-cursor/
echo "✅ agents-from-cursor/ deleted (176 KB freed)"
```

**Verification:** `ls /Users/steven/.qwen/agents-from-cursor/` → "No such file or directory"

**Commit:**
```bash
git rm -rf agents-from-cursor/
git commit -m "cleanup: remove agents-from-cursor/ after merge into agents/"
```

---

### Task 2: Delete empty superpowers/skill-triggering/ directory

**Files:**
- Delete: `/Users/steven/.qwen/superpowers/skills/skill-triggering/` (empty directory, no SKILL.md)

**Rationale:** Directory exists but has no SKILL.md file — creates dead symlink in `skills/superpowers-skill-triggering`. Should be removed to prevent broken symlink.

**Command:**
```bash
rm -rf /Users/steven/.qwen/superpowers/skills/skill-triggering/
echo "✅ superpowers/skills/skill-triggering/ deleted"
```

**Verification:** `ls /Users/steven/.qwen/superpowers/skills/skill-triggering/` → "No such file or directory"

**Commit:**
```bash
git rm -rf superpowers/skills/skill-triggering/
git commit -m "cleanup: remove empty skill-triggering/ directory"
```

---

### Task 3: Delete the orphaned symlink for skill-triggering

**Files:**
- Delete: `/Users/steven/.qwen/skills/superpowers-skill-triggering` (broken symlink)

**Rationale:** Points to deleted `superpowers/skills/skill-triggering/`. Broken symlink serves no purpose.

**Command:**
```bash
rm -f /Users/steven/.qwen/skills/superpowers-skill-triggering
echo "✅ Broken symlink deleted"
```

**Verification:** `ls -la /Users/steven/.qwen/skills/superpowers-skill-triggering` → "No such file or directory"

**Commit:**
```bash
git rm skills/superpowers-skill-triggering
git commit -m "cleanup: remove broken symlink for skill-triggering"
```

---

### Task 4: Create agent registry index

**Files:**
- Create: `/Users/steven/.qwen/agents/REGISTRY.md`

**Content:** Complete index of all 43 agents organized by category, with descriptions and file paths.

```markdown
# Qwen Agent Registry

**Last Updated:** 2026-04-12
**Total Agents:** 43 (20 subdirectory-based + 23 flat-file)

## Specialist Agents (from Supremepower, adapted)

| Agent | Format | Purpose |
|-------|--------|---------|
| api-specialist | `api-specialist/agent.md` | API design and integration |
| backend-architect | `backend-architect/agent.md` | Backend systems architecture |
| database-specialist | `database-specialist/agent.md` | Database design and optimization |
| devops-engineer | `devops-engineer/agent.md` | CI/CD, infrastructure, cloud |
| frontend-architect | `frontend-architect/agent.md` | Frontend architecture and UX |
| javascript-expert | `javascript-expert/agent.md` | JavaScript/TypeScript expertise |
| performance-engineer | `performance-engineer/agent.md` | Performance optimization |
| python-expert | `python-expert/agent.md` | Python expertise |
| security-engineer | `security-engineer/agent.md` | Security engineering |
| system-architect | `system-architect/agent.md` | System architecture design |
| technical-writer | `technical-writer/agent.md` | Technical documentation |
| testing-specialist | `testing-specialist/agent.md` | Testing methodology |

## Project Agents (Qwen-native)

| Agent | Format | Purpose |
|-------|--------|---------|
| ice-tracker-assistant | `ice-tracker-assistant/agent.md` | ICE Tracker project assistant |
| git-ai-agent | `git-ai-agent.sh` | Git AI integration script |

## Domain Expertise Agents (from Cursor, evolved)

| Agent | Format | Purpose |
|-------|--------|---------|
| ai-music-video-creator | `ai-music-video-creator.md` | AI music/video content |
| ai-workflow-manager | `ai-workflow-manager.md` | AI workflow orchestration |
| ai-xeo | `ai-xeo.md` | XEO AI agent |
| avatararts-organizer | `avatararts-organizer.md` | AvatarArts content organization |
| bots | `bots.md` | Bot management |
| content-consolidator | `content-consolidator.md` | Content consolidation |
| content-organizer | `content-organizer.md` | Content organization |
| context-handoff-compiler | `context-handoff-compiler.md` | Context compilation for handoffs |
| context-management | `context-management/agent.md` | Context window management |
| documentation | `documentation/agent.md` | Documentation generation |
| documentation-manager | `documentation-manager.md` | Documentation management |
| ecosystem-analyzer | `ecosystem-analyzer.md` | Ecosystem analysis |
| ecosystem-learning | `ecosystem-learning/agent.md` | Cross-ecosystem learning |
| ecosystem-synergy | `ecosystem-synergy/agent.md` | Cross-ecosystem coordination |
| filesystem-inventory | `filesystem-inventory.md` | Filesystem inventory |
| integrated-evolution | `integrated-evolution/agent.md` | Self-evolution coordination |
| knowledge-automation-strategist | `knowledge-automation-strategist.md` | Knowledge management |
| notebooklm-enhancement-advisor | `notebooklm-enhancement-advisor.md` | NotebookLM optimization |
| path-list-analyzer | `path-list-analyzer.md` | Path list analysis |
| project-launch-manager | `project-launch-manager.md` | Project launch coordination |
| revenue-optimizer | `revenue-optimizer.md` | Revenue optimization |
| self-evolution | `self-evolution/agent.md` | Self-improvement |
| self-evolution-plan | `self-evolution-plan.md` | Self-evolution roadmap |
| seo-keyword-analyst | `seo-keyword-analyst.md` | SEO keyword analysis |
| system-analyzer | `system-analyzer.md` | System analysis |
| task-management | `task-management/agent.md` | Task orchestration |
| tree-explorer | `tree-explorer.md` | Tree exploration |
| xeo-strategist | `xeo-strategist.md` | XEO strategy |

## Reference Documents

| Document | Purpose |
|----------|---------|
| SUBAGENTS_GUIDE.md | Comprehensive subagent usage guide |
| SUBAGENT_QUICK_REFERENCE.md | Quick reference for subagents |

## Format Conventions

- **Subdirectory format:** `<name>/agent.md` — used for agents with potential for expansion (multiple files, references, etc.)
- **Flat-file format:** `<name>.md` — used for standalone agent definitions

**Total:** 20 subdirectory-based + 23 flat-file = 43 agents
```

**Commit:**
```bash
git add agents/REGISTRY.md
git commit -m "docs: add agent registry index for all 43 agents"
```

---

### Task 5: Verify final agent count and cleanup status

**Files to check:**
- `/Users/steven/.qwen/agents/` — should have 43 agent files + 2 reference docs + REGISTRY.md = 46 files
- `/Users/steven/.qwen/skills/superpowers-skill-triggering` — should NOT exist
- `/Users/steven/.qwen/superpowers/skills/skill-triggering/` — should NOT exist
- `/Users/steven/.qwen/agents-from-cursor/` — should NOT exist

**Verification commands:**
```bash
echo "=== Agent count ==="
ls -1 /Users/steven/.qwen/agents/ | wc -l

echo "=== Verify orphans removed ==="
test -d /Users/steven/.qwen/agents-from-cursor && echo "FAIL: still exists" || echo "✅ agents-from-cursor/ gone"
test -d /Users/steven/.qwen/superpowers/skills/skill-triggering && echo "FAIL: still exists" || echo "✅ skill-triggering/ gone"
test -L /Users/steven/.qwen/skills/superpowers-skill-triggering && echo "FAIL: still exists" || echo "✅ broken symlink gone"

echo "=== Final ~/.qwen size ==="
du -sh /Users/steven/.qwen/
```

**Commit:**
```bash
git add -A
git commit -m "cleanup: verify final state — 43 agents, no orphans"
```

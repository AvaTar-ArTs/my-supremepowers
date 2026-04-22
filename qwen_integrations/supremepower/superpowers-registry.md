# Qwen Superpowers Registry

> Generated from ~/.qwen/superpowers/skills/ — adapted from supremepower generate-commands.js
> Last updated: 2026-04-14

## All 16 Superpowers Skills

### superpowers:brainstorming
**Description:** You MUST use this before any creative work — creating features, building components, adding functionality, or modifying behavior. Explores user intent, requirements and design before implementation.
**Trigger:** Before ANY creative/feature/component work
**Mandatory:** YES — don't skip for any reason
**Supporting files:** None

### superpowers:writing-plans
**Description:** After brainstorming approval, create detailed implementation plans with bite-sized tasks and verification criteria.
**Trigger:** After design approved, before implementation
**Mandatory:** YES for multi-step work
**Supporting files:** None

### superpowers:executing-plans
**Description:** Execute implementation plans with verification at each step.
**Trigger:** When following a written plan
**Mandatory:** When plan exists
**Supporting files:** None

### superpowers:test-driven-development
**Description:** RED → GREEN → REFACTOR cycle. Write failing test first, minimal code to pass, then clean up.
**Trigger:** When writing any code
**Mandatory:** YES — don't write code without tests
**Supporting files:** `testing-anti-patterns.md`

### superpowers:systematic-debugging
**Description:** 4-phase root cause analysis: reproduce, isolate, fix, verify. Never guess at fixes.
**Trigger:** When debugging ANY issue
**Mandatory:** YES — don't skip to fixing
**Supporting files:** `root-cause-tracing.md`, `defense-in-depth.md`, `condition-based-waiting.md`, `find-polluter.sh`, `condition-based-waiting-example.ts`, `test-pressure-1/2/3.md`, `test-academic.md`, `CREATION-LOG.md`

### superpowers:subagent-driven-development
**Description:** Per-task subagent dispatch with 2-stage review (spec reviewer + code quality reviewer).
**Trigger:** When plan has independent tasks
**Mandatory:** When using subagent approach
**Supporting files:** `spec-reviewer-prompt.md`, `implementer-prompt.md`, `code-quality-reviewer-prompt.md`, `run-test.sh`, `go-fractals/` (design.md, plan.md, scaffold.sh), `svelte-todo/` (design.md, plan.md, scaffold.sh)

### superpowers:dispatching-parallel-agents
**Description:** Concurrent subagent workflows for independent tasks.
**Trigger:** When 2+ tasks can run in parallel
**Mandatory:** When tasks are independent
**Supporting files:** None

### superpowers:verification-before-completion
**Description:** Verify before declaring done. Run tests, check requirements, validate behavior.
**Trigger:** Before claiming task complete
**Mandatory:** YES — never claim done without evidence
**Supporting files:** None

### superpowers:requesting-code-review
**Description:** Pre-review checklist before requesting review. Ensure plan alignment, test coverage, quality.
**Trigger:** After major project step
**Mandatory:** When requesting review
**Supporting files:** `code-reviewer.md`

### superpowers:receiving-code-review
**Description:** Responding to review feedback systematically. Address issues, confirm fixes.
**Trigger:** After receiving code review
**Mandatory:** When receiving feedback
**Supporting files:** None

### superpowers:finishing-a-development-branch
**Description:** Merge/PR decision workflow. Verify tests, merge/PR/keep/discard branch.
**Trigger:** When completing development cycle
**Mandatory:** When finishing work
**Supporting files:** None

### superpowers:using-git-worktrees
**Description:** Create isolated workspace for implementation. Parallel development branches.
**Trigger:** When starting isolated implementation
**Mandatory:** When worktree needed
**Supporting files:** None

### superpowers:using-superpowers
**Description:** Introduction to the superpowers system. How to use skills, when to apply them.
**Trigger:** On session start (bootstrap), or when user asks about superpowers
**Mandatory:** First session only
**Supporting files:** None

### superpowers:writing-skills
**Description:** Create/test new skills. Pressure-test with subagents in realistic scenarios.
**Trigger:** When creating or improving skills
**Mandatory:** When authoring skills
**Supporting files:** `anthropic-best-practices.md`, `persuasion-principles.md`, `render-graphs.js`, `graphviz-conventions.dot`, `testing-skills-with-subagents.md`, `examples/`

### superpowers:workflow-bootstrap
**Description:** Initial setup and capability discovery for new projects.
**Trigger:** Starting new project context
**Mandatory:** When project is new
**Supporting files:** None

### superpowers:ecosystem-clarity
**Description:** Single reference for how Supremepower/Cursor skills, agents, and the multi-ecosystem map fit together.
**Trigger:** When coordinating across Qwen/Gemini/Codex/Cursor
**Mandatory:** When ecosystem questions arise
**Supporting files:** None

---

## Qwen Tool Mapping

Supremepower skills were designed for Claude Code. Here's the Qwen equivalent:

| Claude Code Tool | Qwen Equivalent | Notes |
|------------------|-----------------|-------|
| `TodoWrite` | `todo_write` | Same functionality |
| `Task` (subagent) | `agent` tool | Use `subagent_type` parameter |
| `Skill` | `skill` tool | Same invocation pattern |
| `Bash` | `run_shell_command` | Same, with `is_background` option |
| `Read` | `read_file` | Same |
| `Write` | `write_file`, `edit` | Split into write/edit |
| `Grep` | `grep_search` | Same |
| `Glob` | `glob` | Same |
| `WebFetch` | `web_fetch` | Same |
| `WebSearch` | `web_search` | Same |

## Workflow Chain

```
Session Start → using-superpowers → workflow-bootstrap
  ↓
New Feature → brainstorming → writing-plans → executing-plans
  ↓
Code Writing → test-driven-development (RED→GREEN→REFACTOR)
  ↓
Parallel Tasks → dispatching-parallel-agents
  ↓
Bug Found → systematic-debugging (reproduce→isolate→fix→verify)
  ↓
Step Complete → requesting/receiving-code-review
  ↓
Before Done → verification-before-completion
  ↓
Finish → finishing-a-development-branch
```

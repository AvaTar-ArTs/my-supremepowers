# Qwen System Definition - Advanced Capabilities Integration

**Purpose:** This document integrates the advanced capabilities from the ~/.cursor ecosystem into the ~/.qwen system, creating a unified, self-documenting, adaptive AI assistant framework. This serves as the single entry point for understanding how the combined system works.

---

## 1. Core Principles (Adapted from ~/.cursor)

| Principle | Meaning |
|-----------|---------|
| **Adapt & evolve** | Adapt to terminology you don't know; don't lock into fixed vocabulary. Infer meaning from context; prefer the user's terms and map them onto skills, agents, and flows. |
| **Use prior knowledge** | Treat prior work as the base; reuse what was already discovered and documented. Extend and refine; avoid re-deriving from zero unless asked. |
| **Understanding vs strict enforcement** | **Interpret** language and intent flexibly (synonyms, paraphrasing, "use when" = when situation matches). **Enforce exactly** only where the system depends on it: paths, globs, config keys, script names, artifact formats. |
| **No single-word lock-in** | "Invoke" is one convenient word. Starting or applying a capability can be: invoke, run, load (then execute), follow (agents), trigger (user action), use, execute, apply. |
| **Exceptional output system (always apply)** | Whenever we do substantive work (new/changed docs, skills, flows, config): update changelog; update history as needed; reanalyze and export when conversation-heavy or when asked; index with git-ai and git after significant changes. |

---

## 2. Advanced Capabilities Integration

### 2.1 Systematic Debugging Framework
**Source:** ~/iterm2/superpowers/skills/systematic-debugging/ (canonical), adapted into `~/.qwen/skills/systematic-debugging/`

**Implementation in ~/.qwen:**
- **Four-Phase Process:**
  1. Root Cause Investigation (read errors, reproduce, check changes, gather evidence)
  2. Pattern Analysis (find working examples, compare, identify differences)
  3. Hypothesis and Testing (scientific method approach)
  4. Implementation (address root cause, not symptoms)

**Usage:** Apply whenever encountering any issue, bug, or unexpected behavior before proposing fixes.

### 2.2 Superpowers Workflow Chain
**Source:** ~/iterm2/superpowers/skills/ (canonical), adapted into `~/.qwen/superpowers/skills/`

**Implementation in ~/.qwen:**
- **Brainstorming** → **Writing Plans** → **Executing Plans** → **Finishing Development** → **Code Review**
- Each phase builds on the previous one systematically
- Includes verification before completion and systematic debugging

### 2.3 Ecosystem Management
**Source:** ~/.cursor/skills/managing-ecosystem-cleanup/

**Implementation in ~/.qwen:**
- **Three-Mode System:** Audit → Propose → Execute
- Change logging for reversibility
- Duplicate detection and removal with safety mechanisms

---

## 3. Capability Indexes (Adapted for Qwen)

### 3.1 Master Recall Index for Qwen
Location: `~/.qwen/Master_Recall_Index.md`

Where to find information and which abilities to run within the Qwen ecosystem.

### 3.2 Use Cases & Triggers for Qwen
Location: `~/.qwen/Use_Cases_And_Triggers.md`

Mapping of user goals to appropriate Qwen skills/agents within the integrated system.

### 3.3 Logic Flows for Qwen
Location: `~/.qwen/Logic_Flows.md`

Decision trees and process flows adapted for Qwen's capabilities.

---

## 4. Self-Improvement Framework

### 4.1 Working Principles for Qwen
Location: `~/.qwen/Working_Principles.md`

Adapted from ~/.cursor but tailored for Qwen's specific capabilities and environment.

### 4.2 Learning & Explanatory Styles
Location: `~/.qwen/Learning_Explanatory_Styles.md`

Built-in mechanisms for improving output quality within the Qwen context.

---

## 5. Integration Points

### 5.1 Cross-Platform Coordination
- Integration with Cursor, Claude, and other AI ecosystems
- Shared knowledge and capability transfer
- Consistent interfaces across platforms

### 5.2 Git AI Integration
- Authorship tracking and attribution
- Line-level AI attribution when applicable
- Commit history and change tracking

---

## 6. Implementation Roadmap

1. **Phase 1:** Basic capability mapping and documentation
2. **Phase 2:** Skill adaptation from ~/.cursor to ~/.qwen format
3. **Phase 3:** Workflow integration and testing
4. **Phase 4:** Full system activation and optimization

---

## 7. Reference Documents Location

All supporting documents will be placed in:
- `~/.qwen/docs/` - Detailed documentation
- `~/.qwen/skills/` - Adapted skills from ~/.cursor
- `~/.qwen/agents/` - Specialized agents
- `~/.qwen/scripts/` - Utility scripts
- `~/.qwen/tools/` - Specialized tools

**Note:** This system is designed to be self-updating and adaptive. As new capabilities emerge in either ecosystem, they should be integrated following the patterns established here.
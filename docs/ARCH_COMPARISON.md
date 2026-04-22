# Architectural Comparison: `~/.qwen` vs. `~/.gemini` vs. `~/my-supremepowers`

This document provides a detailed comparison of the directory structures and identified components across the source `~/.qwen` and `~/.gemini` environments, and the consolidated `~/my-supremepowers` hub. The goal is to understand the consolidation strategy and highlight the origins of various framework elements.

## Table of Contents

- [Overview](#overview)
- [Consolidation Strategy](#consolidation-strategy)
- [Detailed Component Comparison](#detailed-component-comparison)
  - [Agents](#agents)
  - [Skills](#skills)
  - [Rules](#rules)
  - [Scripts](#scripts)
  - [Policies](#policies)
  - [Hooks](#hooks)
  - [Core Framework Elements](#core-framework-elements)
  - [Other Notable Files/Directories](#other-notable-filesdirectories)
- [Summary of Consolidation](#summary-of-consolidation)

---

## Overview

The `~/my-supremepowers` directory represents a unified environment, merging functionalities and components originally housed in `~/.qwen` and `~/.gemini`. This comparison aims to clarify how these disparate sources contribute to the consolidated framework.

---

## Consolidation Strategy

The primary consolidation strategy appears to be a combination of:
1.  **Direct Copy/Merge:** Many directories and files from `~/.gemini` and `~/.qwen` have been directly copied or their contents merged into corresponding directories in `~/my-supremepowers`.
2.  **Dedicated Qwen Directories:** Specific Qwen-originated components (agents, skills) have been placed in dedicated `qwen_agents` and `qwen_skills` directories within `~/my-supremepowers`, maintaining their distinct identity.
3.  **Renaming/Adaptation:** Some files might have been renamed (e.g., `qwen_rules_superpowers.md` suggests an adaptation of a Qwen rule).

---

## Detailed Component Comparison

### Agents

*   **`~/.qwen/agents/`:** Contains numerous agent definitions (e.g., `avatararts-organizer.md`, `revenue-optimizer.md`).
*   **`~/.gemini/agents/`:** Contains Gemini CLI custom agents (e.g., `autotag_architect.toml`, `ecosystem_intelligence.toml`).
*   **`~/my-supremepowers/agents/`:** Contains Gemini CLI agents (e.g., `autotag_architect.toml`) and potentially a `code-reviewer.md`.
*   **`~/my-supremepowers/qwen_agents/`:** Dedicated directory for Qwen agents, likely mirroring `~/.qwen/agents/`.
*   **Consolidation:** `~/.gemini/agents/` content appears to be directly copied to `~/my-supremepowers/agents/`. `~/.qwen/agents/` content is placed in `~/my-supremepowers/qwen_agents/`.

### Skills

*   **`~/.qwen/skills/`:** Contains Qwen-specific skills (e.g., `superpowers-brainstorming`, `ice-tracker-integration`).
*   **`~/.gemini/skills/`:** Contains Gemini CLI skills (e.g., `brainstorming`, `systematic-debugging`, `tooluniverse`).
*   **`~/my-supremepowers/skills/`:** Contains a mix of core SupremePower skills (e.g., `brainstorming`, `systematic-debugging`) and Gemini CLI specialized skills (e.g., `devtu-fix-tool`, `tooluniverse`).
*   **`~/my-supremepowers/qwen_skills/`:** Dedicated directory for Qwen skills.
*   **Consolidation:** Skills from `~/.gemini/skills/` and a subset of `.supremepower` core skills are in `~/my-supremepowers/skills/`. Qwen's skills are in `~/my-supremepowers/qwen_skills/`.

### Rules

*   **`~/.qwen/rules/`:** Contains rule definitions (e.g., `cross-agent-integration.mdc`, `superpowers.mdc`).
*   **`~/.gemini/`:** Does not show a top-level `rules/` directory in the listing.
*   **`~/my-supremepowers/rules/`:** Contains rule files, notably `superpowers.mdc`.
*   **Consolidation:** Rules from `~/.qwen/rules/` are selectively copied to `~/my-supremepowers/rules/`. A specific Qwen rule is also noted as `qwen_rules_superpowers.md` at the top level of `~/my-supremepowers/`.

### Scripts

*   **`~/.qwen/scripts/`:** Contains utility scripts (e.g., `qwen-backup`, `qwen-sp`).
*   **`~/.gemini/`:** Contains `update.sh` at root, no dedicated `scripts/` directory.
*   **`~/my-supremepowers/scripts/`:** Contains scripts like `qwen-backup`, `qwen-sp`, `update.sh`, `enhanced_init.sh`.
*   **Consolidation:** Scripts from `~/.qwen/scripts/` and relevant utility scripts from `~/.gemini` (like `update.sh`) are gathered into `~/my-supremepowers/scripts/`.

### Policies

*   **`~/.gemini/policies/`:** Contains policy files (e.g., `auto-saved.toml`).
*   **`~/.qwen/`:** Does not show a top-level `policies/` directory.
*   **`~/my-supremepowers/policies/`:** Contains `auto-saved.toml`.
*   **Consolidation:** Policies from `~/.gemini/policies/` are copied to `~/my-supremepowers/policies/`.

### Hooks

*   **`~/.gemini/hooks/`:** Contains hook scripts (e.g., `after-tool.sh`, `session-start.sh`).
*   **`~/.qwen/`:** Contains `hookify` directory. `new-hooks-system` also seen.
*   **`~/my-supremepowers/hooks/`:** Contains hook scripts (e.g., `after-tool.sh`, `session-start.sh`) and potentially `hooks.json`, `run-hook.cmd` from `.supremepower`.
*   **Consolidation:** Hooks from `~/.gemini/hooks/` are copied to `~/my-supremepowers/hooks/`. The structure `hooks.json` and `run-hook.cmd` likely originate from `.supremepower` or Qwen's hook systems.

### Core Framework Elements

*   **`~/.qwen/`:** Includes various top-level files (e.g., `settings.json`, `QWEN.md`, `README.md`, `google_accounts.json`). Also, `commands/`, `tmp/`, `todos/`, `archive/`, `plans/`.
*   **`~/.gemini/`:** Includes various top-level files (e.g., `settings.json`, `GEMINI.md`, `README.md`, `google_accounts.json`, `oauth_creds.json`). Also, `tmp/`, `logs/`, `docs/`.
*   **`~/my-supremepowers/`:**
    *   `core/`: Likely from `.supremepower` or custom integration.
    *   `lib/`: Contains `skills-core.js`, also likely from `.supremepower`.
    *   `config.json`: Central configuration.
    *   `README.md`: Consolidated top-level README.
    *   `docs/`: All generated documentation.
    *   `commands/`: From Qwen or Gemini.
*   **Consolidation:** Core framework elements are a blend. `config.json` and `README.md` are central consolidated files. `core/` and `lib/` appear to be unique to the `my-supremepowers` (or `.supremepower`) structure.

### Other Notable Files/Directories

*   **`~/.qwen` specific:** `archive`, `code-review`, `coderabbit`, `context7`, `debug`, `explanatory-output-style`, `hookify`, `ide`, `insights`, `integrations`, `learning-output-style`, `new-hooks-system`, `plans`, `plugins`, `projects`, `review_2026-04-22_full`, `security-guidance`, `session-reports`, `templates`, `todos`, various analysis/definition MD files.
*   **`~/.gemini` specific:** `backups`, `extensions`, `extensions_backup`, `history`, `logs`, `projects.json`, `trustedFolders.json`, various constitutional MD files.
*   **`~/my-supremepowers` specific (outside standard component dirs):** `docs-04-22-17.csv`, `docs.txt`, `gemini_cli_integration.md`, `gemini_cli_supremepower_readme.md`, `LICENSE`, `qwen_rules_superpowers.md`, `qwen_supremepower_readme.md`, `RELEASE-NOTES.md`, `skill_creator_documentation.md`, `skill_creator_mermaid.md`, `systematic_debugging_documentation.md`, `systematic_debugging_mermaid.md`, `using_superpowers_documentation.md`, `using_superpowers_mermaid.md`. These seem to be additional documentation, meta-files, or specific integration notes.

---

## Summary of Consolidation

The `~/my-supremepowers` directory successfully consolidates key operational components from `~/.qwen` and `~/.gemini`. The strategy involves:
*   **Dedicated Categorization:** Qwen-specific agents and skills are segregated into `qwen_agents` and `qwen_skills`.
*   **Direct Merging:** Common component types (agents, skills, rules, scripts, policies, hooks) are largely merged from `~/.gemini` and relevant parts of `~/.qwen` into corresponding top-level directories in `~/my-supremepowers`.
*   **Core Framework Additions:** The `core/` and `lib/` directories, along with `config.json`, form a new central structural element.
*   **Documentation Hub:** The `docs/` directory within `~/my-supremepowers` serves as the central repository for generated documentation, providing a unified view of the consolidated system.
*   **Selective Integration:** Not all files/directories from `~/.qwen` or `~/.gemini` are carried over, indicating a deliberate selection process focusing on core operational elements.

This consolidated structure aims to provide a unified and organized framework for managing SupremePower functionalities.

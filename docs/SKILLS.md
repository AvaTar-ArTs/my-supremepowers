# SupremePower Skills Library

This document details the available skills within the consolidated SupremePower framework located in `/Users/steven/my-supremepowers/`. Skills are modular components that encapsulate specific techniques, patterns, or tool usage, designed to be invoked by agents or managed through the `using-superpowers` skill.

## Table of Contents

- [Overview of Skills](#overview-of-skills)
- [Core SupremePower Skills](#core-supremepower-skills)
- [Gemini CLI Specialized Skills](#gemini-cli-specialized-skills)
- [Qwen Specific Skills](#qwen-specific-skills)
- [Skill Management and Invocation](#skill-management-and-invocation)

---

## Overview of Skills

Skills are reusable guides for proven techniques, patterns, or tools that agents leverage to perform tasks. They are designed to be invoked based on the context of a user request or an agent's internal logic, ensuring disciplined and efficient execution.

---

## Core SupremePower Skills

These are fundamental skills likely managed by `/Users/steven/.supremepower/` and integrated into the core framework. They focus on common development workflows.

*   **Location:** `/Users/steven/my-supremepowers/skills/`
*   **Skills Included:**
    *   `brainstorming/`
    *   `dispatching-parallel-agents/`
    *   `executing-plans/`
    *   `finishing-a-development-branch/`
    *   `receiving-code-review/`
    *   `requesting-code-review/`
    *   `subagent-driven-development/`
    *   `systematic-debugging/`
    *   `test-driven-development/`
    *   `using-git-worktrees/`
    *   `using-superpowers/`
    *   `verification-before-completion/`
    *   `writing-plans/`
    *   `writing-skills/`
*   **Description:** These skills cover the entire software development lifecycle, from ideation and planning to implementation, testing, debugging, collaboration, and tool usage. They are essential for structured development.

---

## Gemini CLI Specialized Skills

These skills extend the core capabilities with specialized tool integrations and functionalities.

*   **Location:** `/Users/steven/my-supremepowers/skills/`
*   **Subdirectories:**
    *   `devtu-fix-tool/`
    *   `devtu-optimize-descriptions/`
    *   `devtu-optimize-skills/`
    *   `setup-tooluniverse/`
    *   `tooluniverse/`
    *   `tooluniverse-clinical-trial-design/`
    *   `tooluniverse-sequence-retrieval/`
*   **Description:** Focuses on tool optimization, configuration, and accessing specific data domains like scientific sequences and clinical trial information via "ToolUniverse".

---

## Qwen Specific Skills

These skills originate from the Qwen system and offer a broad range of functionalities, including custom adaptations and domain-specific tools.

*   **Location:** `/Users/steven/my-supremepowers/qwen_skills/`
*   **Key Subdirectories (Illustrative):**
    *   `superpowers-*` (e.g., `superpowers-brainstorming`, `superpowers-writing-plans`, `superpowers-systematic-debugging`) - Customizations or extensions of core SupremePower skills.
    *   `tooluniverse-*` (e.g., `tooluniverse-clinical-trial-design`, `tooluniverse-sequence-retrieval`) - Further applications of ToolUniverse.
    *   `ice-tracker-integration/`
    *   `writing-rules/`
    *   Many others covering diverse domains.
*   **Description:** This extensive collection represents Qwen's unique contributions, including custom workflow adaptations, domain-specific tools, and potentially alternative implementations of core SupremePower functionalities.

---

## Skill Management and Invocation

*   **Primary Invocation Skill:** `using-superpowers` (located in `/Users/steven/my-supremepowers/skills/using-superpowers/`)
    *   **Role:** Acts as the central dispatcher. It analyzes user requests, identifies keywords, maps them to available skills, selects the most appropriate one, and activates it using `activate_skill()`.
    *   **Workflow:** User Request → Analyze Intent → Identify Keywords → Map to Skills → Select Skill → Activate Skill → Skill Execution.
    *   **Error Handling:** Reports if no suitable skill is found or if activation fails.

*   **Skill Discovery:** Skills are organized into directories within `/Users/steven/my-supremepowers/skills/` and `/Users/steven/my-supremepowers/qwen_skills/`. The `using-superpowers` skill is responsible for discovering and loading these based on user requests.

---

This documentation provides an overview of the skills available in your consolidated setup.

What would you like to document next? We can proceed with:
1.  **Analyzing the content** of specific skills (e.g., reading `SKILL.md` files or Qwen-specific skill details).
2.  **Documenting the Rules** from `/Users/steven/my-supremepowers/rules/`.
3.  **Documenting the Scripts** from `/Users/steven/my-supremepowers/scripts/`.
4.  **Documenting Policies** from `/Users/steven/my-supremepowers/policies/`.
5.  **Documenting Hooks** from `/Users/steven/my-supremepowers/hooks/`.
6.  **Documenting the Core Framework** components (`core/`, `lib/`, `config.json`).
7.  **Documenting Workflows** with diagrams.
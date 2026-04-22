# Workflow: Adding Custom Components (Agents/Skills)

This document outlines the systematic process for creating and integrating new custom agents or skills into the SupremePower framework. It follows a disciplined approach, ensuring components are well-defined, testable, and thoroughly documented.

## Table of Contents

- [Overview](#overview)
- [Process Stages](#process-stages)
  - [Phase 1: Define the Component](#phase-1-define-the-component)
  - [Phase 2: Write Tests (Baseline Scenarios)](#phase-2-write-tests-baseline-scenarios)
  - [Phase 3: Create the Component](#phase-3-create-the-component)
  - [Phase 4: Document the Component](#phase-4-document-the-component)
  - [Phase 5: Verify and Integrate](#phase-5-verify-and-integrate)
- [Mermaid Diagram](#mermaid-diagram)

---

## Overview

Adding custom components (agents or skills) is a key mechanism for extending and personalizing the SupremePower framework. This workflow ensures that new additions are developed systematically, adhering to best practices for quality, testability, and maintainability. It draws heavily on TDD principles.

---

## Process Stages

### Phase 1: Define the Component

*   **Goal:** Clearly articulate the purpose, scope, and expected behavior of the new agent or skill.
*   **Actions:**
    *   Determine the component's core function (e.g., what problem does this agent solve? What task does this skill perform?).
    *   Define its expertise, activation keywords, or triggering conditions.
    *   Identify any dependencies or prerequisites.

### Phase 2: Write Tests (Baseline Scenarios)

*   **Skill Alignment:** This phase directly utilizes the principles of `superpowers:test-driven-development` and `superpowers:writing-skills`.
*   **Goal:** Establish baseline behavior by creating tests or scenarios that demonstrate the *absence* of the new component's functionality or its incorrect behavior *without* the component present. This is the "RED" state in TDD.
*   **Actions:**
    *   Set up test cases that would fail if the component were not implemented.
    *   Document the expected failure or baseline behavior verbatim.

### Phase 3: Create the Component

*   **Goal:** Develop the actual agent definition or skill structure.
*   **Actions:**
    *   **For Agents:** Create definition files (e.g., `.md` or `.toml` in `agents/` or `qwen_agents/`) outlining persona, expertise, activation logic, and other relevant metadata.
    *   **For Skills:** Create the skill directory and its `SKILL.md` file, following the specified structure (frontmatter, overview, when to use, patterns, examples, etc.).

### Phase 4: Document the Component

*   **Skill:** `superpowers:writing-skills` (specifically for skill documentation)
*   **Goal:** Write clear, concise, and searchable documentation for the new component.
*   **Actions:**
    *   Adhere to documentation standards (e.g., using Markdown, providing clear descriptions, examples).
    *   Ensure the `description` field in skill frontmatter accurately reflects *when to use* the skill, not *what* it does.
    *   Include code examples and workflow diagrams (Mermaid) where beneficial.

### Phase 5: Verify and Integrate

*   **Goal:** Ensure the component works as expected and integrates seamlessly.
*   **Actions:**
    *   Run the previously created tests to confirm they now pass (the "GREEN" state in TDD).
    *   Perform any necessary refactoring while ensuring tests remain green.
    *   Integrate the component into the main system, ensuring it's discoverable and callable by `using-superpowers` or other agents.
    *   Conduct broader system tests to prevent regressions.

---

## Mermaid Diagram

```mermaid
graph TD
    A[Define Component Purpose & Expertise] --> B(Phase 2: Write Failing Tests / Baseline Scenarios);
    B --> C{Tests Fail as Expected?};
    C -- Yes --> D(Phase 3: Create Component - Agent Def/Skill Structure);
    C -- No --> B; % Revisit tests if they don't fail
    D --> E(Phase 4: Write Component Documentation - SKILL.md / Agent.md);
    E --> F(Phase 5: Verify - Run Tests);
    F --> G{Tests Pass?};
    G -- Yes --> H(Phase 5: Refactor & Integrate);
    G -- No --> D; % Revisit component implementation or tests
    H --> I[Component Added & Verified];
```

---

This document outlines the process for adding custom components.

What would you like to document next? We can proceed with:
1.  **Analyzing the content** of specific components (agents, rules, scripts, policies, hooks, core framework).
2.  **Reviewing the overall architecture** again.
3.  **Creating a central index or TOC** for all generated documentation.
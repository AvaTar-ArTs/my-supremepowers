# Documenting the 'using-superpowers' Skill

## 1. Overview

The `using-superpowers` skill is the primary entry point for interacting with Gemini CLI's advanced capabilities, often referred to as "supremepowers." It acts as a dispatcher, analyzing user requests to identify and activate the most appropriate specialized agent or skill to fulfill the task. This skill ensures that the CLI leverages the correct tools for complex operations, maintaining efficiency and accuracy.

## 2. Core Functionality

*   **Request Analysis:** It parses the user's input to understand the intent and identify keywords or patterns that map to available skills.
*   **Skill Dispatching:** Based on the analysis, it selects and activates the relevant skill (e.g., `codebase_investigator`, `writing-plans`, `test-driven-development`, etc.).
*   **Context Management:** It can manage the context passed between skills, ensuring that information from one skill is available to another if needed.
*   **Error Handling:** Provides feedback if a suitable skill cannot be found or if there are issues activating a skill.

## 3. When to Use

*   **Starting any conversation:** This skill is often the first one invoked to establish the interaction flow and determine the best tool for the job.
*   **Complex Tasks:** When a user's request is multi-faceted and might require different specialized agents.
*   **Exploring Capabilities:** When unsure about which specific tool to use, `using-superpowers` can help navigate the available options.

## 4. Workflow

The typical workflow for `using-superpowers` involves:

1.  **User Input:** The user provides a request.
2.  **Analysis:** `using-superpowers` analyzes the input for intent and keywords.
3.  **Skill Selection:** It identifies the most appropriate skill based on the analysis (e.g., `brainstorming`, `writing-plans`, `codebase_investigator`, etc.).
4.  **Skill Activation:** It calls `activate_skill` with the selected skill's name.
5.  **Execution:** The activated skill then takes over the task, potentially calling other tools or skills.

## 5. Key Resources and Concepts

*   **`activate_skill(name)`:** The primary function used to invoke other skills. The `name` parameter must match one of the available skills.
*   **Skill Descriptions:** Each skill has a description that `using-superpowers` uses for matching user intent.
*   **Agent Roles:** Skills often represent specialized agents with distinct roles (e.g., `code-reviewer`, `test-fixing-agent`).

## 6. Example

**User:** "I need to research how to implement a new feature for my web app."

**`using-superpowers` Action:**
Analyzes the request, identifies "research," "implement feature," and "web app." It might activate `brainstorming` first to understand requirements, then `writing-plans` to structure the implementation.

## 7. Conclusion

The `using-superpowers` skill is the gateway to leveraging the full suite of Gemini CLI's specialized tools. By intelligently dispatching requests to the appropriate skill, it ensures that tasks are handled by the most qualified agent, leading to more effective and efficient outcomes.

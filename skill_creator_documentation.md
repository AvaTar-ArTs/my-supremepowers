# Documenting the 'skill-creator' Skill

## 1. Purpose

The `skill-creator` skill is designed to guide users and AI agents through the process of developing new skills for the Gemini CLI. It acts as a framework, providing structured steps and best practices to ensure skills are effective, reusable, and well-documented. It transforms a raw idea into a packaged, installable skill.

## 2. Core Process: A Step-by-Step Workflow

The `skill-creator` skill guides users through a specific, iterative workflow:

### Step 1: Understand the Skill with Concrete Examples

*   **Objective:** Clearly define the purpose, desired functionality, and specific usage scenarios for the new skill.
*   **Action:** Analyze user requests, brainstorm potential features, and generate concrete examples of how the skill would be invoked and what it should achieve. Avoid vague descriptions; focus on specific inputs and expected outputs.

### Step 2: Plan Reusable Skill Contents

*   **Objective:** Identify the necessary components for the skill.
*   **Action:** Based on the examples, determine what scripts (e.g., Python, Bash), reference files (documentation, schemas), and assets (templates, boilerplate code) are needed.

### Step 3: Initialize the Skill

*   **Objective:** Set up the basic directory structure and template files.
*   **Action:** Use the `init_skill.cjs` script (located in the skill creator's scripts directory) to automatically generate a new skill folder with the standard `SKILL.md`, `scripts/`, `references/`, and `assets/` directories.
    ```bash
    node <path-to-skill-creator>/scripts/init_skill.cjs <new-skill-name> --path <output-directory>
    ```

### Step 4: Edit the Skill

*   **Objective:** Implement the reusable contents and write the core documentation.
*   **Action:**
    *   Customize or replace example files in `scripts/`, `references/`, and `assets/`.
    *   Write the `SKILL.md` file:
        *   **Frontmatter:** Define `name` and `description` (concise, third-person, trigger-focused).
        *   **Body:** Provide instructions, core patterns, code examples, and cross-references. Adhere to progressive disclosure principles.

### Step 5: Package the Skill

*   **Objective:** Validate and bundle the skill into a distributable `.skill` file.
*   **Action:** Use the `package_skill.cjs` script. This script first validates the skill (frontmatter, structure, etc.) and then creates a `.skill` file (a zip archive with a `.skill` extension).
    ```bash
    node <path-to-skill-creator>/scripts/package_skill.cjs <path/to/skill-folder> [./dist]
    ```

### Step 6: Install and Reload the Skill

*   **Objective:** Make the packaged skill available for use in the Gemini CLI.
*   **Action:**
    *   **User installs:** Guide the user to install using `gemini skills install <path/to/skill-name.skill> --scope workspace` (or `--scope user`).
    *   **User reloads:** Crucially, inform the user they MUST then run `/skills reload` in their interactive Gemini CLI session.

### Step 7: Iterate

*   **Objective:** Refine the skill based on usage and feedback.
*   **Action:** Test the skill in real-world scenarios, identify any shortcomings or areas for improvement, and update the skill's resources or `SKILL.md` accordingly.

## 3. Key Resources Provided by `skill-creator`

*   **`scripts/init_skill.cjs`**: For scaffolding new skill directories.
*   **`scripts/package_skill.cjs`**: For validating and packaging skills.
*   **`scripts/validate_skill.cjs`**: For pre-packaging validation checks.
*   **Template Files:** Example `SKILL.md`, `scripts/`, `references/`, and `assets/` to start from.

## 4. Conclusion

The `skill-creator` skill provides a robust, structured workflow for developing new agents and skills. By following its guided process, users can ensure their creations are well-defined, properly packaged, and ready for integration into the Gemini CLI ecosystem.

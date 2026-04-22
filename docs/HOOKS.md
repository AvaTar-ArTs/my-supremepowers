# SupremePower Hooks

This document details the hooks integrated into the SupremePower framework within `/Users/steven/my-supremepowers/`. Hooks are scripts designed to automate actions or inject custom logic at specific points in the workflow, enhancing customizability and automation.

## Table of Contents

- [Overview of Hooks](#overview-of-hooks)
- [Gemini CLI Hooks](#gemini-cli-hooks)
- [Custom `.supremepower` Hooks](#custom-supremepower-hooks)
- [Hook Management](#hook-management)

---

## Overview of Hooks

Hooks provide a mechanism to intercept and execute custom logic during various stages of the AI assistant's operation. This allows for pre-processing, post-processing, logging, or custom event handling, making the system more adaptable to specific environments and workflows.

---

## Gemini CLI Hooks

*   **Location:** `/Users/steven/my-supremepowers/hooks/` (Derived from `~/.gemini/hooks/`)
*   **Files:**
    *   `after-tool.sh`
    *   `before-agent.sh`
    *   `log-tools.sh`
    *   `session-start.sh`
*   **Description:** These shell scripts are designed to be executed at specific trigger points within the Gemini CLI's interaction flow.
    *   `after-tool.sh`: Likely executes after a tool or command is run, potentially for cleanup or logging.
    *   `before-agent.sh`: Executes before an agent is invoked, possibly for context preparation, argument validation, or setup.
    *   `log-tools.sh`: Suggests a role in logging tool usage, outcomes, or performance metrics.
    *   `session-start.sh`: Executes at the beginning of a user session, possibly for initialization, environment checks, or setting up session-specific variables.

---

## Custom `.supremepower` Hooks

*   **Location:** `/Users/steven/my-supremepowers/hooks/` (Copied from `/Users/steven/.supremepower/hooks/`)
*   **Files:**
    *   `hooks.json`
    *   `run-hook.cmd`
*   **Description:** This set of files indicates a custom hook management system within the `.supremepower` setup.
    *   `hooks.json`: Likely defines the hooks, their triggers, and associated actions or scripts.
    *   `run-hook.cmd`: Could be an executable script for managing or triggering the defined hooks.

---

## Hook Management

The execution of these hooks is likely managed by the SupremePower framework, triggered at predefined points in the workflow. Analyzing the content of these scripts and configuration files will reveal their specific actions and intended use cases within the system.

---

This document provides an overview of the hooks integrated into your SupremePower setup.

What would you like to document next? We can proceed with:
1.  **Documenting the Core Framework** components (`core/`, `lib/`, `config.json`).
2.  **Documenting Workflows** with diagrams.
3.  **Analyzing the content** of specific components (agents, rules, scripts, policies, hooks, core framework).
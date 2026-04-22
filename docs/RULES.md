# SupremePower Rules and Principles

This document outlines the core rules and principles governing the operation of the consolidated SupremePower framework in `/Users/steven/my-supremepowers/`. These rules are derived from various sources, including the Qwen system's adaptations and potentially custom configurations.

## Table of Contents

- [Overview](#overview)
- [Core Rules and Principles](#core-rules-and-principles)
  - [Cross-Agent Integration](#cross-agent-integration)
  - [Exceptional Output System](#exceptional-output-system)
  - [Learned Context (Cache-Style)](#learned-context-cache-style)
  - [Superpowers Workflow](#superpowers-workflow)
- [Key Directives](#key-directives)

---

## Overview

The rules and principles documented here are critical for ensuring consistent, predictable, and effective operation of the SupremePower framework. They guide how agents interact, how context is managed, and how development workflows are applied. These rules are based on best practices observed in various AI ecosystems and project conventions.

---

## Core Rules and Principles

### Cross-Agent Integration

*   **Source:** Copied from `~/.qwen/rules/cross-agent-integration.mdc` to `/Users/steven/my-supremepowers/rules/`
*   **Principle:** Emphasizes the need for clear communication and defined interfaces between different agents or components. It likely dictates how agents should share information, delegate tasks, and coordinate their actions to achieve a common goal. This ensures a cohesive system where agents work together effectively.

### Exceptional Output System

*   **Source:** Copied from `~/.qwen/rules/exceptional-output-system.mdc` to `/Users/steven/my-supremepowers/rules/`
*   **Principle:** This rule likely pertains to how the system handles and formats output, especially for substantive work. It may enforce conventions for changelogs, evolution tracking, exports, and code commits, ensuring that significant changes are properly recorded and communicated.

### Learned Context (Cache-Style)

*   **Source:** Copied from `~/.qwen/rules/learned-context.mdc` to `/Users/steven/my-supremepowers/rules/`
*   **Principle:** This principle focuses on how the system learns and retains information across sessions. It suggests a mechanism for storing and retrieving context, preferences, and facts (akin to a cache or memory system), which is crucial for personalization and consistency. It dictates *when* and *how* to read from and write to memory stores.

### Superpowers Workflow

*   **Source:** Copied from `~/.qwen/rules/superpowers.mdc` to `/Users/steven/my-supremepowers/rules/`
*   **Principle:** This rule enforces the mandated workflow for AI tasks, often following a chain like **Brainstorming → Writing Plans → TDD → Review/Verification**. It ensures a disciplined approach to implementation and changes, prioritizing structured development over ad-hoc fixes.

---

## Key Directives

*   **Adaptation vs. Overwriting:** When integrating components, prioritize adapting and generating in target directories rather than deleting or overwriting canonical sources unless specifically for error correction and with confirmation.
*   **Security First:** Never introduce code that exposes, logs, or commits secrets, API keys, or other sensitive information.
*   **User Intent:** Always strive to fulfill the user's request thoroughly and adhere to project conventions.

---

This document provides an overview of the core rules and principles governing your SupremePower setup.

What would you like to document next? We can proceed with:
1.  **Analyzing the content** of specific rule files (e.g., `superpowers.mdc`).
2.  **Documenting the Scripts**.
3.  **Documenting Policies**.
4.  **Documenting Hooks**.
5.  **Documenting Workflows** with diagrams.
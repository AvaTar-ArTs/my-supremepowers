# SupremePower Core Framework Components

This document details the foundational elements of the SupremePower framework as consolidated in `/Users/steven/my-supremepowers/`. These components form the technical backbone of the system, enabling its orchestration, agent activation, and core functionalities.

## Table of Contents

- [Overview](#overview)
- [Core Components](#core-components)
  - [Orchestration Engine](#orchestration-engine)
  - [Library Functions](#library-functions)
- [Key Principles](#key-principles)
- [Configuration](#configuration)

---

## Overview

The core framework components are derived primarily from `/Users/steven/.supremepower/` and adapted to serve as the foundational layer for the consolidated SupremePower setup. They are designed to be platform-agnostic, providing the essential logic for managing skills, agents, and workflows.

---

## Core Components

### Orchestration Engine

*   **Location:** `/Users/steven/my-supremepowers/core/` (Copied from `/Users/steven/.supremepower/core/`)
*   **Purpose:** This component is responsible for the high-level management and execution of tasks. It interprets requests, dispatches them to appropriate skills or agents, and coordinates their activities. It likely includes logic for parsing user intent, matching it to available capabilities, and managing the flow of execution.

### Library Functions

*   **Location:** `/Users/steven/my-supremepowers/lib/`
*   **Files:** `skills-core.js` (as identified previously).
*   **Purpose:** This directory contains reusable modules and utility functions that support the core framework. `skills-core.js`, for example, likely handles the discovery, loading, and potentially the parsing of skill definitions.

---

## Key Principles

The core framework embodies SupremePower's commitment to:
*   **Modularity:** Components are designed to be independent and swappable.
*   **Extensibility:** The framework is built to easily incorporate new skills, agents, and adapters.
*   **Discipline:** Enforces structured development workflows.

---

## Configuration

*   **File:** `config.json` (from `/Users/steven/.supremepower/`)
*   **Purpose:** This file likely holds the main configuration settings for the SupremePower setup, defining operational parameters, default behaviors, or paths to other resources.

---

This document provides a foundational understanding of the core SupremePower framework components. Future documentation will detail the integrated agents, skills, rules, scripts, policies, and hooks.

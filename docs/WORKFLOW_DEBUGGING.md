# Workflow: Debugging (Systematic Approach)

This document outlines the systematic debugging workflow, emphasizing a root-cause investigation approach over quick fixes. It details the phases required to thoroughly diagnose and resolve issues within the SupremePower framework.

## Table of Contents

- [Overview](#overview)
- [The Four Phases of Systematic Debugging](#the-four-phases-of-systematic-debugging)
  - [Phase 1: Root Cause Investigation](#phase-1-root-cause-investigation)
  - [Phase 2: Pattern Analysis](#phase-2-pattern-analysis)
  - [Phase 3: Hypothesis and Testing](#phase-3-hypothesis-and-testing)
  - [Phase 4: Implementation (Fixing Root Cause)](#phase-4-implementation-fixing-root-cause)
- [Key Principles and Directives](#key-principles-and-directives)
- [Mermaid Diagram](#mermaid-diagram)

---

## Overview

Systematic debugging is a mandatory discipline for resolving any technical issue encountered within the SupremePower framework. It prioritizes understanding the root cause before implementing fixes, ensuring long-term stability and preventing recurring problems. This approach contrasts with guesswork or superficial patching.

---

## The Four Phases of Systematic Debugging

### Phase 1: Root Cause Investigation

**Mandatory BEFORE any fix is proposed.**
*   **Read Error Messages Carefully:** Analyze all error messages, warnings, stack traces, and error codes for clues.
*   **Reproduce Consistently:** Ensure the issue can be reliably reproduced with specific steps. If not, gather more data.
*   **Check Recent Changes:** Investigate recent code commits, configuration changes, or environmental modifications that might have introduced the issue.
*   **Gather Evidence in Multi-Component Systems:** For complex systems, add diagnostic instrumentation (logs, state checks) at component boundaries to pinpoint where the failure occurs.
*   **Trace Data Flow:** Follow the data's origin and path, especially in deep call stacks, to find the source of the problem.

### Phase 2: Pattern Analysis

**Identify the underlying pattern before fixing.**
*   **Find Working Examples:** Locate similar, correctly functioning code or patterns within the codebase.
*   **Compare Against References:** Thoroughly read and understand established patterns or documentation.
*   **Identify Differences:** List all variations between the working and broken implementations.
*   **Understand Dependencies:** Document required settings, environment, and assumptions.

### Phase 3: Hypothesis and Testing

**Apply the scientific method.**
*   **Form Single Hypothesis:** Clearly state the suspected root cause (e.g., "I think X is the root cause because Y").
*   **Test Minimally:** Make the smallest possible change to test the hypothesis. Test one variable at a time.
*   **Verify Before Continuing:** Confirm if the change resolved the issue. If not, form a new hypothesis.
*   **When You Don't Know:** Explicitly state what is not understood and seek help or further research.

### Phase 4: Implementation (Fixing Root Cause)

**Address the root cause, not just symptoms.**
*   **Create Failing Test Case:** Write a minimal test that reproduces the bug. This MUST be done before fixing.
*   **Implement Single Fix:** Address the identified root cause with one change at a time.
*   **Verify Fix:** Ensure the test passes and the original issue is resolved without introducing regressions.
*   **If Fix Fails (≥ 3 attempts): Question Architecture:** If multiple fixes fail, stop and re-evaluate the fundamental design, rather than continuing to patch symptoms. Discuss with a partner before proceeding.

---

## Key Principles and Directives

*   **NO FIXES WITHOUT ROOT CAUSE INVESTIGATION FIRST:** This is the Iron Law of debugging.
*   **Test First:** Always create a failing test case before implementing a fix.
*   **Minimal Change:** Test one variable at a time.
*   **Question Architecture:** If multiple fixes fail, reconsider the fundamental design.
*   **Avoid Rationalizations:** Be aware of common excuses for skipping steps (e.g., "quick fix," "too simple to test").

---

## Mermaid Diagram

```mermaid
graph TD
    subgraph Phase 1: Root Cause Investigation
        A[Read Errors & Warnings] --> B(Reproduce Consistently);
        B --> C(Check Recent Changes);
        C --> D(Gather Evidence in Multi-Component Systems);
        D --> E(Trace Data Flow);
        E --> F{Root Cause Identified?};
    end

    F -- Yes --> G[Phase 2: Pattern Analysis];
    F -- No --> A; % Loop back if root cause not found

    subgraph Phase 2: Pattern Analysis
        G --> H(Find Working Examples);
        H --> I(Compare Against References);
        I --> J(Identify Differences);
        J --> K(Understand Dependencies);
        K --> L{Pattern Understood?};
    end

    L -- Yes --> M[Phase 3: Hypothesis & Testing];
    L -- No --> G; % Loop back if pattern not clear

    subgraph Phase 3: Hypothesis & Testing
        M --> N(Form Single Hypothesis);
        N --> O(Test Minimally);
        O --> P{Hypothesis Confirmed?};
        P -- Yes --> Q[Phase 4: Implementation];
        P -- No --> N; % Form new hypothesis
    end

    subgraph Phase 4: Implementation
        Q --> R(Create Failing Test Case);
        R --> S(Implement Single Fix);
        S --> T{Fix Verified?};
        T -- Yes --> U[Task Complete];
        T -- No --> Q; % Re-attempt fix or new hypothesis
        T -- >=3 Failed Fixes --> V(Question Architecture);
    end

    V --> W[Discuss Architecture];
```

---

This document outlines the systematic debugging workflow.

What would you like to document next? We can proceed with:
1.  **Documenting the process of adding custom components** (agents/skills).
2.  **Analyzing the content** of specific components (agents, rules, scripts, policies, hooks, core framework).
3.  **Reviewing the overall architecture** again.
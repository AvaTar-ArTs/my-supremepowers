# Documenting the 'systematic-debugging' Skill

## 1. Overview

The `systematic-debugging` skill provides a rigorous, phased methodology for identifying and fixing bugs. It emphasizes finding the root cause before attempting any fixes, preventing quick patches that mask underlying issues or introduce new problems. This approach ensures thoroughness and efficiency, even under time pressure.

## 2. The Iron Law: NO FIXES WITHOUT ROOT CAUSE INVESTIGATION FIRST

This is the most critical principle. Any attempt to fix an issue without understanding its root cause is considered a failure. This applies to all types of technical problems, including test failures, bugs, performance issues, and build errors.

## 3. When to Use

This skill is essential for:
*   **Any technical issue:** Test failures, production bugs, unexpected behavior, performance degradation, build failures, integration problems.
*   **Situations demanding rigor:** Emergencies, when "quick fixes" seem tempting, when previous fixes failed, when the issue is not fully understood, or when facing time pressure.
*   **Multi-component systems:** Crucial for diagnosing issues across different layers (e.g., CI → build → signing, API → service → database).

## 4. The Four Phases

The skill mandates completion of each phase before proceeding to the next.

### Phase 1: Root Cause Investigation

**Objective:** Understand WHAT the problem is and WHY it's happening.

*   **Read Error Messages Carefully:** Do not skip errors or warnings; they often contain direct solutions. Read stack traces fully.
*   **Reproduce Consistently:** Identify the exact steps to trigger the issue reliably.
*   **Check Recent Changes:** Analyze recent commits, dependency updates, configuration changes, or environmental differences that might be the culprit.
*   **Gather Evidence in Multi-Component Systems:** Add diagnostic instrumentation (logging, environment checks) at each component boundary to pinpoint where the failure occurs. Trace data flow backward to identify the origin of the issue.

### Phase 2: Pattern Analysis

**Objective:** Find similar, working patterns within the codebase or references.

*   **Find Working Examples:** Locate similar code that functions correctly.
*   **Compare Against References:** If applying a known pattern, read the reference implementation completely.
*   **Identify Differences:** List all discrepancies between the working and broken code/logic.
*   **Understand Dependencies:** Identify necessary configurations, environment variables, or other external factors.

### Phase 3: Hypothesis and Testing

**Objective:** Formulate and test a specific theory about the root cause.

*   **Form a Single Hypothesis:** State clearly: "I think X is the root cause because Y."
*   **Test Minimally:** Make the smallest possible change to test the hypothesis, changing only one variable at a time.
*   **Verify Before Continuing:** If the test works, proceed to Phase 4. If not, form a new hypothesis. Do not bundle multiple fixes.

### Phase 4: Implementation

**Objective:** Fix the root cause and ensure the solution is robust.

*   **Create a Failing Test Case:** Develop the simplest possible reproduction of the bug, preferably an automated test. This MUST be done before the fix.
*   **Implement a Single Fix:** Address only the identified root cause. No "while I'm here" improvements or bundled refactoring.
*   **Verify the Fix:** Ensure the test passes, no other tests are broken, and the original issue is resolved.
*   **Question Architecture if 3+ Fixes Failed:** If three or more fixes have failed, stop. This indicates a potential architectural problem rather than a simple bug. Discuss fundamental issues before attempting further fixes.

## 5. Common Rationalizations and Red Flags

The skill provides lists of common excuses and red flags that indicate a deviation from the systematic process (e.g., "Quick fix for now," "Just try changing X," "Multiple fixes at once"). If any of these arise, the agent is instructed to stop and return to Phase 1.

## 6. Conclusion

The `systematic-debugging` skill promotes a disciplined, scientific approach to problem-solving. By adhering to its phases, developers can more efficiently and reliably resolve issues, reduce the introduction of new bugs, and maintain higher code quality.

# Qwen Logic Flows - Advanced Capabilities

Visual reference for Qwen workflows, capability routing, ecosystem, and tools. Use with Qwen-specific workflows and capability indexes. **Full system (all Qwen logics and flows in one place):** ~/.qwen/QWEN_SYSTEM_DEFINITION.md.

---

## 1. Qwen Capability Routing: route(user_goal) → Qwen_skill_or_agent

When the user wants to **perform an action** in the Qwen ecosystem, classify once and invoke exactly one Qwen capability (or one documented combination).

```mermaid
flowchart LR
    subgraph input
        A[User request in Qwen context]
    end
    subgraph classify
        B{Goal type?}
    end
    subgraph qwenskills
        C1[Qwen Systematic Debugging]
        C2[Qwen Brainstorming]
        C3[Qwen Writing Plans]
        C4[Qwen Executing Plans]
        C5[Qwen Verification Before Completion]
        C6[Qwen Ecosystem Analysis]
        C7[Qwen Cross-Platform Integration]
    end
    subgraph qwenagents
        D1[Qwen Task Manager]
        D2[Qwen Documentation Assistant]
        D3[Qwen Code Reviewer]
    end
    A --> B
    B -->|debug/fix| C1
    B -->|generate/ideas| C2
    B -->|plan/structure| C3
    B -->|execute/implement| C4
    B -->|verify/check| C5
    B -->|audit/optimize| C6
    B -->|integrate/connect| C7
    B -->|track/manage| D1
    B -->|document/write| D2
    B -->|review/quality| D3
```

---

## 2. Qwen Superpowers Chain: brainstorm → plan → execute → verify

When the user wants to go from idea to completed, verified work in Qwen.

```mermaid
flowchart LR
    A[Brainstorming] --> B[Writing Plans]
    B --> C[Executing Plans]
    C --> D[Verification Before Completion]
    D --> E[Completed & Verified]
    
    A -.-> F[Qwen Systematic Debugging]
    C -.-> F
    D -.-> F
    
    F -.-> B
```

---

## 3. Qwen Systematic Debugging: root_cause → pattern_analysis → hypothesis → implementation

When encountering any issue in Qwen, follow the four-phase systematic approach.

```mermaid
flowchart TD
    A[Phase 1: Root Cause Investigation] --> B[Phase 2: Pattern Analysis]
    B --> C[Phase 3: Hypothesis and Testing]
    C --> D[Phase 4: Implementation]
    
    A --> A1[Read Error Messages]
    A --> A2[Reproduce Consistently]
    A --> A3[Check Recent Changes]
    A --> A4[Gather Evidence]
    
    B --> B1[Find Working Examples]
    B --> B2[Compare Against References]
    B --> B3[Identify Differences]
    B --> B4[Understand Dependencies]
    
    C --> C1[Form Single Hypothesis]
    C --> C2[Test Minimally]
    C --> C3[Verify Before Continuing]
    
    D --> D1[Create Failing Test Case]
    D --> D2[Implement Single Fix]
    D --> D3[Verify Fix]
```

---

## 4. Qwen Ecosystem Management: audit → propose → execute → log

When managing the Qwen ecosystem (skills, tools, capabilities).

```mermaid
flowchart LR
    A[Audit Mode - Scan & Report] --> B[Propose Mode - Recommend & Confirm]
    B --> C[Execute Mode - Perform Actions]
    C --> D[Log Changes - Record & Enable Recovery]
    
    A --> A1[Scan Qwen Skills]
    A --> A2[Identify Duplicates]
    A --> A3[Find Backups]
    A --> A4[Calculate Waste]
    
    B --> B1[Show Findings]
    B --> B2[Recommend Actions]
    B --> B3[User Confirms]
    
    C --> C1[Perform Cleanup]
    C --> C2[Update Registry]
    
    D --> D1[Record Manifest]
    D --> D2[Enable Recovery]
```

---

## 5. Qwen Cross-Platform Coordination: map → transfer → coordinate → synthesize

When connecting Qwen with other AI tools (Cursor, Claude, etc.).

```mermaid
flowchart LR
    A[Map Capabilities] --> B[Transfer Knowledge]
    B --> C[Coordinate Workflows]
    C --> D[Synthesize Results]
    
    A --> A1[Identify Qwen Capabilities]
    A --> A2[Identify Other Tool Capabilities]
    A --> A3[Find Overlaps]
    A --> A4[Find Gaps]
    
    B --> B1[Export from Source]
    B --> B2[Adapt for Target]
    B --> B3[Import to Target]
    
    C --> C1[Align Workflows]
    C --> C2[Coordinate Timing]
    C --> C3[Share Context]
    
    D --> D1[Integrate Results]
    D --> D2[Resolve Conflicts]
    D --> D3[Finalize Output]
```

---

## 6. Qwen Self-Improvement Cycle: observe → analyze → hypothesize → experiment → integrate

When enhancing Qwen's own capabilities.

```mermaid
flowchart LR
    A[Observe Behavior] --> B[Analyze Patterns]
    B --> C[Form Hypothesis]
    C --> D[Experiment]
    D --> E[Integrate Learnings]
    E --> A
    
    A --> A1[Monitor Interactions]
    A --> A2[Track Outcomes]
    A --> A3[Identify Issues]
    
    B --> B1[Find Patterns]
    B --> B2[Analyze Causes]
    B --> B3[Evaluate Effectiveness]
    
    C --> C1[Propose Improvements]
    C --> C2[Prioritize Changes]
    
    D --> D1[Test Changes]
    D --> D2[Measure Impact]
    
    E --> E1[Update Processes]
    E --> E2[Modify Behaviors]
    E --> E3[Adjust Approaches]
```

---

## 7. Qwen Verification Workflow: define_criteria → check_completion → validate_quality → confirm_correctness

When verifying work before completion in Qwen.

```mermaid
flowchart TD
    A[Define Verification Criteria] --> B[Check Completion Status]
    B --> C[Validate Quality Standards]
    C --> D[Confirm Correctness]
    D --> E[Ready for Completion]
    
    A --> A1[Functional Requirements]
    A --> A2[Quality Standards]
    A --> A3[Acceptance Criteria]
    
    B --> B1[All Steps Done?]
    B --> B2[All Deliverables Present?]
    B --> B3[Dependencies Met?]
    
    C --> C1[Meets Quality Bar?]
    C --> C2[Follows Best Practices?]
    C --> C3[No Known Issues?]
    
    D --> D1[Functionally Correct?]
    D --> D2[No Regressions?]
    D --> D3[Performance Acceptable?]
```

---

**Note:** These flows represent the systematic approaches adapted from the advanced ~/.cursor capabilities for use in the Qwen ecosystem.
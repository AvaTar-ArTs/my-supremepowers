graph TD
    A[User Request] --> B{Analyze Request Intent};
    B --> C{Identify Keywords & Patterns};
    C --> D{Map to Available Skills};
    D --> E{Select Best Skill/Agent};
    E --> F[Activate Skill using activate_skill()];
    F --> G{Skill Execution};
    G --> H[Potentially Activate Other Skills/Tools];
    H --> I{Task Completion};
    E -- No Suitable Skill --> J[Report Error/Ask Clarification];
    F -- Skill Activation Error --> J;

graph TD
    A[User Request: Create New Agent/Skill] --> B{Activate 'skill-creator' skill};
    B --> C[Step 1: Understand Skill + Examples];
    C --> D[Step 2: Plan Contents (Scripts, Refs, Assets)];
    D --> E[Step 3: Initialize Skill (init_skill.cjs)];
    E --> F[Step 4: Edit Skill (SKILL.md, Resources)];
    F --> G[Step 5: Package Skill (package_skill.cjs)];
    G --> H[Step 6: Install & Reload Skill];
    H --> I[Step 7: Iterate];

# Evolution and Item History

Tracking the evolution of the Qwen ecosystem across integration sessions.

## [2026-04-16] — Supremepower Baseline / Qwen Adapted Model

### Session Summary
Aligned docs to user-specified authority model: `~/.supremepower` is the typical baseline standard, while `~/.qwen` is the adapted/operational runtime layer.

### Items Updated
- **`docs/SOURCE_OF_TRUTH_AND_LAYERS.md`** — Baseline/adaptation ownership model updated.
- **`docs/INSTALLATION_HOST_CROSSWALK.md`** — Host mapping updated to include Supremepower baseline and Qwen adapted runtime.
- **`Master_Recall_Index.md`** — Runtime surfaces table updated to include Supremepower baseline.
- **`docs/learned-context.md`** — Recorded the authority-model decision.
- **`docs/CHANGELOG.md`** — Logged this transition.

### Why this matters
- Matches governance docs to explicit user intent.
- Clarifies where baseline behavior lives versus where local operational adaptation happens.
- Reduces confusion during future sync and drift checks.

## [2026-04-16] — External Standards Imported into Qwen-Native Docs

### Session Summary
Imported requested external standards docs and adapted them to Qwen-local authority so path linking, usage workflows, multi-ability triggering, and language/reference strictness are represented directly in active `~/.qwen` documentation.

### Items Created
- **`docs/LINK_PATHS_USAGE_WORKFLOWS_AND_MULTI_ABILITY.md`** — Qwen-native path/link/workflow/multi-ability map.
- **`docs/LANGUAGE_AND_REFERENCE_STANDARD.md`** — Qwen-native flexible-vs-strict language/reference enforcement standard.

### Items Updated
- **`QWEN_INVOKE_INDEX_BY_TYPE.md`** — Canonical rule aligned to Qwen-local authoring; references added to imported standards docs.
- **`docs/learned-context.md`** — Recorded import/adaptation decision.
- **`docs/CHANGELOG.md`** — Logged the standards import and adaptation.

### Why this matters
- Keeps external references usable while enforcing active Qwen authority.
- Reduces drift between imported guidance and runtime policy.
- Improves discovery consistency across path, workflow, and language interpretation docs.

## [2026-04-16] — Using-Superpowers Skill Hardening (TDD Style)

### Session Summary
Ran baseline pressure scenarios against `using-superpowers`, observed skip-skill rationalizations under urgency framing, then patched Qwen runtime copies with explicit counters and re-tested for improved compliance.

### Items Updated
- **`superpowers/skills/using-superpowers/SKILL.md`** — Added pressure-tested failure pattern section, expanded red-flag table, and fast-path response template.
- **`skills/superpowers-using-superpowers/SKILL.md`** — Mirrored the same hardening updates for the alternate Qwen runtime surface.
- **`docs/CHANGELOG.md`** — Logged this hardening pass.

### Why this matters
- Reduces skill-skip behavior under "just do it now" pressure.
- Preserves execution speed while enforcing the skill applicability gate.
- Aligns active Qwen runtime copies with user-directed Qwen-local authoring policy.

## [2026-04-16] — Qwen-Local Authoring Enforcement (No iTerm2 Symlink Dependency)

### Session Summary
Enforced user-directed authoring policy: active Qwen behavior is now authored directly in `~/.qwen`, without relying on `~/iterm2` symlink/upstream-first workflow for runtime changes.

### Items Updated
- **`docs/SOURCE_OF_TRUTH_AND_LAYERS.md`** — Replaced `~/iterm2`-first canonical model with Qwen-local canonical authoring.
- **`Master_Recall_Index.md`** — Updated runtime surface note to Qwen-canonical wording.
- **`docs/INSTALLATION_HOST_CROSSWALK.md`** — Updated source-of-truth and host mapping to Qwen-local authoring.
- **`docs/learned-context.md`** — Recorded Qwen-local authoring decision as durable policy.
- **`docs/CHANGELOG.md`** — Logged this policy transition.

### Why this matters
- Aligns operational docs with explicit user preference and current runtime practice.
- Reduces accidental drift caused by upstream/symlink assumptions.
- Keeps active edits inside Qwen-owned paths for simpler maintenance.

## [2026-04-16] — Qwen Runtime Authority Doc Integrity Patch

### Session Summary
Patched high-impact Qwen docs to remove stale references, align terminology to Qwen-native runtime authority, and preserve historical narratives without letting them drive live behavior.

### Items Created
- **`docs/INSTALLATION_HOST_CROSSWALK.md`** — Host-to-install mapping for Qwen native, Supremepower integration, canonical authoring, compatibility wrappers, and legacy install docs.

### Items Updated
- **`Master_Recall_Index.md`** — Replaced stale links and non-existent references with active runtime surfaces and current governance documents.
- **`Learning_Explanatory_Styles.md`** — Repointed to active hash-versioned style directories.
- **`INTEGRATION_SUMMARY.md`** — Marked as historical context and redirected runtime authority to current source-of-truth docs.
- **`docs/CHANGELOG.md`** — Logged this doc integrity patch set.

### Why this matters
- Reduces drift between documentation and live Qwen paths.
- Keeps operator guidance Qwen-native rather than compatibility-layer-first.
- Prevents historical docs from being interpreted as active runtime policy.

## [2026-04-16] — Supremepower Adaptive Style Implementation

### Session Summary
Implemented a logic-first adaptation layer for `~/.qwen/integrations/supremepower` so ecosystem work can be executed consistently as `analyze -> learn -> adapt -> implement`, with direct command-path support.

### Items Created
- **`integrations/supremepower/docs/ADAPTIVE_STYLE_IMPLEMENTATION.md`** — Defines the adaptive loop, drift types, adaptation boundaries, and minimum function checks.
- **`integrations/supremepower/commands/sp/adapt.toml`** — New command entry point to run the adaptive loop with required context files.
- **`integrations/supremepower/commands/skills/ecosystem-clarity.toml`** — Added missing skill command adapter.
- **`integrations/supremepower/commands/skills/workflow-bootstrap.toml`** — Added missing skill command adapter.

### Items Updated
- **`docs/learned-context.md`** — Added command-coverage decision and adapter completeness pattern.
- **`docs/CHANGELOG.md`** — Logged adaptive-style and command-alignment updates.

### Why this matters
- Reduces execution drift between documented capabilities and command surfaces.
- Makes ecosystem adaptation operationally explicit without altering core superpowers governance.
- Improves clarity for logic/programming/function-focused sessions.

## [2026-04-16] — Reliability Loop Contract and Scenario Matrix

### Session Summary
Formalized a reusable reliability protocol so deep review/adaptation cycles preserve intent, avoid policy drift, and stay evidence-gated. Converted narrative guidance into an executable matrix and workflow contract.

### Items Created
- **`docs/plans/2026-04-16-reliability-loop-and-scenario-matrix.md`** — Full contract including:
  - 5-line clarity brief,
  - mandatory two-pass execution,
  - layer separation rule,
  - evidence tag requirements,
  - anti-overlook safeguards,
  - 10-scenario decision matrix.

### Items Updated
- **`docs/CHANGELOG.md`** — Added unreleased entries for reliability loop operationalization and scenario matrix formalization.
- **`docs/learned-context.md`** — Added operating-pattern decision to enforce finding-ID and evidence-gated edits in review cycles.

### Cross-Links
- **Reference index input**: `/Users/steven/docs-04-16-14:28.csv`
- **Layer governance base**: `docs/SOURCE_OF_TRUTH_AND_LAYERS.md`
- **Hooks policy base**: `docs/HOOKS_MODEL_AND_IMPLEMENTATION.md`
- **Memory cache**: `docs/learned-context.md`

## [2026-04-16] — Hooks Layer Clarification and Operationalization

### Session Summary
Converted hooks reflection into durable policy and operator docs so "hooks" are consistently interpreted as either bootstrap orchestration or runtime interception.

### Items Created
- **`docs/HOOKS_MODEL_AND_IMPLEMENTATION.md`** — Canonical hooks policy with two-layer model, hybrid design, first 3 runtime hooks, and implementation map.
- **`what-hooks-mean.txt`** — Short operator brief aligned to `get-hooked.txt` evidence.

### Items Updated
- **`Master_Recall_Index.md`** — Added hooks model doc to core recall table.
- **`README.md`** — Added hooks model doc to core documentation list.
- **`docs/CHANGELOG.md`** — Added entries for hooks policy artifacts.

### Cross-Links
- **Evidence transcript**: `~/.qwen/get-hooked.txt`
- **Canonical policy**: `~/.qwen/docs/HOOKS_MODEL_AND_IMPLEMENTATION.md`

## [2026-04-12] — Canonical Superpowers Sync & Anti-Slop Integration

### Session Summary
Cloned canonical `github.com/obra/superpowers` (148k ⭐) and performed full
comparison with Qwen's adapted versions. Imported all 18 canonical test prompts,
created contributor guidelines, updated learned context and changelog.

### Items Created
- **`docs/contributor-guidelines.md`** — Anti-slop contributor guidelines
  adapted from canonical CLAUDE.md/AGENTS.md. Skills = code, not prose.
  1% rule. Real problems only. Eval evidence required.
- **`integrations/supremepower/tests/explicit-skill-requests/`** — 9 test prompts
  + run scripts from canonical repo
- **`integrations/supremepower/tests/skill-triggering/`** — 6 test prompts
  + run scripts from canonical repo
- **`integrations/supremepower/tests/claude-code/`** — Test infrastructure
  (analyze-token-usage.py, test helpers, README)
- **16 symlinks** — `~/.qwen/skills/superpowers-*` → `~/.qwen/superpowers/skills/*`
  making superpowers skills visible in Skill tool menu

### Items Cleaned
- ~50 dead `.claude-plugin/plugin.json` and `.cursor-plugin.json` manifests
- All 37 orphaned directories (plugin versions + superpowers old copies)
- 74 `.DS_Store` files, 6 junk files, 4 backup files, 8 empty directories

### Items Discovered
- Canonical superpowers: `github.com/obra/superpowers` — 148k ⭐, MIT,
  Jesse Vincent/Prime Radiant. 94% PR rejection rate. Zero-dependency.
- All 14 canonical skills present in Qwen. Content matches canonical
  except supremepower banner injection.
- 3 Qwen-exclusive skills: `ecosystem-clarity`, `skill-triggering`, `workflow-bootstrap`

### Cross-Links
- **git-ai**: Checkpoint for canonical sync session
- **~/iterm2/superpowers/**: Canonical source (symlinked to ~/.qwen/skills/superpowers-*)
- **/tmp/superpowers-canonical/**: Fresh clone for comparison
- **docs/learned-context.md**: Updated with anti-slop, 1% rule, test suite info
- **docs/CHANGELOG.md**: Full changelog with all changes

---

## [2026-04-12] — Supremepower Integration & Self-Evolution

### Session Summary
Deep-dived into Cursor (`~/.cursor/docs/`, 29 docs), Gemini (`~/.gemini/`,
19 extensions + 2 agents + 8 docs), and canonical Superpowers
(`~/iterm2/superpowers/`) ecosystems. Adapted supremepower infrastructure
into Qwen-native form.

### Items Created
- **12 Specialist Agents** — `~/.qwen/agents/{backend-architect,frontend-architect,
  database-specialist,devops-engineer,security-engineer,performance-engineer,
  testing-specialist,api-specialist,system-architect,python-expert,
  javascript-expert,technical-writer}/agent.md`
- **`scripts/qwen-sp`** — Superpowers orchestrator CLI (bootstrap, skills,
  agents, use, map, status commands)
- **`scripts/qwen-backup`** — Full ecosystem backup tool
- **`integrations/supremepower/`** — Complete adaptation layer:
  - `qwen-bootstrap.md` — SessionStart context injection
  - `qwen-tool-mapping.md` — Claude/Gemini/Codex → Qwen tool equivalences
  - `qwen-skill-triggers.md` — Natural language → skill trigger test cases
  - `session-start-context.md` — Combined bootstrap for hookify
  - `superpowers-registry.md` — All 17 superpowers with quality stacks
  - `skills/`, `commands/`, `hooks/`, `docs/`, `agents/` — Copied from supremepower
- **`docs/learned-context.md`** — Conversation-derived knowledge cache
- **`docs/CHANGELOG.md`** — Exceptional output changelog
- **`docs/EVOLUTION_AND_ITEM_HISTORY.md`** — This file

### Items Adapted
- Supremepower `gemini-sp` → `qwen-sp` (full bash CLI replacing Node wrapper)
- Supremepower `superpowers-bootstrap.md` → `qwen-bootstrap.md`
- Supremepower `scripts/generate-commands.js` → integrated into `qwen-sp skills`
- Supremepower `scripts/wrapper-lib.js` → orchestration logic in `qwen-sp`
- Supremepower core orchestration (agent-matcher, context-parser,
  conditional-evaluator) → concepts documented in `qwen-skill-triggers.md`
- Supremepower 12 specialist agents → Qwen `agent.md` format with
  Qwen-native tool references

### Items Discovered (Not Yet Actioned)
- 16 root-level junk files eligible for deletion
- 2 orphaned hookify directories
- 6 obsolete plugin version directories
- 4 Cursor .mdc rules needing Qwen-native conversion
- Superpowers skills on disk but not all registered with Skill tool

### Cross-Links
- **git-ai**: Checkpoint created for this integration session
- **QWEN.md**: Project context (62 lines, may need enhancement)
- **Master_Recall_Index.md**: Existing Qwen capability index
- **Logic_Flows.md**: Existing Qwen process diagrams
- **~/iterm2/superpowers/**: Canonical superpowers source
- **~/.cursor/docs/**: Cursor knowledge architecture (29 docs)
- **~/.gemini/extensions/supremepower/**: Source for adaptation

---

## [2026-02-14] — Initial Cursor Ecosystem Integration

### Items Created
- `QWEN_SYSTEM_DEFINITION.md` — System architecture documentation
- `Master_Recall_Index.md` — Goal-based capability routing
- `Use_Cases_And_Triggers.md` — Intent-to-capability mapping
- `Working_Principles.md` — Behavioral guidelines
- `Logic_Flows.md` — Process diagrams (Mermaid)
- `ECOSYSTEM_ANALYSIS.md` — Initial ecosystem analysis
- `INTEGRATION_SUMMARY.md` — Import summary
- `README.md` — Project overview
- `plans/self-evolution-plan.md` — Generic 4-phase plan

### Items Imported
- Skills from Cursor/superpowers ecosystem
- Agents from Cursor ecosystem (mirrored to `agents-from-cursor/`)
- Plugin infrastructure (explanatory-output-style, learning-output-style)

---

*Following the exceptional output system: this file is updated after every
substantive integration session. See docs/CHANGELOG.md for detailed changes.*

---

## [2026-04-16] — Scenario-Driven Hook Bootstrap Design

### Session Summary
Designed complex operational scenarios to connect bootstrap context loading with runtime policy enforcement, then mapped those scenarios into concrete Qwen hook/linking artifacts.

### Items Created
- **`docs/plans/2026-04-16-hook-bootstrap-scenarios.md`**
  - Added four complex scenarios:
    - high-risk multi-repo refactor,
    - emergency debugging under time pressure,
    - cross-platform Windows/Unix hook deployment,
    - canonical/adaptation drift control.
  - Added linking and bootstrap implementation plan tied to active Qwen paths.

### Items Updated
- **`docs/HOOKS_MODEL_AND_IMPLEMENTATION.md`**
  - Added hook capability matrix (bootstrap vs runtime vs gap).
- **`plans/self-evolution-plan.md`**
  - Linked self-evolution roadmap to scenario-driven hook architecture.
- **`docs/CHANGELOG.md`**
  - Recorded scenario + matrix + linkage updates.
- **`docs/learned-context.md`**
  - Logged scenario-based hook planning and matrix tracking pattern.

### Why this matters
- Converts abstract hook discussion into testable, high-risk operational paths.
- Separates what is already implemented from what remains runtime enforcement debt.
- Provides a practical bootstrap-to-runtime migration track without destructive changes.

### Cross-Links
- `docs/plans/2026-04-16-hook-bootstrap-scenarios.md`
- `docs/HOOKS_MODEL_AND_IMPLEMENTATION.md`
- `plans/self-evolution-plan.md`

---

## [2026-04-16] — superpowers-codex Hook Function Deepdive

### Session Summary
Executed a source-file-grounded deepdive on `~/.qwen/superpowers-codex` to resolve hook semantics and operational trigger flow without relying on assumed behavior.

**Historical note:** `~/.qwen/superpowers-codex/` was later merged/retired; active Codex wrapper surfaces now live under `~/.qwen/superpowers/bin/superpowers-codex` and `~/.qwen/superpowers/docs/`.

### Items Updated
- **`docs/HOOKS_MODEL_AND_IMPLEMENTATION.md`**
  - Added trigger points:
    - session start via `templates/AGENTS.md`
    - discovery via `find-skills`
    - per-task load via `use-skill`
  - Added practical usage patterns and hybrid file map for bootstrap vs runtime layers.
- **`docs/EDIT_BOUNDARY_QUICKCHECK.md`**
  - Added `~/.qwen/superpowers-codex` classification and crosswalk entry.
- **`docs/CHANGELOG.md`**
  - Logged hook deepdive + quickcheck crosswalk extension.
- **`docs/learned-context.md`**
  - Recorded `superpowers-codex` hook behavior as persistent decision context.

### Why this matters
- Clarifies that `superpowers-codex` is a bootstrap hook system, not runtime middleware (historical label; active wrapper now resides under `~/.qwen/superpowers/...`).
- Reduces architecture drift when designing runtime policy enforcement.
- Improves edit-target safety for Codex-host adapter paths.

### Cross-Links
- `docs/HOOKS_MODEL_AND_IMPLEMENTATION.md`
- `docs/EDIT_BOUNDARY_QUICKCHECK.md`
- `docs/learned-context.md`

---

## [2026-04-16] — One-Screen Edit Boundary Quickcheck

### Session Summary
Added an operator-first quickcheck doc so high-frequency edit decisions can be made in seconds without reading the full layered-governance spec.

### Items Created
- **`docs/EDIT_BOUNDARY_QUICKCHECK.md`** — One-screen boundary matrix with status mapping for requested Qwen paths.

### Items Updated
- **`README.md`** — Added quickcheck link under core documentation.
- **`Master_Recall_Index.md`** — Added recall row for quick pre-edit boundary decisions.
- **`docs/CHANGELOG.md`** — Recorded quickcheck creation and wiring.
- **`docs/learned-context.md`** — Logged quickcheck usage pattern as persistent operating behavior.

### Why this matters
- Speeds execution while preserving governance discipline.
- Reduces wrong-tree edits in adaptation/runtime-heavy directories.
- Keeps canonical-first propagation practical during live sessions.

### Cross-Links
- `docs/EDIT_BOUNDARY_QUICKCHECK.md`
- `docs/SOURCE_OF_TRUTH_AND_LAYERS.md`
- `docs/learned-context.md`

---

## [2026-04-16] — Edit-Boundary Matrix Operationalization

### Session Summary
Converted layered governance from conceptual guidance into an explicit operator matrix so path decisions are fast and repeatable during live work.

### Items Updated
- **`docs/SOURCE_OF_TRUTH_AND_LAYERS.md`**
  - Added **Path Decision Matrix** with:
    - Edit Allowed
    - Edit With Caution
    - Do Not Edit Directly
  - Added escalation rule for fixes discovered in cache/archive paths.
- **`docs/CHANGELOG.md`**
  - Recorded matrix addition under `[Unreleased] -> Changed`.
- **`docs/learned-context.md`**
  - Logged matrix-based operating pattern as a persistent decision.

### Why this matters
- Reduces ambiguity during fast iteration.
- Prevents accidental edits in cache/archive/runtime-only trees.
- Preserves canonical-first propagation discipline.

### Cross-Links
- `docs/SOURCE_OF_TRUTH_AND_LAYERS.md`
- `docs/CHANGELOG.md`
- `docs/learned-context.md`

---

## [2026-04-16] — Layered Governance and Source-of-Truth Formalization

### Session Summary
Consolidated reflection across Claude plugin hooks, Qwen integration layers, and Codex archives into a formal layered governance model. Established a persistent policy for where canonical edits belong and where runtime/adaptation/archive content should not be treated as source-of-truth.

### Items Created
- **`docs/SOURCE_OF_TRUTH_AND_LAYERS.md`** — Formal model for:
  - canonical authoring (`~/iterm2/superpowers/skills/`)
  - adaptation layers (`~/.qwen/...`)
  - runtime hook/plugin layers (`~/.claude/plugins/...`, `~/.qwen/hookify/`)
  - archive/forensics layers (`~/.codex/archives/...`, `~/.qwen/archive/`)

### Items Updated
- **`README.md`** — Added source-of-truth policy doc to core documentation.
- **`Master_Recall_Index.md`** — Added direct recall row for edit-boundary decisions.
- **`docs/learned-context.md`** — Recorded layered governance decision for future sessions.
- **`docs/CHANGELOG.md`** — Logged this formalization pass.

### Why this matters
- Reduces cross-tree drift by enforcing one canonical authoring location.
- Prevents accidental edits in plugin cache/runtime layers.
- Keeps archive snapshots useful for forensics without contaminating active runtime.

### Cross-Links
- `docs/SOURCE_OF_TRUTH_AND_LAYERS.md`
- `docs/CHANGELOG.md`
- `docs/learned-context.md`

---

## [2026-04-16] — Consistency and Drift Reduction Pass

### Session Summary
Performed a non-destructive consistency pass across governance and hooks documentation to remove active contradictions and stale wording discovered during deep review.

### Items Updated
- **`docs/learned-context.md`**
  - Updated header freshness date.
  - Normalized superpowers terminology to 14 canonical skills (+ Qwen extras).
  - Aligned canonical-source edit policy with layered governance (canonical-first propagation).
  - Removed pending duplicate path intent for use-cases docs.
- **`docs/HOOKS_MODEL_AND_IMPLEMENTATION.md`**
  - Marked Hookify runtime engine as active implementation.
  - Clarified “policy target vs implemented runtime” interpretation.
  - Updated runtime file-map line from “when implemented” to active path.
- **`docs/evolution-changelogs/README.md`**
  - Added historical snapshot banner to prevent path/symlink claims from being treated as current operational truth.
- **`INTEGRATION_SUMMARY.md`**
  - Normalized use-cases reference wording to canonical path.
- **`docs/CHANGELOG.md`**
  - Recorded this consistency pass under `[Unreleased]`.

### Why this matters
- Eliminates contradictory operator instructions.
- Reduces accidental workflow drift caused by stale docs.
- Keeps runtime hook architecture grounded in what is actually implemented.

### Cross-Links
- `docs/SOURCE_OF_TRUTH_AND_LAYERS.md`
- `docs/HOOKS_MODEL_AND_IMPLEMENTATION.md`
- `docs/CHANGELOG.md`

---

## [2026-04-16] — Type-Based Discovery and Roster Activation

### Session Summary
Continued the layered governance evolution by turning a previously referenced but missing type-based invoke index into an active file. This completes the three-index discovery model: goal-based recall, trigger-based routing, and type-based inventory.

### Items Created
- **`QWEN_INVOKE_INDEX_BY_TYPE.md`** — Type-based roster for:
  - skills
  - agents
  - scripts
  - commands
  - hooks
  - Qodo agent/workflow definitions

---

## [2026-04-16] — Home AI Control Plane Expansion

### Session Summary
Expanded the review from Qwen/Supremepower into the broader home AI/tooling surface: `.claude`, `.gemini`, `.cursor`, `.codex`, `.supremepower`, `.qwen`, `~/diGiTaLdiVe`, `~/claudemarketplaces.com`, `~/Documents`, and secret-adjacent roots.

### Items Created
- **`docs/exports/home-ai-control-plane-inventory-2026-04-16.json`** — Metadata-only inventory with previews and hashes disabled.
- **`docs/exports/home-ai-control-plane-audit-2026-04-16.md`** — Human-readable audit summary, classification model, storage hotspots, Claude findings, and security actions.

### Items Updated
- **`docs/SOURCE_OF_TRUTH_AND_LAYERS.md`** — Added home-level project/content stores, Claude marketplace hook patterns, and secret-bearing metadata-only review rules.
- **`docs/learned-context.md`** — Recorded Claude role clarification, home-level inventory outputs, and secret-review safety rule.
- **`docs/CHANGELOG.md`** — Logged audit, layer expansion, Claude clarification, and permission hardening.

### Security Actions
- Tightened owner-only permissions on loose `.env*` files, env archives, Gemini account metadata, and Codex/Gemini installation IDs.

### Key Finding
`~/.claude` currently has no active `using-superpowers` copy. Claude contributes plugin/session-start and persona patterns; it should not be treated as Superpowers canonical authoring.

---

## [2026-04-16] — macBaks, iTerm2 Logs, and Revenue Launch Surface Expansion

### Session Summary
Extended the control-plane review into mounted backup volumes, live iTerm2 transcript logs, and the GumRoad revenue launch surface under `~/diGiTaLdiVe/MasterxEo/REVENUE/Gumroad/GumRoad`.

### Items Created
- **`docs/exports/macbaks-control-plane-inventory-2026-04-16.json`** — Metadata-only inventory with previews and hashes disabled.
- **`docs/exports/macbaks-control-plane-inventory-2026-04-16.db`** — SQLite query layer generated from the metadata inventory.
- **`docs/exports/home-ai-control-plane-inventory-2026-04-16.db`** — SQLite query layer generated from the home-level metadata inventory.
- **`docs/exports/macbaks-and-iterm2-control-plane-audit-2026-04-16.md`** — Human-readable audit covering backup roots, terminal transcript sensitivity, and GumRoad launch classification.
- **`scripts/inventory-to-sqlite`** — Repeatable converter from inventory JSON to indexed SQLite.
- **`docs/INVENTORY_DATABASES.md`** — Operator guide for queryable inventory DBs, example queries, and Markdown-vs-DB boundaries.

### Items Updated
- **`docs/SOURCE_OF_TRUTH_AND_LAYERS.md`** — Added terminal transcript layer, backup/archive layer expansion, and GumRoad revenue surface classification.
- **`docs/learned-context.md`** — Recorded macBaks, iTerm2, and GumRoad handling rules.
- **`docs/CHANGELOG.md`** — Logged inventory, report, and layer-model updates.
- **`.gitignore`** — Ignored generated inventory JSON/DB artifacts under `docs/exports/`.

### Key Findings
- `/Volumes/macBaks/qwen-backup/` is the formal Qwen restore ladder, not an authoring source.
- `/Volumes/macBaks/iterm2-back/` and related env/MCP backup paths are sensitive recovery snapshots.
- `/Users/steven/.iterm2` is about 4.7 GB and contains 43 terminal logs, including multi-GB transcripts. Treat it as sensitive evidence, not documentation.
- `GumRoad` is a compact but business-critical marketplace launch surface with platform variations for Gumroad, Codester, LemonSqueezy, Payhip, and Sellfy.

### Why this matters
- Prevents backup archives from being mistaken for canonical sources.
- Gives terminal logs an explicit retention/security status.
- Keeps revenue/product launch work connected to Qwen recall without polluting global AI runtime governance.
  - Cursor-rule concept sources

### Items Updated
- **`README.md`** — Replaced stale single-skill/future-growth wording with the current 59-skill, 20-agent surface and related workflow/script counts.
- **`Master_Recall_Index.md`** — Linked the new type-based invoke index directly in the core docs table and startup awareness instructions.
- **`IMPORT_MANIFEST.md`** — Corrected superpowers provenance to canonical authoring at `~/iterm2/superpowers/skills/`.
- **`docs/learned-context.md`** — Changed stale "need to create" discovery notes into active index references.
- **`docs/SOURCE_OF_TRUTH_AND_LAYERS.md`** — Normalized heading hierarchy for the layer model.
- **`docs/CHANGELOG.md`** — Recorded this evolution pass.

### Why this matters
- Removes a dead reference from startup discovery instructions.
- Makes capability discovery deterministic by type, not only by goal.
- Gives future capability additions a clear registration checklist.

### Cross-Links
- `QWEN_INVOKE_INDEX_BY_TYPE.md`
- `Master_Recall_Index.md`
- `Use_Cases_And_Triggers.md`
- `docs/SOURCE_OF_TRUTH_AND_LAYERS.md`

---

## [2026-04-16] — `using-superpowers` Source Chain Review

### Session Summary
Reviewed `/superpowers:using-superpowers` across `~/.qwen`, `~/.supremepower`, and `~/iterm2` to distinguish canonical authoring from host adapters and older mirrors.

### Findings
- **Canonical authoring target:** `~/iterm2/superpowers/skills/using-superpowers/SKILL.md`
- **Latest upstream candidate discovered:** `~/.cursor/plugins/cache/cursor-public/superpowers/.../skills/using-superpowers/SKILL.md`, matching `~/.codex/.tmp/plugins/plugins/superpowers/skills/using-superpowers/SKILL.md`
- **Supremepower host adapter:** `~/.supremepower/skills/using-superpowers/SKILL.md`
- **Gemini/Supremepower extension adapters:** `~/.gemini/extensions/supremepower/skills/using-superpowers/SKILL.md` and `~/.gemini/extensions/supremepower/core/skills/using-superpowers/SKILL.md`
- **Qwen active adapters:** `~/.qwen/superpowers/skills/using-superpowers/SKILL.md`, `~/.qwen/skills/superpowers-using-superpowers/SKILL.md`, and `~/.qwen/integrations/supremepower/skills/using-superpowers/SKILL.md`
- **Older mirrors:** several `~/iterm2/*` copies hash to older content and should not override canonical without diff review.

### Items Updated
- **`~/iterm2/superpowers/skills/using-superpowers/`** — Promoted newer upstream candidate content and tool-mapping references into the canonical authoring target.
- **`~/.supremepower/skills/using-superpowers/SKILL.md`** — Updated adapter provenance banner.
- **`~/.gemini/extensions/supremepower/.../using-superpowers/`** — Refreshed active Gemini/Supremepower copies and reference maps.
- **Qwen active `using-superpowers` copies** — Reframed access instructions around Qwen-native loading, Claude Skill tool loading, and Supremepower/Gemini extension loading.
- **`docs/SOURCE_OF_TRUTH_AND_LAYERS.md`** — Added explicit warning not to treat every `~/iterm2` mirror as canonical.
- **`docs/learned-context.md`** — Recorded the file-specific source-chain decision.
- **`docs/CHANGELOG.md`** — Logged this review and adaptation pass.

### Why this matters
- Prevents old `~/iterm2` mirrors from being mistaken for source-of-truth.
- Allows plugin caches to inform canonical updates without making caches canonical.
- Keeps `using-superpowers` strict while making loader instructions correct for each host.
- Tightens the distinction between canonical content and runtime adapters.

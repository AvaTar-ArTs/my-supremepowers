# Qwen Ecosystem Changelog

All notable changes to the Qwen ecosystem (`~/.qwen/`).

## [Unreleased]

### Changed
- **Authority model flip (baseline vs adapted)** — Updated governance docs so `~/.supremepower` is treated as the typical baseline standard and `~/.qwen` as the adapted/operational layer (`SOURCE_OF_TRUTH_AND_LAYERS.md`, `INSTALLATION_HOST_CROSSWALK.md`, `Master_Recall_Index.md`, `learned-context.md`).
- **Qwen-native standards import/adaptation** — Imported external reference docs into `~/.qwen/docs/` as `LINK_PATHS_USAGE_WORKFLOWS_AND_MULTI_ABILITY.md` and `LANGUAGE_AND_REFERENCE_STANDARD.md`, and updated `QWEN_INVOKE_INDEX_BY_TYPE.md` to Qwen-local canonical authoring language.
- **`using-superpowers` pressure-hardening (Qwen runtime copies)** — Updated `superpowers/skills/using-superpowers/SKILL.md` and `skills/superpowers-using-superpowers/SKILL.md` to remove `~/iterm2` adapter banner language, add pressure-case red flags ("already used", "skip for speed", "no planning loops"), and enforce a fast-path template that still requires skill applicability checks before actions.
- **Qwen-local canonical authoring policy** — Updated source-of-truth guidance to write active superpowers behavior directly in `~/.qwen` and removed `~/iterm2`-first authoring dependency for Qwen runtime operations.
- **Qwen doc integrity patch (runtime authority cleanup)** — Updated `Master_Recall_Index.md` to remove stale/missing references, align to Qwen-native runtime surfaces, and add an installation host crosswalk link.
- **Learning/explanatory style pointer correction** — Updated `Learning_Explanatory_Styles.md` from stale `latest/` references to active hash-versioned style directories.
- **Historical authority labeling** — Reframed `INTEGRATION_SUMMARY.md` as historical lineage context and redirected runtime authority to current source-of-truth docs.
- **Supremepower command-surface alignment** — Added missing command adapters for `ecosystem-clarity` and `workflow-bootstrap` under `integrations/supremepower/commands/skills/` so active Qwen-local superskills are command-addressable.
- **Adaptive execution style profile** — Added `integrations/supremepower/docs/ADAPTIVE_STYLE_IMPLEMENTATION.md` plus `integrations/supremepower/commands/sp/adapt.toml` to formalize a logic-first loop: `analyze -> learn -> adapt -> implement`.
- **Reliability loop operationalization** — Added `docs/plans/2026-04-16-reliability-loop-and-scenario-matrix.md` to convert reflection guidance into an execution contract (clarity brief, two-pass workflow, layer separation, evidence-gated edits, and no-silent-rewrite rule).
- **Scenario matrix formalization** — Captured 10 drift/risk scenarios in matrix form (`trigger -> detection -> decision -> first response -> owner`) with explicit response rules for canonical/adaptation/runtime/archive boundaries.
- **CSV-guided discovery pattern** — Registered `/Users/steven/docs-04-16-14:28.csv` as a fast path-index input for first-pass discovery before deep file-content review.
- **Scenario-driven hook bootstrap plan** — Added `docs/plans/2026-04-16-hook-bootstrap-scenarios.md` with complex scenarios, bootstrap/runtime separation, linking design, and non-destructive rollout steps.
- **Hook capability matrix** — Extended `docs/HOOKS_MODEL_AND_IMPLEMENTATION.md` with an explicit bootstrap-vs-runtime capability matrix (`implemented`, `gap target`, `pattern defined`) to guide next enforcement work.
- **Self-evolution linkage** — Updated `plans/self-evolution-plan.md` to reference the hook bootstrap scenarios plan and two-layer hook model.
- **`superpowers-codex` hook deepdive (evidence-mapped)** — Expanded `docs/HOOKS_MODEL_AND_IMPLEMENTATION.md` with trigger points, practical usage patterns, and a hybrid file map grounded in `bin/superpowers-codex`, `templates/AGENTS.md`, `docs/superpowers-bootstrap.md`, and `lib/skills-core.js` *(historical naming; active files now live under `~/.qwen/superpowers/...` after merge).*
- **Quickcheck crosswalk extension** — Updated `docs/EDIT_BOUNDARY_QUICKCHECK.md` to include `~/.qwen/superpowers-codex` in both matrix and role/source/sync crosswalk *(historical reference retained for timeline; active path is now `~/.qwen/superpowers/bin/superpowers-codex` + `~/.qwen/superpowers/docs`).*
- **Edit-boundary quickcheck (operator view)** — Added `docs/EDIT_BOUNDARY_QUICKCHECK.md` with one-screen status mapping for active Qwen paths, including: `agents`, `commit-commands`, `docs/evolution-changelogs`, `explanatory-output-style`, `integrations`, `learning-output-style`, `new-hooks-system`, `plugins`, `security-guidance`, `skills`, and `superpowers`.
- **Recall/doc wiring for quickcheck** — Linked `docs/EDIT_BOUNDARY_QUICKCHECK.md` from `README.md` and `Master_Recall_Index.md` so boundary decisions are discoverable during execution.
- **Path decision matrix added** — Expanded `docs/SOURCE_OF_TRUTH_AND_LAYERS.md` with an explicit `Edit Allowed / Edit With Caution / Do Not Edit Directly` matrix and an escalation rule for fixes discovered in cache/archive paths.
- **macBaks and iTerm2 control-plane audit** — Added `docs/exports/macbaks-and-iterm2-control-plane-audit-2026-04-16.md` plus metadata-only inventory `docs/exports/macbaks-control-plane-inventory-2026-04-16.json` covering backup volumes, terminal logs, and GumRoad revenue launch surface.
- **Generated inventory git hygiene** — Added `.gitignore` coverage for `docs/exports/*inventory*.json` so large metadata snapshots remain local evidence artifacts unless intentionally promoted.
- **Inventory database path** — Added `scripts/inventory-to-sqlite` and `.gitignore` coverage for generated `docs/exports/*inventory*.db` SQLite indexes so large inventory scans can be queried without re-scanning.
- **Inventory database guide** — Added `docs/INVENTORY_DATABASES.md` with query examples and rules for what belongs in SQLite vs Markdown.
- **Backup/archive layer expansion** — Updated `docs/SOURCE_OF_TRUTH_AND_LAYERS.md` to separate Qwen restore snapshots, macBaks project archives, sensitive env/auth backups, and `~/.iterm2` terminal transcripts from active authoring/runtime layers.
- **Revenue launch surface classification** — Registered `~/diGiTaLdiVe/MasterxEo/REVENUE/Gumroad/GumRoad/` as business-critical project content for marketplace packaging and launch work, not global AI behavior policy.
- **Home AI control-plane audit** — Added `docs/exports/home-ai-control-plane-audit-2026-04-16.md` and metadata-only inventory `docs/exports/home-ai-control-plane-inventory-2026-04-16.json` covering supplied home-level AI/tooling, project, document, and secret-adjacent paths.
- **Layer model expansion** — Updated `docs/SOURCE_OF_TRUTH_AND_LAYERS.md` with project/content stores (`~/diGiTaLdiVe`, `~/Documents`, `~/claudemarketplaces.com`), Claude marketplace hook patterns, and metadata-only handling for secret-bearing paths.
- **Claude role clarification** — Confirmed `~/.claude` has no active `using-superpowers` copy found; documented it as a plugin/session-start/persona pattern source, not canonical Superpowers authoring.
- **Cross-root permission hardening** — Tightened owner-only mode on loose `.env*` files, env archives, Gemini account metadata, and Codex/Gemini installation IDs.
- **`using-superpowers` adapter review** — Compared `~/iterm2`, `~/.supremepower`, and `~/.qwen` copies; clarified that `~/iterm2/superpowers/skills/` is the canonical authoring path while `~/.supremepower/skills/` is a host adapter.
- **Cross-root `using-superpowers` promotion** — Extended review to `~/.gemini`, `~/.cursor`, and `~/.codex`; promoted newer upstream candidate content from Cursor/Codex plugin caches into `~/iterm2/superpowers/skills/using-superpowers/`.
- **Tool mapping references added** — Added `copilot-tools.md`, `codex-tools.md`, and `gemini-tools.md` reference maps to canonical and active adapter `using-superpowers` paths.
- **Gemini/Supremepower active adapters refreshed** — Updated `~/.gemini/extensions/supremepower/skills/using-superpowers/` and `~/.gemini/extensions/supremepower/core/skills/using-superpowers/` with the newer discipline and Gemini/Supremepower loader language.
- **Supremepower adapter banner** — Updated `~/.supremepower/skills/using-superpowers/SKILL.md` provenance wording from old Cursor-enhanced language to canonical-superpowers propagation.
- **Qwen `using-superpowers` active copies** — Made Qwen active copies platform-neutral and Qwen-aware while preserving Supremepower/Gemini loading instructions and canonical plan-mode discipline.
- **Type-based discovery activation** — Created `QWEN_INVOKE_INDEX_BY_TYPE.md` so the Master Recall Index's type-roster instruction now resolves to a real artifact.
- **README capability surface update** — Replaced stale "additional skills will be added" language with current counts and groups for skills, agents, Qodo definitions, commands, and scripts.
- **Import provenance alignment** — Updated `IMPORT_MANIFEST.md` so superpowers import provenance points to canonical authoring at `~/iterm2/superpowers/skills/` rather than old `~/.supremepower` wording.
- **Layer policy formatting cleanup** — Fixed heading hierarchy in `docs/SOURCE_OF_TRUTH_AND_LAYERS.md`.
- **Learned-context discovery update** — Changed stale "need to create" notes into current goal/type/trigger index references.
- **Policy consistency pass (docs)** — Resolved canonical edit-rule contradiction by aligning `docs/learned-context.md` with `docs/SOURCE_OF_TRUTH_AND_LAYERS.md` (canonical-first, then propagate).
- **Hooks model freshness** — Updated `docs/HOOKS_MODEL_AND_IMPLEMENTATION.md` to mark Hookify runtime engine as active (`~/.qwen/hookify/2cd88e7947b7/...`) and clarified policy-target vs implemented-runtime distinction.
- **Historical docs banner** — Added archival warning banner to `docs/evolution-changelogs/README.md` so old architecture/path claims are treated as snapshot material, not live truth.
- **Use-cases path normalization** — Confirmed canonical path `~/.qwen/Use_Cases_And_Triggers.md` and removed docs-path duplication intent from learned context.
- **Source of truth architecture** — Added `docs/SOURCE_OF_TRUTH_AND_LAYERS.md` defining canonical authoring (`~/iterm2/superpowers/skills/`), adaptation layers in `.qwen`, runtime hook/plugin layers in `.claude`/hookify, and archive boundaries in `.codex/archives`.
- **Indexing updates** — Linked source-of-truth policy in:
  - `README.md` (Core Documentation)
  - `Master_Recall_Index.md` (Core docs table)
- **Learned-context update** — Recorded the layered governance decision and path boundaries.
- **Canonical source reference normalization (follow-up pass)** — Updated residual references in:
  - `INTEGRATION_SUMMARY.md`
  - `skills/superpowers-workflow-bootstrap/SKILL.md`
  - `superpowers/skills/workflow-bootstrap/SKILL.md`
  - `integrations/supremepower/skills/workflow-bootstrap/SKILL.md`
  to consistently reference `~/iterm2/superpowers/skills/` as canonical propagation source.
- **Security hardening confirmation** — `installation_id` mode tightened to `600` in `.qwen` root.
- **Deepdive export created** — `docs/exports/qwen-ecosystem-deepdive-2026-04-16.md`.

### Added
- **`docs/HOOKS_MODEL_AND_IMPLEMENTATION.md`** — Explicit two-layer hooks policy:
  bootstrap orchestration hooks vs runtime event hooks, with first 3 runtime hooks and
  implementation file map for Qwen.
- **`what-hooks-mean.txt`** — Operator-facing short brief defining hooks in this system,
  linked to `get-hooked.txt` evidence and the canonical hooks policy doc.
- **`docs/model-providers-free-and-byok.md`** — BYOK / free-tier / OSS (Ollama) reference for Qwen Code
  `modelProviders`, env layout (`~/.env.d` → `~/.qwen/.env`), operator checklist, copy-paste templates
  for Together / Mistral / DeepSeek / xAI / LM Studio, troubleshooting, and agent implementation contract.
  Convenience symlink: `~/model-providers-free-and-byok.md`.
- **18 Canonical Test Prompts** — Imported from `github.com/obra/superpowers` (148k ⭐):
  - 9 explicit-skill-request prompts (action-oriented, after-planning-flow, claude-suggested-it, etc.)
  - 6 skill-triggering prompts (dispatching-parallel-agents, systematic-debugging, TDD, planning, etc.)
  - Test runner scripts (`run-all.sh`, `run-test.sh`, etc.)
  - Located at `integrations/supremepower/tests/`
- **`docs/contributor-guidelines.md`** — Anti-slop contributor guidelines adapted from canonical
  superpowers. Establishes: skills are code not prose, eval evidence required for modifications,
  1% rule, real problems only, no bulk modifications, no speculative fixes, show the diff.
- **16 Superpowers Skill Symlinks** — `~/.qwen/skills/superpowers-*` → `~/.qwen/superpowers/skills/*`
  making all 17 superpowers skills visible in Qwen's Skill tool menu (16 with SKILL.md + 1 empty).
- **Canonical Superpowers Comparison** — Cloned `github.com/obra/superpowers` to `/tmp/superpowers-canonical`.
  All 14 canonical skills present in Qwen. 3 Qwen extras (`ecosystem-clarity`, `skill-triggering`, `workflow-bootstrap`).
  Qwen versions have supremepower banner injected — content otherwise matches canonical.
- **12 Specialist Agents** — Imported and adapted from supremepower/core/agents/:
  backend-architect, frontend-architect, database-specialist, devops-engineer,
  security-engineer, performance-engineer, testing-specialist, api-specialist,
  system-architect, python-expert, javascript-expert, technical-writer
- **`qwen-sp` Orchestrator** — CLI tool at `scripts/qwen-sp` replacing
  `gemini-sp` and `superpowers-codex`. Commands: bootstrap, skills, agents,
  use <name>, map, status.
- **Supremepower Integration Layer** — Complete adaptation at
  `integrations/supremepower/` with bootstrap context, tool mapping,
  skill triggers, session-start context, and superpowers registry.
- **`qwen-backup` Tool** — Full ecosystem backup to `/Volumes/macBaks/qwen-backup/`
  with timestamped directories, latest symlink, verify, list, restore.
- **`docs/learned-context.md`** — Conversation-derived knowledge cache with
  terminology, decisions, patterns, explore options phrases, predictive methods,
  and open items. Updated with anti-slop principles, 1% rule, test suite info.
- **`docs/CHANGELOG.md`** — This file. Exceptional output system: always update
  after substantive work.
- **`docs/EVOLUTION_AND_ITEM_HISTORY.md`** — Evolution tracking across sessions.
- **`docs/engineering-patterns.md`** — Extracted patterns from hookify rule engine,
  event-driven hooks, soft deletion, version-pinned plugins.

### Adapted
- **Superpowers Bootstrap** — Adapted from `~/.gemini/extensions/supremepower/`:
  `.codex/superpowers-bootstrap.md`, `scripts/gemini-sp`, `scripts/install.sh`,
  `scripts/generate-commands.js`, `scripts/wrapper-lib.js`, `lib/skills-core.js`,
  core orchestration (agent-matcher, context-parser, conditional-evaluator),
  and 12 specialist agent personas.
- **Canonical Superpowers** — Cross-referenced with `~/iterm2/superpowers/`
  and `github.com/obra/superpowers` (148k ⭐, MIT, Jesse Vincent/Prime Radiant).
  All 14 canonical skills present in Qwen with Qwen-adapted headers.
  94% PR rejection rate. Skills = code, not prose. 1% rule enforced.
- **Cursor Knowledge System** — Deep-dived 29 docs in `~/.cursor/docs/`
  including SYSTEM_DEFINITION, WORKING_PRINCIPLES, MASTER_RECALL_INDEX,
  learned-context, conversation-link-map, predictive methods, and
  exceptional output system.
- **Gemini Ecosystem** — Analyzed 19 extensions, 2 agents, 8 docs, 7 skills
  at `~/.gemini/`. Key finding: all 7 ToolUniverse skills are exact duplicates
  of Qwen skills.

### Discovered
- Root-level duplicates: `brainstorm.md`, `execute-plan.md`, `write-plan.md`
  are identical to `commands/` versions.
- Orphaned hooks: `hookify/236752ad9ab3/` and `hookify/27d2b86d72da/`
  marked `.orphaned_at` since Feb 5-6, 2026.
- Obsolete plugin versions: 3 versioned copies each of
  `explanatory-output-style/` and `learning-output-style/` (only `latest/` needed).
- Cursor .mdc rules: 4 rules in `~/.qwen/rules/` are Cursor-format
  (alwaysApply .mdc files) — don't load natively in Qwen.
- Backup destination: `/Volumes/macBaks/` mounted and writable.
- Canonical superpowers: `github.com/obra/superpowers` — 148k stars, MIT License,
  by Jesse Vincent (Prime Radiant). 94% PR rejection rate. Zero-dependency by design.

### Removed
- **6 junk files** — `Untitled.txt` (568 KB), `QWEN.mdnecho` (0 B), `superpowers.zip` (819 KB),
  `superpowers.js`, `superpowers-codex.txt`, `INSTALL 2.md`
- **4 backup/lock files** — `QWEN.md.backup`, `settings.json.backup`, `settings.json.orig`, `ide/51750.lock`
- **74 `.DS_Store` files** — All macOS metadata junk
- **37 orphaned directories** — 12 plugin version orphans + `superpowers/a98c5dfc9de0/` (18 nested) + `superpowers/4.1.1/`
- **8 empty directories** — `insights/facets/`, `tools/`, `plugins/cache/`, etc.
- **~50 dead plugin manifests** — `.claude-plugin/plugin.json` and `.cursor-plugin.json` files (Claude/Gemini/Cursor only)

### Cross-Ecosystem Analysis
| Ecosystem | Skills | Agents | Unique Value |
|-----------|--------|--------|-------------|
| **Qwen** | 59 total (43 native + 16 superpowers) | 26 total | Native Skill tool, SessionStart hooks, learned context, exceptional output |
| **Cursor** | 40+ in skills/ | 25+ in agents/ | 29 interlinked docs, .mdc rules, multi-index discovery |
| **Gemini** | 7 (all duplicates) | 2 TOML agents | 19 extensions, policy system, boring brain |
| **Supremepower** | 14 core | 13 specialists | MCP orchestration, agent-matcher, wrapper-lib, 148k ⭐ |
| **Canonical** | 14 core | code-reviewer only | Single source of truth, MIT, Jesse Vincent, zero-deps |

---

*Following the exceptional output system: this changelog is updated after every
substantive integration session. See docs/learned-context.md for decisions and patterns.*

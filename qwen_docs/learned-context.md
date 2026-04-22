# Learned Context (Qwen)

**Last Updated:** 2026-04-16 (supremepower-baseline authority model)

This file caches key terminology, decisions, patterns, and preferences established across sessions. Read this at session start to avoid re-learning what we've already figured out.

## Terminology we've established

- **Superpowers (Qwen runtime)**: Active canonical authoring for this environment is `~/.qwen/superpowers/skills/` with supporting surfaces in `~/.qwen/skills/`.
- **Supremepower**: The Gemini CLI extension at `~/.gemini/extensions/supremepower/` that wraps superpowers with MCP orchestration, agent activation, and command dispatch.
- **Qwen Superpowers**: The Qwen-native adaptation at `~/.qwen/` — skills in `superpowers/skills/`, agents in `agents/`, orchestrator at `scripts/qwen-sp`.
- **`qwen-sp`**: Qwen Superpowers orchestrator CLI. Replaces `gemini-sp` and `superpowers-codex`. Commands: `bootstrap`, `skills`, `agents`, `use <name>`, `map`, `status`.
- **BYOK model providers doc**: `docs/model-providers-free-and-byok.md` (symlink `~/model-providers-free-and-byok.md`) — free/OSS vs hosted tiers, `modelProviders` templates, env.d wiring, Qwen operator checklist.
- **Hookify**: Qwen's session hook system. 3 rule directories (hashed IDs), only 1 active (`2cd88e7947b7`), 2 orphaned.
- **Canonical Source (Qwen policy)**: `~/.qwen/superpowers/skills/` — primary authoring source for active Qwen behavior.
- **Supremepower Adapter**: `~/.supremepower/skills/` — host-adapted extension copy. For `using-superpowers`, it keeps canonical discipline while using Supremepower extension loading language.
- **Upstream Candidate Caches**: `~/.cursor/plugins/cache/.../superpowers/` and `~/.codex/.tmp/plugins/.../superpowers/` may contain fresher upstream plugin content. Compare them, promote validated improvements into canonical `~/iterm2/superpowers/skills/`, then propagate adapters.
- **Generate, Never Remove**: When propagating skills, generate adapted output in target directories. Never delete originals during synchronization.
- **Exceptional Output System**: After any substantive work, update changelog, evolution history, reanalyze/export if conversation-heavy, and index with git-ai.

## Decisions we've made

**2026-04-16: Canonical source and reference normalization**
- Standardized superpowers source references to `~/iterm2/superpowers/skills/` in active system docs.
- Added compatibility pointer file `~/.qwen/Learning_Explanatory_Styles.md` so older references resolve while `learning-output-style/latest/` and `explanatory-output-style/latest/` remain canonical style locations.
- Corrected system definition filename references to `QWEN_SYSTEM_DEFINITION.md` to avoid lookup drift.
- Added `docs/SOURCE_OF_TRUTH_AND_LAYERS.md` to formalize authoring boundaries:
  canonical (`~/iterm2/superpowers/skills/`) vs adaptation (`~/.qwen/...`) vs runtime hooks/plugins (`~/.claude/plugins/...`, `~/.qwen/hookify/`) vs archives (`~/.codex/archives/...`).
- Clarified canonical edit rule to match layers policy: edit shared behavior in canonical first, then propagate to `.qwen` adaptation layers.
- Reviewed `/superpowers:using-superpowers` across `~/iterm2`, `~/.supremepower`, `~/.qwen`, `~/.gemini`, `~/.cursor`, and `~/.codex`: latest upstream candidate was in Cursor/Codex plugin caches; promoted its stricter content into canonical `~/iterm2/superpowers/skills/using-superpowers/`, then propagated host-adapted copies into Qwen, Supremepower, and Gemini extension paths.
- Extended review to `~/.claude`, home-level AI/tooling roots, `~/diGiTaLdiVe`, `~/claudemarketplaces.com`, and `~/Documents`; created metadata-only inventory `docs/exports/home-ai-control-plane-inventory-2026-04-16.json` and readable audit `docs/exports/home-ai-control-plane-audit-2026-04-16.md`.
- `~/.claude` has no active `using-superpowers` copy found; treat it as a plugin/session-start/persona pattern source, not a Superpowers canonical source.
- Secret-bearing roots are metadata-only review targets. Do not run analyzers that dump `.env` values into reports. Tightened owner-only permissions for loose `.env*` files, env archives, Gemini account metadata, and Codex/Gemini installation IDs.
- Extended the control-plane review into `/Volumes/macBaks/*`, `~/.iterm2`, and the GumRoad revenue launch surface; created metadata-only inventory `docs/exports/macbaks-control-plane-inventory-2026-04-16.json` and readable audit `docs/exports/macbaks-and-iterm2-control-plane-audit-2026-04-16.md`.
- Added `scripts/inventory-to-sqlite` and generated local SQLite query layers for `home-ai-control-plane-inventory-2026-04-16` and `macbaks-control-plane-inventory-2026-04-16`; keep generated DB/JSON inventory artifacts ignored by git unless intentionally promoted.
- Treat `/Volumes/macBaks/qwen-backup/` as the Qwen restore ladder, `/Volumes/macBaks/iterm2-back/` as sensitive cleanup/security snapshots, `/Volumes/macBaks/diVinePyTHon/` and `/Volumes/macBaks/GPTJunkie/` as project/business archives, and `/Volumes/macBaks/pythons/` as a legacy code/analyzer corpus.
- Treat `~/.iterm2/*.log` as sensitive terminal transcript evidence, not durable documentation. Search contents only for narrow forensic questions and avoid dumping log excerpts into reports.
- Treat `~/diGiTaLdiVe/MasterxEo/REVENUE/Gumroad/GumRoad/` as an active revenue launch surface: product packaging, listings, web pages, and platform variations. It informs business/product work, not global AI runtime governance.
- Added an explicit path decision matrix to `docs/SOURCE_OF_TRUTH_AND_LAYERS.md` with three operational bands: **Edit Allowed**, **Edit With Caution**, and **Do Not Edit Directly**, plus an escalation rule for cache/archive-origin fixes.
- Added `docs/EDIT_BOUNDARY_QUICKCHECK.md` as the fast pre-edit surface for active Qwen paths; use it before touching `agents`, `commit-commands`, `docs/evolution-changelogs`, `explanatory-output-style`, `integrations`, `learning-output-style`, `new-hooks-system`, `plugins`, `security-guidance`, `skills`, or `superpowers`.
- Extended quickcheck + crosswalk to include Codex bootstrap/distribution surfaces under `~/.qwen/superpowers/bin/superpowers-codex` and `~/.qwen/superpowers/docs/` as **CAUTION** paths.
- Grounded hook semantics in `superpowers-codex` source files (now hosted under `~/.qwen/superpowers/...`): bootstrap/session-start orchestration (`bootstrap`, skill discovery, auto-load `using-superpowers`) is not runtime event interception middleware.
- Added scenario-based hook planning at `docs/plans/2026-04-16-hook-bootstrap-scenarios.md` to stress-test bootstrap/runtime boundaries under complex workflows.
- Added a hook capability matrix in `docs/HOOKS_MODEL_AND_IMPLEMENTATION.md` to track implemented bootstrap controls vs runtime enforcement gaps.
- Established a reliability-loop operating contract for review cycles:
  - require a pre-edit clarity brief,
  - run discovery pass before adaptation pass,
  - map every edit to a finding ID and evidence type (`stale_reference`, `drift_conflict`, `security_boundary`, `runtime_mismatch`),
  - label clarity-only rewrites explicitly as non-policy changes.
- Registered `/Users/steven/docs-04-16-14:28.csv` as a fast first-pass index for candidate path discovery before deep content inspection.
- In `~/.qwen/integrations/supremepower`, treat command coverage as a functional integrity check: if a live skill is part of operational workflow, it should have a matching command adapter (or an explicit documented reason it is invocation-only).
- Added an adaptive execution profile at `integrations/supremepower/docs/ADAPTIVE_STYLE_IMPLEMENTATION.md` to run ecosystem work as `analyze -> learn -> adapt -> implement` without weakening core superpowers workflow discipline.
- Normalized runtime-authority docs for current Qwen setup: `Master_Recall_Index.md` now points to active sources and surfaces, `Learning_Explanatory_Styles.md` points to hash-versioned active style dirs, and `INTEGRATION_SUMMARY.md` is explicitly historical.
- User preference locked: do not rely on symlink/upstream-first authoring from `~/iterm2`; create and maintain active behavior directly in `~/.qwen`.
- `using-superpowers` was pressure-hardened using RED/GREEN style checks: under urgency language, enforce skill applicability gate first, then execute in fast mode.
- Imported and adapted external standards into Qwen-native docs: added `docs/LINK_PATHS_USAGE_WORKFLOWS_AND_MULTI_ABILITY.md` and `docs/LANGUAGE_AND_REFERENCE_STANDARD.md`, and aligned `QWEN_INVOKE_INDEX_BY_TYPE.md` to Qwen-local canonical authoring.
- User clarified authority model: treat `~/.supremepower` as the typical baseline standard, with `~/.qwen` as the adapted/operational layer.

**2026-04-15: Qwen OAuth → Coding Plan or API Key**
- Qwen Code UI states Qwen OAuth free tier was discontinued on 2026-04-15; use Alibaba Cloud Coding Plan or bring-your-own API key.
- `~/.qwen/settings.json` uses `security.auth.selectedType` `openai` with `modelProviders.openai` entries using `envKey` `OPENAI_API_KEY` (official API). `~/.qwen/.env` is a symlink to `~/.env.d/llm-apis.env` so keys stay in the modular env.d layout. Coding Plan remains available by adding `BAILIAN_CODING_PLAN_API_KEY` to `llm-apis.env` (or a separate file) and a matching `modelProviders` entry per Qwen docs.

**2026-04-12: Skill Management Strategy**
- Skills on disk at `~/.qwen/skills/` and `~/.qwen/superpowers/skills/` are all registered and invokable via the native `Skill` tool.
- Specialist agents (12 from supremepower) are in `~/.qwen/agents/<name>/agent.md` format — loaded by reading the file and adopting the persona.
- Cursor `.mdc` rules in `~/.qwen/rules/` are Cursor-format — they don't load natively in Qwen. Treat them as concept sources and promote only validated rules into Qwen-native docs or Hookify runtime policies.
- Duplicate files at root (`brainstorm.md`, `execute-plan.md`, `write-plan.md`) are identical to `commands/` versions — should be cleaned up.
- Output style plugins (`explanatory-output-style/`, `learning-output-style/`) have 4 versioned copies each — only `latest/` is needed.

**2026-04-12: Backup Strategy**
- Full ecosystem backup to `/Volumes/macBaks/qwen-backup/` with timestamped directories and `latest` symlink.
- Backup script at `~/.qwen/scripts/qwen-backup` supports: full backup, quick backup, verify, list, restore.
- Pre-restore snapshots are created before any restore operation.

**2026-04-12: Qwen as Central Hub**
- Qwen (`~/.qwen/`) is becoming the central hub for cross-ecosystem integration.
- Adaptation principle: extract concepts from other ecosystems, implement in Qwen's native patterns. Don't copy-paste and swap paths.
- Multi-index discovery is active: goal-based (`Master_Recall_Index.md`), type-based (`QWEN_INVOKE_INDEX_BY_TYPE.md`), and trigger-based (`Use_Cases_And_Triggers.md`).

## Patterns that work

- **Superpowers Chain** (mandatory order): brainstorming → writing-plans → executing-plans/subagent-driven-development → verification-before-completion → finishing-a-development-branch
- **Quality Stacks**: systematic-debugging → fix → verification-before-completion; verification-before-completion → requesting-code-review
- **Adapt, Don't Copy**: Extract the concept from other ecosystems, implement using Qwen's native tools and patterns.
- **SessionStart Bootstrap**: Inject capability awareness at session start so the AI knows what it can do without being told.
- **Exceptional Output System**: Always update changelog + evolution history after substantive work. Creates automatic documentation freshness.
- **Inquiry Habit**: When something is mentioned (file, concept, term), search for or look it up before acting on assumptions.
- **Adapter Completeness Check**: Validate skill-to-command mapping in integration layers so capability docs, command surfaces, and runtime behavior stay aligned.
- **Historical vs Runtime Rule**: Keep lineage docs for context, but route execution decisions through runtime-authority docs (`QWEN_SYSTEM_DEFINITION`, source-of-truth layers, and current recall/index maps).
- **Skills Are Code, Not Prose**: From canonical superpowers (148k ⭐) — skills shape agent behavior like code shapes program execution. Modifications require eval evidence, not just editorial preference.
- **1% Rule**: If there's even a 1% chance a skill applies, invoke it. Enforced by `using-superpowers`.
- **Anti-Slop**: 94% PR rejection rate in canonical repo. Real problems only. No speculative fixes. One change at a time. Show the diff.
- **Test Suite**: 18 canonical test prompts imported at `integrations/supremepower/tests/` — use for skill trigger validation.
- **Fast-Path Discipline**: "Output now/no loops" requests change verbosity, not process gates — skill applicability check remains mandatory.

## Explore options (phrases that signal "use the full stack")

- "explore options"
- "use what you've got"
- "go deeper"
- "consider agents and skills"
- "what else can you do with this?"

When these appear, scan available skills and agents for applicable capabilities — don't just do what's explicitly named.

## Predictive methods

| When this happens | Anticipate | Do |
|-------------------|-----------|-----|
| After creating something structural | You'll want it findable | Cross-link from indexes; add to changelog; update learned-context |
| After clarifying a pattern | You'll want it to persist | Add to learned-context; if behavioral, document as a principle |
| After several exchanges | You might want review or export | Suggest summarizing what we've done |
| When adding skill/doc affecting other systems | Supremepower/indexes need updating | Mention what needs sync; add to indexes |
| When designing anything new | You value flexible phrasing | Document how to trigger without naming each capability |
| After cleanup/junk removal | You'll want verification | Run status check; confirm everything still works |
| After backup creation | You'll want verification | Run verify; confirm manifest and file counts |

## Open / to revisit

- ~~Register superpowers skills with Qwen's Skill tool registry~~ ✅ DONE — 16 symlinks created in `~/.qwen/skills/superpowers-*`
- ~~Convert Cursor `.mdc` rules to Qwen-native format~~ → Moved to docs/contributor-guidelines.md
- Create `~/.qwen/docs/conversation-link-map.md` — neural-net reference for concept relationships
- `~/.qwen/QWEN_INVOKE_INDEX_BY_TYPE.md` is the canonical type-based roster; do not create a duplicate under `docs/`.
- Canonical use-cases doc path is `~/.qwen/Use_Cases_And_Triggers.md` (do not create a duplicate under `docs/`).
- ~~Clean up root-level junk files~~ ✅ DONE — 6 junk files deleted
- ~~Consolidate versioned output style plugins (keep only `latest/`)~~ → Orphaned versions deleted
- ~~Delete orphaned hookify directories~~ ✅ DONE — 37 orphaned dirs removed
- ~~Mount /Volumes/macBaks and run backup~~ ✅ DONE — backup secured on macBaks
- ~~Delete agents-from-cursor/ after merge~~ ✅ DONE — all 16 unique agents merged into agents/
- ~~Delete empty skill-triggering/ dir and broken symlink~~ ✅ DONE
- ~~Create agent REGISTRY.md~~ ✅ DONE — all 43 agents indexed with categories

---

*This file is read at session start. Write to it when we clarify, decide, or establish a pattern.*

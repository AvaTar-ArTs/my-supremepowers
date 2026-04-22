# Source of Truth and Layers

Date: 2026-04-16

## Purpose

Define exactly where to author, where to adapt, where to run, and where to archive so changes remain coherent across Qwen, Claude, Cursor, Codex, and Supremepower environments.

See also: `docs/exports/home-ai-control-plane-audit-2026-04-16.md` for the home-level audit that includes `.claude`, `.gemini`, `.cursor`, `.codex`, `.supremepower`, `.qwen`, `~/diGiTaLdiVe`, `~/Documents`, and secret-adjacent roots.

See also: `docs/exports/macbaks-and-iterm2-control-plane-audit-2026-04-16.md` for backup-volume, terminal-log, and revenue-launch layer findings.

## Layer Model

### 1) Supremepower Standard Baseline (typical standard)

- `~/.supremepower/skills/`
- `~/.supremepower/docs/`

For this environment, treat `~/.supremepower` as the typical baseline standard.
Qwen remains the adapted working layer for local runtime and control-plane operations.

### 2) Adaptation Layers (generated or curated mirrors)

- `~/.qwen/superpowers/skills/`
- `~/.qwen/skills/superpowers-*` (local adapter surface)
- `~/.qwen/integrations/supremepower/skills/`
- `~/.qwen/superpowers/bin/superpowers-codex` and `~/.qwen/superpowers/docs/` (Codex-oriented adaptation bundle)
- `~/.supremepower/skills/` (Supremepower host adapter)
- `~/.gemini/extensions/supremepower/skills/` and `~/.gemini/extensions/supremepower/core/skills/` (Gemini/Supremepower extension adapters)

Edit here for host-specific adaptation and distribution requirements. Keep `.supremepower` baseline semantics intact unless intentionally evolving the standard.

### 3) Runtime Prompt/Hook Layers (behavior injection)

- `~/.claude/plugins/cache/claude-plugins-official/explanatory-output-style/...`
- `~/.claude/plugins/cache/claude-plugins-official/learning-output-style/...`
- `~/.claude/plugins/marketplaces/claude-plugins-official/plugins/hookify/...`
- `~/.claude/plugins/marketplaces/claude-plugins-official/plugins/security-guidance/...`
- `~/.qwen/hookify/`

These are runtime behavior injectors and policy overlays. They are not canonical skill-authoring locations.

### 4) Specialized Persona/Agent Layers

- `~/.claude/agents/iterm2-ecosystem-dev.md`
- `~/.qwen/agents/`

These define execution personas and standards for specific ecosystems. They should align with Qwen canonical behavior for this environment.

### 5) Project and Content Stores (index, do not auto-govern)

- `~/diGiTaLdiVe/`
- `~/Documents/`
- `~/claudemarketplaces.com/`
- `~/diGiTaLdiVe/MasterxEo/REVENUE/Gumroad/GumRoad/`

These roots contain projects, generated inventories, marketplace code, notes, PDFs, media, and product work. Use them for search, recall, and project-specific context. Do not treat them as global runtime policy unless a file is explicitly an agent/config artifact such as `AGENTS.md`, `CLAUDE.md`, `GEMINI.md`, hooks docs, plugin manifests, or marketplace schemas.

The GumRoad revenue folder is business-critical launch content. It can inform product packaging, platform pages, bundle strategy, and launch workflow, but it is not a global AI behavior source.

### 6) Terminal Transcript Layers (sensitive evidence stream)

- `~/.iterm2/`

This root contains shell integration files plus large iTerm2 terminal logs. Treat logs as sensitive transcript/evidence streams: useful for forensics, dangerous as durable context. Do not promote logs into docs, skill content, or reports except as path-level metadata and narrow, intentional summaries.

### 7) Secret-Bearing and Credential Layers (metadata-only review)

- `.env*`, `.env.d/`, `.secrets/`, `.ssh/`, `.gnupg/`, `.mcp-auth/`, `.boto`
- OAuth/account/auth files such as `oauth_creds.json`, `google_accounts.json`, `auth.json`
- backup copies under `/Volumes/macBaks/*` that include `.env`, `.env.d`, `.mcp-auth`, OAuth, token, credential, or API-key paths

Review these by path, permissions, and presence only. Do not dump values into reports, inventories, prompts, or generated docs.

### 8) Backup, Archive, and Forensics Layers (read-only history)

- `~/.codex/archives/skills-cleanup-20260416-001913`
- `~/.qwen/archive/`
- `/Volumes/macBaks/qwen-backup/`
- `/Volumes/macBaks/iterm2-back/`
- `/Volumes/macBaks/GPTJunkie/`
- `/Volumes/macBaks/diVinePyTHon/`
- `/Volumes/macBaks/pythons/`

These are evidence snapshots, project backups, and recovery sources. Do not treat as active authoring paths. Promote content from them only after comparison, provenance notes, and runtime verification.

## Edit Rules

- Keep shared baseline behavior aligned with `~/.supremepower/skills/`.
- Apply Qwen-local adaptations in `~/.qwen` after baseline decisions.
- Do not author new canonical behavior directly in plugin cache directories.
- Do not promote archive content into runtime without explicit validation.
- If baseline and Qwen adaptation diverge, keep baseline intent in `.supremepower` and document explicit Qwen-local adaptation rationale.

## Operational Loop

1. Author or confirm baseline behavior in `~/.supremepower`.
2. Run validation for trigger behavior and quality.
3. Apply/propagate Qwen-local adaptations in `~/.qwen`.
4. Verify references and indexes.
5. Record in:
   - `docs/CHANGELOG.md`
   - `docs/EVOLUTION_AND_ITEM_HISTORY.md`
   - `docs/learned-context.md` (for decisions/patterns)

## Path Decision Matrix (edit boundaries)

Use this quick matrix before any change. If uncertain, default to **caution** and document intent first.

### Edit Allowed (authoring / owned governance)

- `~/.supremepower/skills/` (typical baseline standard)
- `~/.supremepower/docs/` (baseline host docs)
- `~/.qwen/docs/` (governance docs, changelog, learned context, architecture notes)
- `~/.qwen/QWEN_SYSTEM_DEFINITION.md`
- `~/.qwen/Master_Recall_Index.md`
- `~/.qwen/Use_Cases_And_Triggers.md`
- `~/.qwen/QWEN_INVOKE_INDEX_BY_TYPE.md`
- `~/.qwen/Working_Principles.md`
- `~/.qwen/scripts/` (orchestration and maintenance scripts)

### Edit With Caution (host adapters / runtime-facing)

- `~/.qwen/superpowers/skills/` (active Qwen canonical skills; high impact)
- `~/.qwen/skills/superpowers-*` (adapter surfaces)
- `~/.qwen/integrations/supremepower/` (distribution/integration layer)
- `~/.qwen/superpowers/bin/superpowers-codex` and `~/.qwen/superpowers/docs/` (Codex bootstrap/distribution layer)
- `~/.qwen/hookify/` and `~/.qwen/new-hooks-system/` (runtime behavior impact)
- `~/.qwen/agents/` (persona behavior; must align with canonical policy)
- `~/.qwen/rules/` (concept source for other hosts; verify host compatibility)
- `~/.qwen/settings.json` (config-only; never store raw secrets)

### Do Not Edit Directly (cache / archive / evidence / secrets)

- `~/.claude/plugins/cache/...` and `~/.cursor/plugins/cache/...` (host cache copies)
- `~/.codex/.tmp/plugins/...` (temporary runtime copies)
- `~/.codex/archives/...` and `~/.qwen/archive/` (forensics/history only)
- `~/.qwen/projects/`, `~/.qwen/debug/`, `~/.qwen/tmp/`, `~/.qwen/session-reports/` (generated/ephemeral)
- `~/.qwen/oauth_creds.json`, `~/.qwen/google_accounts.json`, `.env*`, `~/.env.d/*` (secret-bearing)
- `/Volumes/macBaks/...` backup trees (restore/reference only, no active authoring)

### Escalation rule

If a required fix appears to belong in a **Do Not Edit Directly** path:
1. locate baseline source path (`~/.supremepower`) and related Qwen adaptation path,
2. patch baseline and/or Qwen adaptation intentionally (not accidentally),
3. regenerate or re-sync cache/archive copies,
4. log the decision in `docs/learned-context.md`.

## Why this model

- Prevents silent drift across duplicated trees.
- Preserves one auditable source of truth.
- Keeps host-specific hooks/plugins in their proper role.
- Separates active system design from archive noise.

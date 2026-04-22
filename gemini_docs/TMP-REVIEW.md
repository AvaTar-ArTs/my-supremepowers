# Review: tmp directories

**Date:** 2025-02-08

---

## 1. `~/.gemini/tmp` (project temp)

**Total size:** ~613 MB

### Contents

| Item | Size | Purpose |
|------|------|---------|
| **Hash-named directories** (e.g. `8bc017...`, `65d38c...`, `f4cc85...`) | Most of 613 MB | CLI/session cache: shell history, `run_shell_command-*.output` logs, chat/session data. One directory (~473 MB) likely holds large session or command output. |
| **bin/** | 3.9 MB | Contains `rg` (ripgrep binary). |
| **repair-20260208-142919/** | 92 KB | Repair run from 8 Feb 2026: **manifest.tsv** (271 rows) lists zero-byte files that were quarantined. **quarantine/** holds copies of those files. Sources: `.claudeCodeChange` (xRoad, change_*), `.claude/projects` (session .jsonl), `.codex/instructions.md`, `.claude/CLAUDE.mdnecho`. Reason: "zero-byte deliverable" or "zero-byte session". |
| **repair-20260208-142930/** | 8 KB | **broken-symlinks.tsv** (40 rows): symlinks whose targets no longer exist. Includes: `.codex/tmp/path/codex-*/applypatch` and `apply_patch` → old Cursor ChatGPT extension paths; `run-long-command/node_modules/.bin/*` → deleted temp dir `gemini-extensionoeYdjQ`. |
| **xEo-Pythia-preview/** | 8.7 MB | Project or preview dir; contains `.gitignore`. |

### Recommendations

1. **Repair artifacts** – You can keep `repair-20260208-142919` as a backup of quarantined zero-byte files until you’re sure you don’t need them, then delete the whole folder. For `repair-20260208-142930`, fix or remove the broken symlinks (e.g. run `npm install` in `run-long-command` to refresh `.bin`; remove or reinstall Codex/Cursor paths as needed), then delete the TSV or the folder.
2. **Hash dirs** – Safe to prune old session/cache dirs if the CLI or your scripts don’t require them. Prefer clearing by age (e.g. older than 7–30 days) rather than deleting all, unless you want a full reset.
3. **bin/rg** – Keep if you use it from here; otherwise you can remove it and rely on system/Homebrew `rg`.
4. **xEo-Pythia-preview** – Treat as normal project/preview data; delete only if you no longer need it.

---

## 2. System `/tmp`

**Checked:** `/tmp` (system temp)

- **v8-compile-cache-501/** – Node/yarn compile cache (e.g. for `yarn`). Normal; no action needed unless you’re debugging cache issues.

---

## Summary

| Location | Status | Action |
|----------|--------|--------|
| ~/.gemini/tmp (hash dirs) | Session/cache data | Optional: prune by age to reclaim space |
| ~/.gemini/tmp/repair-* | Repair manifests + quarantine | Keep or delete after confirming; fix symlinks from broken-symlinks.tsv |
| ~/.gemini/tmp/bin | rg binary | Keep or remove depending on usage |
| /tmp | System cache | No change needed |

This file can live under `~/.gemini/docs/` and be updated when you run cleanup or new repairs.

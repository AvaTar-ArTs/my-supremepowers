---
name: workspace-ecosystem-audit
description: Deep inventory and purpose-aware review of local AI/agent ecosystems (.claude, .claude-server-commander, .codex, .cursor, .gemini, .grok, .qodo, .qwen). Use to index, summarize, and reason about every file beyond filenames—capture intent, code function, and configuration roles.
---

# Workspace Ecosystem Audit

## Quick Start
- Run the inventory script for target roots (defaults cover all agent dirs):
  ```bash
  python scripts/inventory.py \
    --roots /Users/steven/.claude /Users/steven/.claude-server-commander /Users/steven/.codex /Users/steven/.cursor /Users/steven/.gemini /Users/steven/.grok /Users/steven/.qodo /Users/steven/.qwen \
    --out /Users/steven/.codex/skills/workspace-ecosystem-audit/inventory.json
  ```
- Open the JSON in any viewer; sort by `type`, `ext`, `size_bytes`, or `mtime_iso` to find hotspots.
- For semantic/file-purpose review, sample paths from the manifest and read inline with `rg -n "" <path>` or `python - <<'PY' ...`.

## Workflow (batches recommended)
1. **Scan**: run `inventory.py` with `--max-hash-bytes` and `--max-preview-bytes` tuned to avoid huge files.
2. **Slice**: use jq or pandas to filter by `ext`, `type`, or `path_prefix` (per directory) for manageable batches.
3. **Read & Summarize**: for each slice, summarize intent: configs, creds placeholders, logs, caches, code, assets. Capture findings in your working notes or a new `summary_<dir>.md`.
4. **Risk/Action**: mark secrets, redundant caches, broken links, and upgrade opportunities (extensions, agents, models).
5. **Refresh**: re-run scans after changes; keep `inventory.json` versioned.

## Script Flags
- `--roots ...` space-delimited list of directories.
- `--out FILE` output JSON (default `inventory.json` in CWD).
- `--max-hash-bytes N` hash only files ≤ N bytes (default 2_000_000).
- `--max-preview-bytes N` store first N bytes of text-ish files (default 4000).
- `--follow-symlinks` to include symlink targets (default: record link only).
- `--exclude-dir-name .git .cache ...` to skip noisy trees.

## Reading Guidance
- Prioritize: configs (`*.json`, `*.toml`, `*.yaml`), agent state (`history.jsonl`, `sessions/`), extensions/plugins, and executable scripts.
- Logs/history: scan for error patterns and PII before archiving.
- Caches/models (`.cursor/extensions`, `.gemini/extensions`, `.codex/models_cache.json`): map size vs. usefulness; plan cleanup.

## References
- Targets list: `references/targets.md`
- Use `rg --files` + `rg -n` for fast content search.
- For large JSONL (histories), sample with `python - <<'PY' ...` to avoid loading whole files.

## Validation
- Optional: `python scripts/inventory.py --roots ... --out /tmp/inventory.json --max-hash-bytes 0 --max-preview-bytes 0` for fastest structural map.


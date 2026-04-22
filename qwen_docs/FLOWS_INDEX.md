# Qwen Flow Docs Index

## Core Flow Documents
- `FLOWS_RUNTIME_MAP.md` — Runtime roots, command resolution, and skill path loading order.
- `FLOWS_SYSTEMATIC_DEBUGGING.md` — End-to-end activation flow for `systematic-debugging` across Qwen and Gemini.
- `FLOWS_DEDUPE_GUARDRAILS.md` — Protected paths, archive-first dedupe policy, and post-change verification checks.

## Review Artifacts (Generated)
- `~/.qwen/review_2026-04-22_full/SUMMARY.md`
- `~/.qwen/review_2026-04-22_full/duplicate_files_by_sha256.csv`
- `~/.qwen/review_2026-04-22_full/duplicates_preview_grouped.txt`
- `~/.qwen/review_2026-04-22_full/dedupe_flow_safe_preview.txt`
- `~/.qwen/archive/cleanup_20260422_162321/manifest.csv`

## Recommended Operational Sequence
1. Read `FLOWS_RUNTIME_MAP.md`
2. Validate critical skill path in `FLOWS_SYSTEMATIC_DEBUGGING.md`
3. Apply cleanup only under `FLOWS_DEDUPE_GUARDRAILS.md`
4. Re-run runtime checks (`qwen-sp status`, `qwen-sp use systematic-debugging`)

## Runtime Check Commands
```bash
qwen-sp status
qwen-sp use systematic-debugging | head -n 40
ls -la ~/.gemini/extensions/supremepower/skills/systematic-debugging
ls -la ~/.qwen/integrations/supremepower/skills/systematic-debugging
```

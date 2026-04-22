# Inventory Databases

Date: 2026-04-16

## Purpose

Large metadata inventories should have two forms:

- Markdown reports for human orientation.
- SQLite databases for repeated questions, filtering, joins, and size/security triage.

Do not put secret file contents in these databases. They are metadata indexes only.

## Current Databases

| Database | Source JSON | Role |
|---|---|---|
| `docs/exports/home-ai-control-plane-inventory-2026-04-16.db` | `docs/exports/home-ai-control-plane-inventory-2026-04-16.json` | Query home AI/tooling, project, and secret-adjacent roots. |
| `docs/exports/macbaks-control-plane-inventory-2026-04-16.db` | `docs/exports/macbaks-control-plane-inventory-2026-04-16.json` | Query mounted backup volumes and archive roots. |

Generated inventory JSON and DB files are ignored by git by default.

## Converter

Use:

```bash
~/.qwen/scripts/inventory-to-sqlite INPUT.json OUTPUT.db
```

The converter creates:

- `inventory_meta`
- `entries`

Indexes are created for path, root prefix, file type, extension, name, and size.

## Useful Queries

Largest roots:

```bash
sqlite3 docs/exports/macbaks-control-plane-inventory-2026-04-16.db \
  "select path_prefix, count(*) as n, sum(case when type='file' then size_bytes else 0 end) as bytes from entries group by path_prefix order by bytes desc;"
```

Largest files:

```bash
sqlite3 docs/exports/macbaks-control-plane-inventory-2026-04-16.db \
  "select size_bytes, path from entries where type='file' order by size_bytes desc limit 25;"
```

Sensitive path markers:

```bash
sqlite3 docs/exports/macbaks-control-plane-inventory-2026-04-16.db \
  "select path from entries where lower(path) like '%.env%' or lower(path) like '%oauth%' or lower(path) like '%token%' or lower(path) like '%credential%' or lower(path) like '%secret%' limit 100;"
```

Files by extension:

```bash
sqlite3 docs/exports/macbaks-control-plane-inventory-2026-04-16.db \
  "select ext, count(*) from entries where type='file' group by ext order by count(*) desc limit 25;"
```

Project-specific slice:

```bash
sqlite3 docs/exports/home-ai-control-plane-inventory-2026-04-16.db \
  "select type, size_bytes, path from entries where path like '%GumRoad%' order by size_bytes desc limit 50;"
```

## What Belongs In DB Form

- Large file inventories.
- Path-level sensitive-marker scans.
- Duplicate/path convergence maps.
- Generated cross-root indexes.
- Terminal-log metadata, not raw transcript content.

## What Should Stay In Markdown

- Decisions.
- Layer policies.
- Human summaries.
- Launch checklists.
- Source-of-truth rules.
- Security handling instructions.

## Rule

Use DBs for asking questions. Use Markdown for deciding what those answers mean.

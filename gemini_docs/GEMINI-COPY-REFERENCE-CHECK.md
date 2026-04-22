# GEMINI copy.md — referenced paths existence check

**Date:** 2026-02-08  
**Source:** `~/.gemini/GEMINI copy.md`

Paths referenced in the doc were checked; below is the result.

---

## Summary

| Status | Count |
|--------|--------|
| **Exists** | 7 |
| **Missing** | 14 |
| **Alternative / note** | 3 |

---

## Per-path results

| Referenced path | Exists? | Note |
|-----------------|--------|------|
| `/Users/steven/DiGiTaLDiVe` | No | Hub dir not present at this path. |
| `INIT_DIGITAL_DIVE.md` (in DiGiTaLDiVe) | No | DiGiTaLDiVe missing. |
| `ULTIMATE_AVATARARTS_HANDOFF_2026.md` | Yes (elsewhere) | At `~/Music/nocturneMelodies/markdown/ULTIMATE_AVATARARTS_HANDOFF_2026.md`. |
| `~/clean/scanner.py` | No | `~/clean` exists; has `all.py`, `audio.py`, `docs.py`, `img.py`, `vids.py` — no `scanner.py`. Scan may use `all.py` or type-specific scripts. |
| `~/steven-scan-images-recursive-2026-01-20.csv` | No | Scan output file not found. |
| `~/steven-scan-videos-recursive-2026-01-20.csv` | No | Scan output file not found. |
| `~/reorganization_preview_2026_MASTER.csv` | Yes | Present in home. |
| `~/AVATARARTS_ENTERPRISE` | No | Example “family-based grandparent” dir; not present. |
| `REORGANIZATION_TEST_BED` (disaster recovery) | No | Not found in home. |
| `~/Pictures` | Yes | Present. |
| `~/Pictures/etsy/zips` | No | `~/Pictures/etsy` exists (thematic subdirs); no `zips` subdir. |
| `~/Pictures/gol-ia-newq` | No | Not present. |
| `/Volumes/2T-Xx/steven` | No* | *Volume not mounted or path missing at check time. |
| `/Volumes/2T-Xx` | Yes* | *Volume mounted at check time. |
| `~/pythons` | Yes | Present. |
| `~/AVATARARTS` | No | Not in home; **AVATARARTS** exists at `~/MasterxEo/AVATARARTS`. |
| `~/AI-Workspace` | No | Dir not present. |
| `~/github` | Yes | Present. |
| `~/.qwen/logs` | Yes | Present. |
| `~/.zshrc` | Yes | Present. |
| `avatar_utils.py` | — | Path not specified in doc; not found in .gemini; may live under `~/pythons` or elsewhere. |
| `19_original_ips/`, `etsy/17_valentine_designs/` | — | Under `/Volumes/2T-Xx`; not re-checked if volume unmounted. |

---

## Suggested doc updates (optional)

1. **DiGiTaLDiVe** — Doc says hub is at `~/DiGiTaLDiVe`; path is missing. Either create/move the hub there, or update the doc to the current location (if renamed/moved).
2. **Scan workflow** — Doc refers to `~/clean/scanner.py` and two CSV outputs; current layout has `~/clean` with `all.py`, `audio.py`, `docs.py`, `img.py`, `vids.py`. Update to the actual scan commands/outputs (e.g. `all.py` or `docs.py`/`img.py`/`vids.py`) and where CSVs are written.
3. **AVATARARTS** — Change “PRODUCTION_HUB: `~/AVATARARTS`” to `~/MasterxEo/AVATARARTS` (or add a note that canonical location is MasterxEo).
4. **ULTIMATE_AVATARARTS_HANDOFF_2026.md** — Add path: `~/Music/nocturneMelodies/markdown/ULTIMATE_AVATARARTS_HANDOFF_2026.md`.
5. **2T-Xx** — Paths under `/Volumes/2T-Xx` only apply when the volume is mounted; doc could note “when 2T-Xx is mounted.”

---

*Check done by listing and testing paths; volume and external paths may vary by mount state.*

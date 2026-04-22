#!/usr/bin/env bash
set -euo pipefail

cd "$(git rev-parse --show-toplevel)"

echo "== Git status =="
git status -sb

echo ""
echo "== Broken symlinks =="
python3 - <<'PY'
from pathlib import Path
root = Path('.').resolve()
b=[]
for p in root.rglob('*'):
    try:
        if p.is_symlink() and not p.exists():
            b.append(str(p))
    except Exception:
        pass
print(f"broken_symlinks={len(b)}")
for x in b[:20]:
    print(x)
PY

echo ""
echo "== JSON/TOML parse check =="
python3 - <<'PY'
import json, tomllib
from pathlib import Path
skip={'.git','node_modules','qwen_projects','qwen_debug','__pycache__','.venv','venv'}
root=Path('.').resolve()
count=0
bad=[]
for p in root.rglob('*'):
    if not p.is_file() or p.suffix not in {'.json','.toml'}:
        continue
    if any(part in skip for part in p.parts):
        continue
    count += 1
    try:
        s=p.read_text()
        json.loads(s) if p.suffix=='.json' else tomllib.loads(s)
    except Exception as e:
        bad.append((str(p), str(e).splitlines()[0]))
print(f"checked={count} invalid={len(bad)}")
for p,e in bad[:20]:
    print(p, '|', e)
PY

echo ""
echo "== Secret scan (tracked files) =="
bash scripts/scan-sensitive-patterns.sh all

echo ""
echo "Health check complete."

#!/usr/bin/env bash
set -euo pipefail

MODE="${1:-all}" # all | staged

if [[ "$MODE" == "staged" ]]; then
  mapfile -t FILES < <(git diff --cached --name-only --diff-filter=ACMRT)
else
  mapfile -t FILES < <(git ls-files)
fi

if [[ ${#FILES[@]} -eq 0 ]]; then
  echo "No files to scan."
  exit 0
fi

is_ignored_path() {
  local p="$1"
  [[ "$p" == qwen_projects/* ]] && return 0
  [[ "$p" == qwen_debug/* ]] && return 0
  [[ "$p" == node_modules/* ]] && return 0
  [[ "$p" == .git/* ]] && return 0
  return 1
}

PATTERNS=(
  'github_pat_[A-Za-z0-9_]+'
  'gh[pousr]_[A-Za-z0-9_]+'
  'AIza[0-9A-Za-z\-_]{35}'
  'ya29\.[0-9A-Za-z\-_]+'
  'xox[baprs]-[0-9A-Za-z-]+'
  'sk-[A-Za-z0-9_\-]{20,}'
  'BEGIN (RSA|EC|OPENSSH|DSA|PGP) PRIVATE KEY'
  '(?i)(access|refresh)_token["'"'"'\s:=]{1,6}["'"'"']?[A-Za-z0-9_\-\.]{16,}'
  '(?i)authorization:[[:space:]]*bearer[[:space:]]+[A-Za-z0-9_\-\.]{16,}'
)

HITS=0
for f in "${FILES[@]}"; do
  [[ -f "$f" ]] || continue
  is_ignored_path "$f" && continue

  # Skip obvious binaries
  if file "$f" | grep -qiE 'binary|image|audio|video|archive'; then
    continue
  fi

  for pat in "${PATTERNS[@]}"; do
    if rg -n --pcre2 "$pat" "$f" >/tmp/scan_hit.$$ 2>/dev/null; then
      echo "[secret-scan] Potential secret in $f"
      sed -n '1,3p' /tmp/scan_hit.$$
      HITS=$((HITS+1))
      break
    fi
  done

done
rm -f /tmp/scan_hit.$$ || true

if [[ $HITS -gt 0 ]]; then
  echo ""
  echo "Secret scan failed with $HITS potential issue(s)."
  echo "Remove/redact the values before committing."
  exit 1
fi

echo "Secret scan passed."

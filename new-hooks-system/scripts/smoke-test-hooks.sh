#!/usr/bin/env bash
set -euo pipefail

root="${HOME}/.qwen/new-hooks-system/functioning-hooks-example"

echo "[1/4] Validate hooks.json is parseable"
/usr/bin/python3 - <<'PY'
import json, pathlib
p = pathlib.Path.home() / ".qwen/new-hooks-system/functioning-hooks-example/hooks/hooks.json"
json.loads(p.read_text(encoding="utf-8"))
print("hooks.json OK")
PY

echo "[2/4] Run SessionStart handler"
bash "${root}/hooks-handlers/session-start.sh" >/dev/null
echo "session-start OK"

echo "[3/4] Run PreToolUse handler (allow path)"
CLAUDE_TOOL_INPUT="echo hello" bash "${root}/hooks-handlers/pre-tool-use.sh" >/dev/null
echo "pre-tool allow OK"

echo "[4/4] Run PostToolUse handler"
CLAUDE_TOOL_NAME="Shell" CLAUDE_TOOL_STATUS="ok" bash "${root}/hooks-handlers/post-tool-use.sh" >/dev/null
echo "post-tool audit OK"

echo "Smoke test complete."

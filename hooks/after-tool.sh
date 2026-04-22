#!/usr/bin/env bash
set -euo pipefail

INPUT_JSON="$(cat)"
LOG_DIR="$HOME/.gemini/logs"
LOG_FILE="$LOG_DIR/tool-use.jsonl"
mkdir -p "$LOG_DIR"

if command -v jq >/dev/null 2>&1; then
  echo "$INPUT_JSON" | jq -c '{
    timestamp: (.timestamp // now | todate),
    tool_name: (.tool_name // "unknown_tool"),
    tool_input: (.tool_input // {}),
    tool_response: (.tool_response // {}),
    exit_code: (.exit_code // "N/A")
  }' >> "$LOG_FILE" || true
else
  printf '{"timestamp":"%s","tool_name":"unknown_tool","note":"jq_missing"}\n' "$(date -u +%Y-%m-%dT%H:%M:%SZ)" >> "$LOG_FILE"
fi

echo "INFO: AfterTool hook logged event to ${LOG_FILE}" >&2
echo '{}'

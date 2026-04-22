#!/usr/bin/env bash
# AfterTool hook: append tool name, args, and result summary to a JSONL log file.
# Use stderr for debug; stdout must be only the final JSON (or {}).

set -euo pipefail

INPUT_JSON="$(cat)"
LOG_DIR="${GEMINI_PROJECT_DIR:-$HOME/.gemini}/logs"
LOG_FILE="${LOG_DIR}/tool-use.jsonl"

mkdir -p "$LOG_DIR"

# Extract fields (requires jq)
LINE="$(echo "$INPUT_JSON" | jq -c '{timestamp: (.timestamp // now | todate), tool_name: (.tool_name // "unknown"), tool_input: (.tool_input // {}), tool_response: (.tool_response // {})}' 2>/dev/null)" || LINE="{\"timestamp\":\"$(date -u +%Y-%m-%dT%H:%M:%SZ)\",\"tool_name\":\"unknown\",\"tool_input\":{},\"tool_response\":{}}"
echo "$LINE" >> "$LOG_FILE"

# Must output only JSON to stdout
echo '{}'
exit 0

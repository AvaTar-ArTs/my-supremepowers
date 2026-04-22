#!/usr/bin/env bash
set -euo pipefail

echo "INFO: BeforeAgent hook running..." >&2
INPUT_JSON="$(cat)"

MODE="default"
if command -v jq >/dev/null 2>&1; then
  PROMPT_TEXT="$(echo "$INPUT_JSON" | jq -r '.. | .prompt? // empty' 2>/dev/null || true)"
else
  PROMPT_TEXT=""
fi

LOWER_PROMPT="$(printf '%s' "$PROMPT_TEXT" | tr '[:upper:]' '[:lower:]')"
if [[ "$LOWER_PROMPT" == *"build"* ]] || [[ "$LOWER_PROMPT" == *"implement"* ]] || [[ "$LOWER_PROMPT" == *"code"* ]]; then
  MODE="factory"
elif [[ "$LOWER_PROMPT" == *"brainstorm"* ]] || [[ "$LOWER_PROMPT" == *"design"* ]] || [[ "$LOWER_PROMPT" == *"idea"* ]]; then
  MODE="studio"
fi

ADDITIONAL_CONTEXT=""
if [[ "$MODE" == "factory" ]]; then
  ADDITIONAL_CONTEXT="Mode: Factory. Prioritize implementation, concise code changes, and direct execution."
elif [[ "$MODE" == "studio" ]]; then
  ADDITIONAL_CONTEXT="Mode: Studio. Prioritize exploration, alternatives, and short clarifying questions."
fi

if [[ -n "$ADDITIONAL_CONTEXT" ]] && command -v jq >/dev/null 2>&1; then
  jq -cn --arg ctx "$ADDITIONAL_CONTEXT" '{hookSpecificOutput:{additionalContext:$ctx}}'
else
  echo '{}'
fi

echo "INFO: BeforeAgent hook complete (mode=${MODE})" >&2

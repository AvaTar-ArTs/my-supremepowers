#!/usr/bin/env bash

cat <<'EOF'
{
  "hookSpecificOutput": {
    "hookEventName": "SessionStart",
    "additionalContext": "Bootstrap hook active. Always resolve tasks through source-of-truth layering: canonical authoring -> adaptation layer -> runtime hook policy -> audit."
  }
}
EOF

exit 0

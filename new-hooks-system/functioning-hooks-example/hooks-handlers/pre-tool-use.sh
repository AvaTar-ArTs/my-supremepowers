#!/usr/bin/env bash

# Example fail-soft gate: block dangerous force-reset patterns
if printf '%s' "${CLAUDE_TOOL_INPUT:-}" | rg -q "git reset --hard|rm -rf /"; then
  cat <<'EOF'
{
  "decision": "block",
  "reason": "Blocked by runtime policy: dangerous command pattern detected."
}
EOF
  exit 2
fi

cat <<'EOF'
{
  "decision": "allow",
  "reason": "No blocked pattern detected."
}
EOF

exit 0

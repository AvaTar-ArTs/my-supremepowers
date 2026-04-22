#!/usr/bin/env bash

audit_dir="${HOME}/.qwen/new-hooks-system/functioning-hooks-example/audit"
audit_file="${audit_dir}/hook-audit.log"
mkdir -p "${audit_dir}"

ts="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
tool_name="${CLAUDE_TOOL_NAME:-unknown}"
status="${CLAUDE_TOOL_STATUS:-unknown}"

printf '%s tool=%s status=%s\n' "${ts}" "${tool_name}" "${status}" >> "${audit_file}"

cat <<'EOF'
{
  "decision": "logged",
  "reason": "Post-tool audit event written."
}
EOF

exit 0

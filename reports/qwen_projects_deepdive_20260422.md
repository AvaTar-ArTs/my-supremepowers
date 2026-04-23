# qwen_projects Deep Dive

Generated: 2026-04-22T20:30:18.960440

## Inventory
- Project folders with chats: 28
- Total sessions: 92
- Total size (MB): 273.9
- File type profile: mostly JSONL chat transcripts plus minimal metadata.

## Purpose Map (Top by Size)
- `-Users-steven`: general home-dir operations; sessions=33, size=91.5MB, top tool=run_shell_command
- `-Users-steven-iterm2`: ecosystem/system configuration; sessions=6, size=42.4MB, top tool=run_shell_command
- `-Users-steven-Music-nocTurneMeLoDieS`: creative/content pipeline; sessions=10, size=38.8MB, top tool=run_shell_command
- `-Users-steven-pythons`: marketplace/repo orchestration; sessions=6, size=18.1MB, top tool=run_shell_command
- `-Users-steven--cursor`: ecosystem/system configuration; sessions=3, size=9.2MB, top tool=run_shell_command
- `-Users-steven-MasterxEo`: mixed/specialized; sessions=2, size=8.7MB, top tool=run_shell_command
- `-Users-steven-scripts`: script maintenance ops; sessions=4, size=8.6MB, top tool=run_shell_command
- `-Users-steven-Downloads`: mixed/specialized; sessions=1, size=8.2MB, top tool=run_shell_command
- `-Users-steven-workspace`: ecosystem/system configuration; sessions=1, size=7.3MB, top tool=run_shell_command
- `-Users-steven-ice-tracker`: product engineering; sessions=1, size=6.5MB, top tool=run_shell_command
- `-Users-steven-ice-tracker-v7`: product engineering; sessions=1, size=5.7MB, top tool=run_shell_command
- `-Users-steven-ice-tracker-v7-backend-src-modules-data-ingestion`: product engineering; sessions=1, size=4.7MB, top tool=run_shell_command
- `-Users-steven-PYTHON-MARKETPLACE-MASTER`: marketplace/repo orchestration; sessions=1, size=4.3MB, top tool=run_shell_command
- `-Users-steven-NotebookLM`: mixed/specialized; sessions=2, size=3.7MB, top tool=run_shell_command
- `-Users-steven-iterm2-claude-ecosystem--claude-projects`: ecosystem/system configuration; sessions=1, size=3.7MB, top tool=run_shell_command

## Style Fingerprint
- Dominant style across most projects: command-driven automation (`run_shell_command` is top tool).
- Secondary style: file-centric refactoring (`read_file`, `write_file`, `edit`) with iterative todo/task updates.
- Orchestration pattern appears in some projects (`skill`, `agent`, `task` tool usage).

### Density Snapshot (selected)
- `-Users-steven`: tool%=17.9, assistant%=19.3, user%=3.0
- `-Users-steven-iterm2`: tool%=20.1, assistant%=22.7, user%=3.0
- `-Users-steven-Music-nocTurneMeLoDieS`: tool%=19.6, assistant%=12.1, user%=2.5
- `-Users-steven-pythons`: tool%=12.5, assistant%=12.0, user%=2.5
- `-Users-steven--cursor`: tool%=21.9, assistant%=25.4, user%=3.7
- `-Users-steven-MasterxEo`: tool%=16.7, assistant%=19.1, user%=2.5
- `-Users-steven-scripts`: tool%=18.8, assistant%=18.9, user%=2.7
- `-Users-steven-Downloads`: tool%=22.1, assistant%=20.2, user%=2.0
- `-Users-steven-workspace`: tool%=6.3, assistant%=7.1, user%=1.1
- `-Users-steven-ice-tracker`: tool%=22.3, assistant%=25.4, user%=3.5

## Risk Signals (Local, Ignored by Git)
- `-Users-steven`: hits=40 {'github_pat': 0, 'google_oauth': 2, 'api_key_like': 38}
- `-Users-steven-ice-tracker`: hits=23 {'github_pat': 1, 'google_oauth': 0, 'api_key_like': 22}
- `-Users-steven-PYTHON-MARKETPLACE-MASTER`: hits=17 {'github_pat': 7, 'google_oauth': 0, 'api_key_like': 10}
- `-Users-steven-Music-nocTurneMeLoDieS`: hits=16 {'github_pat': 0, 'google_oauth': 0, 'api_key_like': 16}
- `-Users-steven-pythons`: hits=12 {'github_pat': 0, 'google_oauth': 0, 'api_key_like': 12}
- `-Users-steven-scripts`: hits=5 {'github_pat': 0, 'google_oauth': 0, 'api_key_like': 5}
- `-Users-steven-p-market`: hits=4 {'github_pat': 0, 'google_oauth': 0, 'api_key_like': 4}
- `-Users-steven-ice-tracker-v7`: hits=2 {'github_pat': 1, 'google_oauth': 0, 'api_key_like': 1}
- `-Users-steven-MasterxEo`: hits=1 {'github_pat': 0, 'google_oauth': 0, 'api_key_like': 1}

## Notable Structural Observations
- Folder names encode original working directories (e.g., `-Users-steven-iterm2`).
- Distribution is highly skewed: a few projects account for most bytes/events.
- One anomalous project key `-` exists (likely root-cwd capture).

## Recommendations
1. Move `qwen_projects` runtime logs outside this repository root to reduce accidental exposure risk.
2. Add retention policy: keep last N sessions/project and archive older JSONL files.
3. Keep only summary exports in-repo (`reports/`), not raw transcript logs.
4. Split heavy projects into separate archive buckets (e.g., `general-home`, `iterm2`, `music`, `ice-tracker`) for faster analysis.

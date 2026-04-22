# Git AI — use from any agent

**Full doc:** `~/.git-ai/docs/GIT_AI_FROM_ANY_AGENT.md`

Git AI tracks AI-generated code and prompts. From any agent that can run shell commands (Cursor, Claude Code, VS Code, Aider, Codeium, Codex, Gemini, Grok, Harbor, Kimi, Ollama, Qodo, etc.) you can use the full CLI.

**Quick commands (run from a git repo with git-ai tracking):**
- `git-ai status` — you vs AI %, recent checkpoints
- `git-ai blame <file>` — line-level AI attribution
- `git-ai stats` / `git-ai stats --json` — authorship stats (optionally `main..HEAD`, `--ignore "*.lock"`)
- `git-ai diff HEAD` / `git-ai diff main..branch` — diff with 🤖/👤 per line
- `git-ai show <commit>` — authorship log
- `git-ai show-prompt <id>` — look up prompt by ID (from blame)
- `git-ai config` — view/set config (prompt_storage, allow_repositories, etc.)
- **CI:** `git-ai ci github install` — workflow for squash/rebase merge
- **Prompt analysis:** `git-ai prompts` then `git-ai prompts exec "SELECT ..."`; or in Claude Code: `/plugin add ~/.git-ai/skills` then `/git-ai:prompt-analysis`

**Official:** https://usegitai.com/docs/cli · https://usegitai.com/docs/cli/reference


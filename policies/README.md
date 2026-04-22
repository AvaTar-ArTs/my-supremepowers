# Policies

Policies control which tools the CLI is allowed to use without asking.

**Current rules** (in `auto-saved.toml`):

- **activate_skill** – Always allowed.
- **write_file** – Always allowed.
- **run_shell_command** – Allowed only when the command starts with one of:
  - `find`
  - `python3`
  - `echo`

Any other shell command (e.g. `npm install`, `ls`, `cd`) does not match these rules and falls through to default behavior (typically **ask_user** or **deny**). This keeps shell use bounded unless you add more rules or approve at prompt.

Update `auto-saved.toml` to change behavior; use higher `priority` values for rules that should override others.

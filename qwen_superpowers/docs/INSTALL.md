# Installing Superpowers for Codex (Product Bundle)

## Install Layout
This bundle assumes the following layout:
- `~/.codex/superpowers/` contains this package
- `~/.codex/skills/` contains personal skills

## Steps
1. **Copy bundle**
   ```bash
   mkdir -p ~/.codex/superpowers
   rsync -a /path/to/superpowers-codex-product/ ~/.codex/superpowers/
   ```

2. **Create personal skills directory**
   ```bash
   mkdir -p ~/.codex/skills
   ```

3. **Add bootstrap to Codex**
   Append the following to `~/.codex/AGENTS.md`:
   ```markdown
   ## Superpowers System

   <EXTREMELY_IMPORTANT>
   You have superpowers. RIGHT NOW run: `~/.codex/superpowers/bin/superpowers-codex bootstrap` and follow the instructions it returns.
   </EXTREMELY_IMPORTANT>
   ```

4. **Verify**
   ```bash
   ~/.codex/superpowers/bin/superpowers-codex bootstrap
   ```

You should see the skill listing and the `using-superpowers` skill auto-loaded.

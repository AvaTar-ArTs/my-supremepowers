# Installing `my-supremepowers` for Codex

This guide installs skills from your local `my-supremepowers` checkout.

## Prerequisites

- Codex installed
- A local repo at `/Users/steven/my-supremepowers`

## Recommended (local source of truth)

Use your current repo as the live source and symlink its `skills/` directory.

```bash
mkdir -p ~/.agents/skills
ln -sfn /Users/steven/my-supremepowers/skills ~/.agents/skills/my-supremepowers
```

Restart Codex (quit/relaunch) so skills are rediscovered.

## Alternate (clone-based)

If you want a separate clone under `~/.codex`:

```bash
git clone https://github.com/AvaTar-ArTs/my-supremepowers.git ~/.codex/my-supremepowers
mkdir -p ~/.agents/skills
ln -sfn ~/.codex/my-supremepowers/skills ~/.agents/skills/my-supremepowers
```

Restart Codex after linking.

## Verify

```bash
ls -la ~/.agents/skills/my-supremepowers
```

Expected: symlink target should be either:
- `/Users/steven/my-supremepowers/skills` (local mode), or
- `~/.codex/my-supremepowers/skills` (clone mode)

## Update

Local mode:

```bash
cd /Users/steven/my-supremepowers && git pull
```

Clone mode:

```bash
cd ~/.codex/my-supremepowers && git pull
```

## Uninstall

```bash
rm -f ~/.agents/skills/my-supremepowers
```

Optional cleanup (clone mode only):

```bash
rm -rf ~/.codex/my-supremepowers
```

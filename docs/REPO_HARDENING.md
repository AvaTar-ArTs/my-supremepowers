# Repo Hardening

## What is enabled
- `.githooks/pre-commit` runs a staged-file secret scan.
- `scripts/scan-sensitive-patterns.sh` supports `staged` and `all` modes.
- `scripts/repo-health-check.sh` runs status + symlink + config + secret checks.

## Setup on a new clone
```bash
git config core.hooksPath .githooks
```

## Run full checks manually
```bash
bash scripts/repo-health-check.sh
```

# Python / pip System Check (Intel macOS)

**Date:** 2026-02-08  
**Scope:** Why Python/pip feels like a mess — multiple runtimes, install locations, and when each gets used.

---

## 1. The short version

| Context | What runs | Where packages go |
|--------|-----------|--------------------|
| **Your interactive zsh** (terminal with .zshrc) | Python **3.12** (your chosen default) | `~/Library/Python/3.12/` |
| **Non-interactive** (Cursor “Run”, scripts, some IDEs) | **python3** → Homebrew default = **3.14** | `~/Library/Python/3.14/` |
| **System** `/usr/bin/python3` | Apple / Xcode **3.9** | Command Line Tools (don’t use for dev) |

You effectively have **two “default” Pythons**: 3.12 in the shell (via .zshrc) and 3.14 when anything runs plain `python3` without your shell. That’s why “sometimes it works, sometimes it doesn’t.”

---

## 2. What’s on the machine

### 2.1 Python runtimes

| Source | Versions | Notes |
|--------|----------|--------|
| **Apple / Xcode** | `/usr/bin/python3` → 3.9.6 | Don’t install into this; leave it for system tools. |
| **Homebrew** | 3.11, 3.12, 3.13, **3.14** | `python3` and `pip3` in `/usr/local/bin` point at **3.14** (Homebrew’s default). |
| **Python.org** | 3.12, 3.13 (Framework) | `/Library/Frameworks/Python.framework`; `python3.12-intel64` in `/usr/local/bin`. |
| **Your .zshrc** | Forces **3.12** | `python` / `python3` are shell functions → `/usr/local/opt/python@3.12/libexec/bin/python`. |

So: **four** places can provide “python” (system 3.9, Homebrew 3.11–3.14, Python.org 3.12/3.13, and your 3.12 via zsh).

### 2.2 Where pip installs go

Your `~/.config/pip/pip.conf` has:

```ini
[global]
break-system-packages = true
user = true
```

So **with your shell** (where `pip` = `python -m pip` and `python` = 3.12):

- Packages install to **user** site-packages: `~/Library/Python/3.12/lib/python/site-packages`.
- You have **497** items there (3.12), plus 233 (3.11), 143 (3.14), 10 (3.13). So you’ve been installing into 3.12, 3.11, and 3.14 depending on which `python`/`pip` was used.

When something (e.g. Cursor, or a script) runs **without** your .zshrc and uses plain `python3`/`pip3`:

- They hit **3.14** and its pip.
- Packages go to `~/Library/Python/3.14/` — different from your “daily” 3.12 installs.

That’s why e.g. whoosh/tqdm can be “installed” in one place and “not found” in another.

### 2.3 PATH and “default” Python

- **Interactive zsh:**  
  Your PATH has `/usr/local/opt/python@3.12/libexec/bin` and you define `python`/`python3` as functions → **3.12** wins.
- **Minimal env (e.g. many “Run” buttons, non-interactive scripts):**  
  Often PATH is something like `/usr/local/bin:/usr/bin:...`, no .zshrc, no functions → `python3` is the binary in `/usr/local/bin` → **3.14**.

So “default” is **3.12 in the shell, 3.14 elsewhere**.

---

## 2.4 uv (package / env manager)

| Item | Value |
|------|--------|
| **Binary** | `/usr/local/bin/uv` (Homebrew, 0.10.0) |
| **Cache** | `~/.cache/uv` |
| **Managed Pythons** | `~/.local/share/uv/python/` (e.g. cpython-3.13.12-macos-x86_64-none) |
| **Default Python when no venv** | uv can use 3.13.12 from its own cache, or the system `python` if available |

**Behavior:**

- **`uv pip`** installs only into a **virtual environment** (or with `--system`). It does **not** install into `~/Library/Python/` by default. So uv is “venv-first”; it doesn’t add to the same “global” user installs as `pip install` (which goes to Library/Python for the Python that runs pip).
- **`upip`** (your alias) = `uv pip` — same rule: use inside a project/venv or with `--system`.
- **`uv venv`** creates `.venv`; **`uv run`** uses that venv or fetches a Python (e.g. 3.13) into `~/.local/share/uv/python/`.
- **setup-project** and **venv()** in .zshrc use uv to create `.venv` when available. **venv** accepts 3.11, 3.12, or 3.13 (default 3.13); **pclean** (alias for `cleanup-project`) removes `.venv` and optionally `requirements.txt` with `-r`.

So you have **another** Python source: uv-managed 3.13 in `~/.local/share/uv/python/`, used by `uv run` when there’s no project venv. That’s separate from Homebrew 3.12/3.14 and from Library/Python.

---

## 2.5 mamba / conda (environment manager)

| Item | Value |
|------|--------|
| **Install** | Mambaforge (Caskroom): `/usr/local/Caskroom/mambaforge/base` |
| **Binaries** | `/usr/local/bin/mamba` → condabin/mamba; `/usr/local/bin/conda` (same prefix) |
| **Base Python** | **3.10.19** (mamba base env) |
| **Environments** | base, **ai-dev**, **automation-master**, **nocturnememory-ai** |

**Behavior:**

- **mamba init is commented out** in .zshrc (section 19), so conda/mamba are **not** auto-initialized. That means:
  - `mamba` and `conda` are on PATH (symlinks from Caskroom), so commands run.
  - **Activation** (`mamba activate ai-dev`) may not fully work unless you’ve run `source /usr/local/Caskroom/mambaforge/base/etc/profile.d/mamba.sh` in that shell (or uncommented the mamba block). Without it, prompt and env vars (CONDA_PREFIX, etc.) might not be set correctly.
- Your aliases **ai-dev**, **ai-env**, **env-list**, **pkg-list** call mamba/conda; they assume mamba is available. For **ai-dev** / **ai-env** to work reliably, you need to either uncomment the mamba init block or run the `source ... mamba.sh` once per shell before using `mamba activate`.
- PATH is explicitly **stripped** of conda/mamba’s `condabin` in section 4 (so they stay opt-in and don’t inject into every new shell).

So: **five** Python “stacks” in play — system 3.9, Homebrew 3.11–3.14, Python.org 3.12/3.13, your zsh default 3.12, **uv-managed 3.13**, and **mamba base 3.10** (+ envs). Pip user installs only apply to the Homebrew/Python.org Pythons (3.11–3.14); uv and mamba use their own install locations.

---

## 3. Why it feels like a mess

1. **Two different defaults**  
   Shell = 3.12; many tools = 3.14. Same command (`python3`, `pip install`) can mean different Pythons and different site-packages.

2. **Four Python “families”**  
   System 3.9, Homebrew 3.11–3.14, Python.org 3.12/3.13, and your chosen 3.12. Easy to accidentally use the wrong one.

3. **User installs spread across versions**  
   ~/Library/Python/ has 3.11 (233), 3.12 (497), 3.13 (10), 3.14 (143). No single “global” user env; each version has its own.

4. **Homebrew’s default is 3.14**  
   So any script or tool that doesn’t load .zshrc and just runs `python3` gets 3.14, not the 3.12 you use in the terminal.

5. **pip.conf `user = true`**  
   Good for not touching system/Homebrew prefixes, but it applies to *whichever* Python runs pip — so you get user installs in 3.11, 3.12, 3.14 depending on context.

6. **uv** adds its own managed Python (e.g. 3.13) and is venv-first; **mamba** adds base 3.10 and named envs (ai-dev, etc.) but init is off, so activation is opt-in and easy to forget. So “which Python?” depends on: shell default (3.12), non-interactive (3.14), uv run (uv’s 3.13 or project .venv), or mamba (3.10 base or an env).

---

## 4. Recommendations (Intel macOS)

### A. Pick one “daily” Python and use it explicitly

- You’ve already chosen **3.12** in the shell. Stick with it for global/user installs.
- In scripts or automation, **avoid** bare `python3` when you care which Python runs. Use an explicit path or ensure the right env is loaded:
  - e.g. `/usr/local/opt/python@3.12/libexec/bin/python3`  
  - or run the script from a shell that has already sourced .zshrc (interactive zsh).

### B. Stop relying on “whatever python3 is” outside the shell

- For Cursor / IDEs: either configure the project/interpreter to **Python 3.12** (and point it at Homebrew 3.12 or at `~/Library/Python/3.12` if needed), or run commands in the integrated terminal (which uses your zsh and thus 3.12).
- For one-off runs (e.g. Whoosh indexer): run from a real terminal in a zsh that has loaded .zshrc, or call the explicit interpreter:
  ```bash
  /usr/local/opt/python@3.12/libexec/bin/python3 /Users/steven/Documents/whoosh-search-index/index_documents.py /Users/steven --reindex
  ```

### C. Consider uninstalling Homebrew’s default `python` (3.14) if you don’t want it as default

- Then `/usr/local/bin/python3` would no longer point at 3.14. You’d rely on your .zshrc for “default” in the shell and on explicit `python3.12` / `python3.13` for everything else.
- Only do this if you’re sure nothing expects `python3` = 3.14:
  ```bash
  brew unlink python@3.14
  ```
- To restore later: `brew link python@3.14`.

### D. Optional: one global “user” Python and venvs for the rest

- Use **one** version (e.g. 3.12) for all `pip install --user` and keep using that same interpreter for “global” tools (whoosh, tqdm, etc.).
- Use **venvs** (or uv/poetry) for project-specific stacks so project A doesn’t depend on whatever’s in ~/Library/Python.

### E. pip.conf

- Keeping `user = true` is fine and avoids writing into Homebrew’s prefix.
- `break-system-packages = true` is only relevant if you ever run pip against a system-managed Python; with your current setup it’s optional. You can leave it if you never touch `/usr/bin/python3` with pip.

---

## 5. Quick reference

| I want to… | Do this |
|------------|--------|
| Use “my” Python (3.12) in terminal | Already done: just use `python` / `python3` in zsh. |
| Run a script with 3.12 no matter what | ` /usr/local/opt/python@3.12/libexec/bin/python3 script.py ` |
| Install a package “globally” for 3.12 | In your normal zsh: `pip install <pkg>` (already 3.12). |
| See where a tool would run | `python -c "import sys; print(sys.executable)"` (in the same context where you run the tool). |
| See which site-packages are used | `python -c "import sys; print([p for p in sys.path if 'site-packages' in p])"`. |
| Use uv in a project | `uv venv` then `uv pip install <pkg>` or `uv run python script.py`. |
| Use mamba env (e.g. ai-dev) | First `source /usr/local/Caskroom/mambaforge/base/etc/profile.d/mamba.sh`, then `mamba activate ai-dev`. Or uncomment mamba init in .zshrc. |
| Create project .venv (3.11–3.13) | `venv` or `venv 3.12` — uses uv when available; default Python is 3.13. |
| Remove .venv and optionally requirements | `pclean` (alias for `cleanup-project`); `pclean . --remove-reqs` to also remove requirements.txt. |
| See uv’s managed Pythons | `ls ~/.local/share/uv/python/`. |
| See mamba envs | `conda env list` (with mamba on PATH; base must be usable). |

---

## 6. Full checkup summary (Python + pip + uv + mamba)

| Stack | Where | Default / Notes |
|-------|--------|------------------|
| **System** | `/usr/bin/python3` | 3.9 — don’t use for dev. |
| **Homebrew** | `/usr/local/bin/python3`, `python3.12`, etc. | `python3` → **3.14**; your .zshrc overrides to **3.12** in the shell. |
| **Python.org** | `/Library/Frameworks/Python.framework` | 3.12, 3.13 (e.g. python3.12-intel64). |
| **pip (user)** | `~/Library/Python/{3.11,3.12,3.13,3.14}/` | Which one depends on which `python` ran pip (often 3.12 in shell, 3.14 elsewhere). |
| **uv** | `~/.cache/uv`, `~/.local/share/uv/python/` | Venv-first; managed Python e.g. 3.13; `uv pip` needs a venv or `--system`. |
| **mamba/conda** | `/usr/local/Caskroom/mambaforge/base` | Base **3.10**; envs: base, ai-dev, automation-master, nocturnememory-ai. Init **commented out** → activate only after `source .../mamba.sh` or uncomment init. |

**uv:** No conflict with pip if you use uv only inside venvs or with `--system` intentionally. Your `upip` alias is for uv’s pip; `pip` stays “python -m pip” (3.12 in shell). Keep using uv for project .venvs; for “global” CLI tools you can use `pip install` (3.12) or `uv tool install` if you prefer.

**mamba:** To make **ai-dev** / **ai-env** work every time without thinking, either uncomment the mamba init block in .zshrc (section 19) or add a one-liner in .zshrc that sources `.../mamba.sh` only when you need it (e.g. before running `mamba activate`). Right now mamba is on PATH but activation hooks aren’t loaded by default.

---

## 7. Summary

- **Why it’s a mess:** Two defaults (3.12 in zsh, 3.14 in non-interactive), multiple Python families (system, Homebrew, Python.org, uv-managed, mamba), and user installs spread across 3.11/3.12/3.13/3.14. uv and mamba add more Pythons and install locations; mamba init is off so env activation is manual.
- **Fix conceptually:** Treat 3.12 as the one “global” user Python for pip; use uv for project venvs; decide once whether to enable mamba init (so `mamba activate` works) or keep it opt-in with an explicit `source .../mamba.sh` when needed.
- **Fix practically:** Run “global” tools (Whoosh, etc.) from a terminal that has loaded .zshrc, or call `python3.12` explicitly; point IDEs at Python 3.12 when you want the same packages as your shell; for mamba, either uncomment init or run `source /usr/local/Caskroom/mambaforge/base/etc/profile.d/mamba.sh` before `mamba activate`.

---

## 8. Fixes and suggestions (action list)

| # | Suggestion | Effort | What to do |
|---|------------|--------|------------|
| 1 | **Use Python 3.12 explicitly outside the shell** | Low | Use the `run12` helper (added to .zshrc) or full path when running scripts from Cursor/automation: `run12 script.py` or `python3.12 script.py`. |
| 2 | **Make mamba activation reliable** | Low | Run `mamba-on` once in a shell before `mamba activate ai-dev` (helper added to .zshrc), or uncomment the mamba init block if you want conda/mamba in every new shell. |
| 3 | **Point Cursor/IDE at Python 3.12** | Low | In Cursor: set interpreter to `/usr/local/opt/python@3.12/libexec/bin/python3` so Run/Debug see the same packages as your terminal. |
| 4 | **Stop non-interactive defaulting to 3.14** | Done | You already ran `brew unlink python@3.14`. So `/usr/local/bin/python3` no longer points at 3.14; scripts that need a default should use `python3.12` or `run12`, or run in a shell that loads .zshrc. To restore: `brew link python@3.14`. |
| 5 | **One “global” Python for CLI tools** | Done | You already use 3.12 in the shell; keep using `pip install` there. Use uv for project venvs only. |
| 6 | **Optional: PATH for user CLIs outside zsh** | Low | If a non-zsh context (e.g. launchd) needs `tqdm` etc., add `~/Library/Python/3.12/bin` to that env. Not needed for normal zsh. |

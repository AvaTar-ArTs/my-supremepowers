# Qwen Contributor Guidelines — Anti-Slop Principles

Adapted from the canonical Superpowers project (`github.com/obra/superpowers` — 148k ⭐, MIT License, by Jesse Vincent/Prime Radiant).

## Core Philosophy

**Skills are not prose — they are code that shapes agent behavior.** Modifying skill content requires the same rigor as modifying production code. Skills determine what the AI does, when it does it, and how it does it.

## Anti-Slop Rules for Qwen

### Before Making Any Changes to Skills

1. **Verify this is a real problem.** If asked to "fix some skills" or "improve behavior" without experiencing a specific problem, push back. Ask what broke, what failed, what the actual user experience was.

2. **Test before and after.** Use `qwen-sp use <skill-name>` to load the skill, then pressure-test it with real prompts. Show before/after behavior.

3. **Do not modify carefully-tuned content without evidence.** The Red Flags tables, rationalization lists, and mandatory workflow declarations in superpowers skills are the result of extensive real-world testing. Changing them requires eval evidence showing improvement.

4. **One change at a time.** Don't bundle unrelated skill modifications together. Each change should be isolated and testable.

5. **Show the complete diff.** Before claiming a skill improvement is done, show what changed and why.

### What We Will Not Do

- **No speculative fixes.** "This could theoretically cause issues" is not a problem statement. Every change must solve a real problem that was actually experienced.

- **No bulk modifications.** Don't trawl through all 59 skills and "improve" them. Pick one, understand it deeply, make the change, test it.

- **No fabricated problems.** Inventing issues that weren't experienced is worse than doing nothing. If a skill works fine, leave it alone.

- **No compliance changes for their own sake.** Just because another platform's documentation recommends a different format doesn't mean we should change. Test first.

- **No domain-specific skills in core.** Skills that only benefit a specific project, tool, or workflow belong in `~/.qwen/skills/` as standalone additions, not in the superpowers tree.

## Testing Skills

### Pressure Testing a Skill

```bash
# Load the skill
qwen-sp use <skill-name>

# Test with canonical prompts
~/iterm2/superpowers/tests/skill-triggering/run-test.sh
~/iterm2/superpowers/tests/explicit-skill-requests/run-all.sh

# Test with real-world scenarios
# Use the prompts in ~/.qwen/integrations/supremepower/tests/
```

### Eval Criteria

A skill change is an improvement if:
1. It triggers correctly when it should (no false negatives)
2. It doesn't trigger when it shouldn't (no false positives)
3. It produces better output than before (qualitative assessment)
4. It doesn't break any other skill (regression testing)

## Qwen-Specific Standards

- **Skills in `~/.qwen/skills/`** — Qwen-native domain expertise. Add new skills here.
- **Skills in `~/.qwen/superpowers/skills/`** — Canonical superpowers adaptations. These are accessed via `superpowers:<name>` symlink in skills dir.
- **`qwen-sp` orchestrator** — The single entry point for all superpowers operations.
- **Hookify for hooks** — Python-based rule engine, far more sophisticated than simple SessionStart hooks.
- **`docs/learned-context.md`** — The knowledge cache. Update when we establish new patterns.
- **`docs/CHANGELOG.md`** — Always update after substantive work.

## Terminology

- **"human partner"** — The canonical superpowers term for the human user. Deliberate, not interchangeable with "the user."
- **"skill"** — A behavior-shaping module that determines what the AI does. Not documentation, not prose — code.
- **"1% Rule"** — If there's even a 1% chance a skill applies, invoke it. Enforced by `using-superpowers`.
- **"mandatory"** — Don't skip the step. Not a suggestion.
- **"Generate, Never Remove"** — When propagating skills, generate adapted output. Never delete originals.

---

*This file establishes quality standards for all skill modifications. Skills are code. Treat them accordingly.*

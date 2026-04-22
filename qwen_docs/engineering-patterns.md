# Engineering Patterns from ~/.qwen Ecosystem

Learned from deep analysis of hookify, superpowers, and plugin infrastructure code.
Captured 2026-04-12 — before orphaned versions were deleted.

---

## 1. Hookify Rule Engine Architecture

### Source
`hookify/2cd88e7947b7/core/rule_engine.py` + `core/config_loader.py`

### Pattern: Conditional Rule Evaluation Pipeline
```
Load rules → Match tool → Check conditions → Accumulate results → Allow/Block/Warn
```

**Key Design:**
- **Tool Matcher**: `"Bash"`, `"Edit|Write"`, `"*"` — pipe-delimited OR matching
- **Conditions**: All must match (AND logic). Operators: `regex_match`, `contains`, `equals`, `not_contains`, `starts_with`, `ends_with`
- **Actions**: `warn` (show message, allow), `block` (deny operation)
- **Field Extraction**: Normalizes tool-specific fields behind unified interface
  - Bash → `command`
  - Write → `content` or `new_string`
  - Edit → `old_string`/`new_string`
  - MultiEdit → concatenates all edits
  - Stop → `reason`, `transcript` (reads file from path)
  - UserPromptSubmit → `user_prompt`

### Pattern: Graceful Degradation in Hooks
Every hook handler wraps everything in `try/except/finally` with `sys.exit(0)`:
```python
finally:
    sys.exit(0)  # NEVER block user operations on hook errors
```

**Principle:** A hook failure must never prevent the user from working. Log the error, output nothing (or a warning), but always allow the operation.

### Pattern: LRU-Cached Regex Compilation
```python
@lru_cache(maxsize=128)
def compile_regex(pattern: str) -> re.Pattern:
    return re.compile(pattern, re.IGNORECASE)
```
Hot-path optimization. Regex patterns repeat across rule evaluations — cache the compiled versions.

### Pattern: Forward-Compatible Data Migration
```python
# New style: explicit conditions list
if 'conditions' in frontmatter:
    conditions = [Condition.from_dict(c) for c in cond_list]
# Legacy style: simple pattern → auto-convert
elif simple_pattern:
    conditions = [Condition(field=inferred_field, operator='regex_match', pattern=simple_pattern)]
```
Parse-time migration. Old rule formats work alongside new ones without migration scripts.

### Pattern: Custom YAML Frontmatter Parser (Zero Dependencies)
The `extract_frontmatter()` function parses YAML-like frontmatter without PyYAML:
- Handles nested lists of dictionaries
- Preserves indentation for multi-line dict items
- Supports inline comma-separated dicts: `- field: command, operator: regex_match`
- Boolean conversion: `"true"` → `True`, `"false"` → `False`

**Use when:** You need YAML parsing in a script where adding `pyyaml` dependency is undesirable.

---

## 2. Event-Driven Hook System

### Source
`hookify/2cd88e7947b7/hooks/{pretooluse,posttooluse,stop,userpromptsubmit}.py`

### Pattern: Thin Adapters → Fat Core
Each hook handler is ~30 lines:
```python
input_data = json.load(sys.stdin)
event = classify_event(input_data)
rules = load_rules(event=event)
result = RuleEngine().evaluate_rules(rules, input_data)
print(json.dumps(result))
sys.exit(0)
```

All four hooks share the same structure — only the `event` classification differs. The core logic lives in `rule_engine.py` and `config_loader.py`.

**Principle:** Keep event adapters thin. Put logic in shared engine. This makes adding new hook types trivial (just add a new 30-line adapter).

---

## 3. Soft Deletion with Timestamp Markers

### Source
`.orphaned_at` files across 37 directories

### Pattern: Mark, Don't Delete
```
# .orphaned_at content: 1770329974165 (Unix millisecond timestamp)
```

Instead of deleting superseded plugin versions, mark them with a timestamp file. Benefits:
- **Reversible**: Remove `.orphaned_at` to re-activate
- **Reference**: Content preserved for comparison/rollback
- **Auditable**: Timestamp shows when and in what order things were superseded
- **Safe cleanup**: Script can safely delete anything with `.orphaned_at` older than N days

**Use when:** Managing versioned configurations where rollback may be needed.

---

## 4. Version-Pinned Plugin Copies

### Source
Plugin directories with hash IDs: `2cd88e7947b7/`, `27d2b86d72da/`, etc.

### Pattern: Hash-Based Version Identity
Each MCP/plugin source creates a copy with a unique hash ID. The hash serves as:
- **Identity**: Unique across all versions, even if content is identical
- **Lifecycle tracker**: Active vs orphaned status tracked per hash
- **Rollback target**: Any hash can be restored by removing its `.orphaned_at`

**Active version resolution:** `latest/` symlink → most recent hash directory.

---

## 5. Custom YAML Parser for Frontmatter

### Source
`hookify/2cd88e7947b7/core/config_loader.py` → `extract_frontmatter()`

### Pattern
When you need to parse YAML frontmatter from Markdown files without external dependencies:

1. Split on `---` markers (first and second occurrence)
2. Parse line-by-line tracking indentation level
3. Handle three cases:
   - Top-level `key: value` pairs
   - List items starting with `-`
   - Indented dict continuation under list items
4. Convert `"true"`/`"false"` strings to booleans
5. Return `(frontmatter_dict, message_body)` tuple

**Limitation:** Not a full YAML parser. Handles the subset used in frontmatter (simple values, lists, lists of inline dicts). For complex YAML, use `pyyaml`.

---

## 6. Supremepower Orchestrator Architecture

### Source
`~/.gemini/extensions/supremepower/scripts/gemini-sp` + `wrapper-lib.js` + `core/orchestration/`

### Pattern: Prompt Enhancement Pipeline
```
User message → Detect complexity → Activate agents → Prepend personas → Send to LLM
```

**Agent Activation Scoring** (from `agent-matcher.js`):
- Direct hints (e.g., "requires X expertise"): +10 points
- Subtle hints (e.g., "consider X"): +5 points
- Conditional blocks: +20 points
- Threshold: score > 8 = activated

**Principle:** Natural language → keyword matching → scored agent selection. Simple but effective for routing multi-agent systems.

---

## 7. Superpowers Skill Discovery

### Source
`lib/skills-core.js` → `find_skills_in_dir()`, `resolve_skill_path()`

### Pattern: Skill Resolution with Shadowing
```
Personal skills (override) → Superpowers skills (fallback)
```

When a skill name exists in both locations, personal skills win. This is the same pattern as:
- Git config (local → global → system)
- CSS specificity
- DNS resolution

**Use when:** Building extensible systems where users need to override default behaviors.

---

*These patterns were extracted from active code before orphaned versions were deleted.
The active `2cd88e7947b7/` hookify version contains all evolved logic — orphans were snapshots, not improvements.*

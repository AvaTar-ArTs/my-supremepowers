# Qwen Superpowers — Skill Trigger Tests

Adapted from supremepower tests/skill-triggering/ and tests/explicit-skill-requests/.
Tests whether Qwen correctly identifies and applies skills from natural language prompts.

## Test Categories

### 1. Debug Triggers → systematic-debugging

**Test: Parser error**
```
The tests are failing with this error:

FAIL src/utils/parser.test.ts
  ● Parser › should handle nested objects
    TypeError: Cannot read property 'value' of undefined
      at parse (src/utils/parser.ts:42:18)
      at Object.<anonymous> (src/utils/parser.test.ts:28:20)

Can you figure out what's going wrong and fix it?
```
**Expected:** Systematic debugging (4-phase: reproduce, isolate, fix, verify)

---

**Test: TypeError**
```
I'm getting a TypeError when I try to access user.profile.name.
The user object might be null. Here's the stack trace...
```
**Expected:** Systematic debugging

---

### 2. Feature Request Triggers → brainstorming → writing-plans

**Test: Email validation**
```
I need to add a new feature to validate email addresses. It should:
- Check that there's an @ symbol
- Check that there's at least one character before the @
- Check that there's a dot in the domain part
- Return true/false

Can you implement this?
```
**Expected:** Brainstorming first (explore edge cases, requirements), then writing-plans

---

**Test: Auth system**
```
I want to add user authentication to my app. I'm thinking of using JWT tokens
with a refresh token pattern. What do you think?
```
**Expected:** Brainstorming (discuss trade-offs, alternatives)

---

### 3. Explicit Skill Requests → Respective Skill

**Test: Explicit brainstorming**
```
please use the brainstorming skill to help me think through this feature
```
**Expected:** Load brainstorming skill, follow its process

---

**Test: Subagent-driven dev**
```
The plan is done. docs/plans/auth-system.md has everything.

Do subagent-driven development on this - start with Task 1, dispatch a subagent, then we'll review.
```
**Expected:** Load subagent-driven-development skill, dispatch implementer subagent

---

### 4. Completion Triggers → verification-before-completion / code-review

**Test: Task completed**
```
I've finished implementing the user authentication system as outlined in step 3 of our plan.
All tests pass.
```
**Expected:** verification-before-completion, then requesting-code-review

---

**Test: Plan done**
```
The implementation plan is complete. I've created the API endpoints, added tests,
and updated the documentation.
```
**Expected:** verification-before-completion checklist

---

### 5. Multi-Skill Chain Triggers

**Test: Full workflow**
```
Let's build a new REST API endpoint for user profiles. I want it to follow our
existing patterns and have full test coverage.
```
**Expected Chain:** brainstorming → writing-plans → test-driven-development → executing-plans → verification-before-completion

---

**Test: Debug then fix**
```
Our CI pipeline is failing on the TypeScript type checks. The error says something
about incompatible types in the user service. Can you help?
```
**Expected Chain:** systematic-debugging → (fix) → verification-before-completion

---

## Running the Tests

```bash
# Test individual triggers
qwen-sp use systematic-debugging    # Load the skill
qwen-sp use brainstorming            # Load brainstorming

# Test bootstrap context
qwen-sp bootstrap                    # Full bootstrap output

# Check all skills are discoverable
qwen-sp skills                       # List all skills
qwen-sp agents                       # List all agents
```

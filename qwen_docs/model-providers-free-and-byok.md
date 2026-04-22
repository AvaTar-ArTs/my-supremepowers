# Model providers: free tiers, OSS, and BYOK for Qwen Code

**Canonical path:** `~/.qwen/docs/model-providers-free-and-byok.md`  
**Convenience link:** `~/model-providers-free-and-byok.md` → symlink to this file (update here only).

This document is the **implementation reference** for Custom API Key / BYOK setups in [Qwen Code](https://qwenlm.github.io/qwen-code-docs/). It matches the current `modelProviders` block in `~/.qwen/settings.json` and explains how to extend it safely.

---

## Official Qwen references

- [Model Providers](https://qwenlm.github.io/qwen-code-docs/en/users/configuration/model-providers/) — `modelProviders` schema, `envKey`, precedence, deprecation of `security.auth.apiKey` / `baseUrl`.
- [Authentication](https://qwenlm.github.io/qwen-code-docs/en/users/configuration/auth/) — Qwen OAuth vs Coding Plan vs API Key flows.
- [Settings](https://qwenlm.github.io/qwen-code-docs/en/users/configuration/settings/) — `security.auth.selectedType`, `security.auth.enforcedType`, `security.auth.useExternal`.

---

## How to think about “free” vs “open source”

| Kind | Examples | Cost | Notes |
|------|-----------|------|--------|
| **OSS models you run yourself** | [Ollama](https://ollama.com/), LM Studio, vLLM, llama.cpp servers | **$0** per API call; you pay electricity / hardware | Uses the **OpenAI-compatible** HTTP API. Many servers **ignore** the API key or accept a **placeholder** (e.g. `ollama`). |
| **Hosted “free tier” (not OSS infra)** | [Groq](https://console.groq.com/), [Google AI Studio / Gemini](https://aistudio.google.com/), [OpenRouter](https://openrouter.ai/) `:free` models | **$0** within vendor quotas | You still create an **API key** at the vendor. Rate limits and model lists change over time. |
| **Open weights on proprietary hosts** | Groq, Together, etc. | Often **free or cheap** dev tiers | Model **weights** may be open; the **service** is proprietary. |
| **Paid proprietary APIs** | OpenAI, Anthropic | Paid (usage-based) | Typical default for production coding; keys in env, never in chat logs. |

**Security rule:** Never commit API keys. Prefer `~/.env.d/*.env` (modular) and/or `~/.qwen/.env` (see below). Do not paste keys into agents, tickets, or `settings.json` `env` blocks if the repo is synced.

---

## How this machine is wired (today)

| Piece | Role |
|--------|------|
| `~/.qwen/settings.json` | Declares `security.auth.selectedType` and `modelProviders` (`openai`, `gemini`, `anthropic`). Each model entry needs **`id`**, **`envKey`**, and optional **`baseUrl`**. |
| `~/.env.d/llm-apis.env` | Holds named keys (`OPENAI_API_KEY`, `GROQ_API_KEY`, …). **Source of truth** for many tools. |
| `~/.qwen/.env` | Symlink → `~/.env.d/llm-apis.env` so Qwen Code loads the same variables when it reads `~/.qwen/.env`. |
| `/model` in Qwen Code | Switches active model; selection must match an entry whose **`envKey`** is set in the environment. |

If a provider fails after an upgrade, check that **`id`** is still valid for that vendor (Groq and OpenRouter retire/rename models regularly).

---

## Implementing in Qwen Code (operator checklist)

1. **Put keys in env (not in chat)**  
   Add or update variables in `~/.env.d/llm-apis.env` (or another file you symlink / load). Example placeholders only:
   - `OPENAI_API_KEY=...`
   - `GROQ_API_KEY=...`
   - `OPENROUTER_API_KEY=...`
   - `OLLAMA_API_KEY=ollama` (placeholder for local Ollama)
   - `GEMINI_API_KEY=...`
   - `ANTHROPIC_API_KEY=...`

2. **Ensure Qwen sees those variables**  
   - Preferred: keep `~/.qwen/.env` → `~/.env.d/llm-apis.env` (symlink).  
   - Alternative: launch `qwen` from a shell that already `source`s `~/.env.d/loader.sh` or equivalent.

3. **Edit `~/.qwen/settings.json`**  
   Under `modelProviders`, use the correct **top-level key**:
   - **`openai`** — OpenAI-compatible URL (OpenAI, Groq, OpenRouter, Ollama, Mistral, DeepSeek, Together, …).
   - **`gemini`** — Google GenAI SDK shape; see Qwen model-providers doc for `baseUrl` / fields.
   - **`anthropic`** — Native Anthropic API.

4. **Set defaults (optional)**  
   - `model.name` — default model `id` when Qwen starts (must match a configured `id` for the active auth path).  
   - `fastModel` — smaller/faster default where supported.  
   - `security.auth.selectedType` — e.g. `openai` for OpenAI-compatible default; you can still pick Gemini/Anthropic models in `/model` when those blocks exist (per Qwen behavior; if something fails, switch `selectedType` to match the protocol you need).

5. **Verify**  
   Run `qwen`, then `/model`, pick a model, send a short prompt. If you get 401/403, the **`envKey`** is missing or wrong for that provider.

---

## What is already configured (snapshot)

Values below mirror **`~/.qwen/settings.json`** as of the last doc sync. **IDs** are what the upstream API expects—if an ID 404s, replace it in settings after checking the vendor’s model list.

### `modelProviders.openai`

| `id` (sent to API) | `envKey` | `baseUrl` |
|--------------------|----------|-----------|
| `gpt-4o` | `OPENAI_API_KEY` | `https://api.openai.com/v1` |
| `gpt-4o-mini` | `OPENAI_API_KEY` | `https://api.openai.com/v1` |
| `llama-3.3-70b-versatile` | `GROQ_API_KEY` | `https://api.groq.com/openai/v1` |
| `meta-llama/llama-3.3-70b-instruct:free` | `OPENROUTER_API_KEY` | `https://openrouter.ai/api/v1` |
| `qwen2.5-coder:7b` | `OLLAMA_API_KEY` | `http://localhost:11434/v1` |

**Groq:** [OpenAI compatibility](https://console.groq.com/docs/openai) — confirm current model IDs.  
**OpenRouter:** [Free models](https://openrouter.ai/models?q=free) — `:free` slugs and daily limits are policy-dependent.  
**Ollama:** `ollama pull qwen2.5-coder:7b` then `ollama serve`; change `id` if you use another tag.

### `modelProviders.gemini`

| `id` | `envKey` | `baseUrl` |
|------|----------|-----------|
| `gemini-2.0-flash` | `GEMINI_API_KEY` | `https://generativelanguage.googleapis.com` |

Key: [Google AI Studio](https://aistudio.google.com/apikey).

### `modelProviders.anthropic`

| `id` | `envKey` | `baseUrl` |
|------|----------|-----------|
| `claude-3-5-haiku-20241022` | `ANTHROPIC_API_KEY` | `https://api.anthropic.com/v1` |

Paid; useful as a **low-cost** Claude option.

---

## Adding more OpenAI-compatible providers (templates)

Qwen’s **`openai`** auth type is for any endpoint that speaks the **OpenAI Chat Completions**-style API. Add another object to `modelProviders.openai` with a **unique `id`** (that exact string is sent to the provider).

**Duplicate `id` warning:** Qwen does not support two entries with the same `id` under the same auth type; the first wins. Use the vendor’s real model string as `id`.

### Together AI

```json
{
  "id": "meta-llama/Llama-3.3-70B-Instruct-Turbo",
  "name": "Llama 3.3 70B (Together)",
  "envKey": "TOGETHER_API_KEY",
  "baseUrl": "https://api.together.xyz/v1"
}
```

Confirm model slug on [Together models](https://api.together.xyz/models).

### Mistral API

```json
{
  "id": "mistral-small-latest",
  "name": "Mistral Small (latest)",
  "envKey": "MISTRAL_API_KEY",
  "baseUrl": "https://api.mistral.ai/v1"
}
```

### DeepSeek

```json
{
  "id": "deepseek-chat",
  "name": "DeepSeek Chat",
  "envKey": "DEEPSEEK_API_KEY",
  "baseUrl": "https://api.deepseek.com/v1"
}
```

### xAI (Grok)

```json
{
  "id": "grok-2-latest",
  "name": "Grok (xAI)",
  "envKey": "XAI_API_KEY",
  "baseUrl": "https://api.x.ai/v1"
}
```

**Always** set the matching variable in `~/.env.d/llm-apis.env` (or your chosen secret store).

### LM Studio (local)

Same pattern as Ollama; default is often `http://localhost:1234/v1` with a dummy key:

```json
{
  "id": "your-local-model-name",
  "name": "LM Studio (local)",
  "envKey": "LMSTUDIO_API_KEY",
  "baseUrl": "http://localhost:1234/v1"
}
```

Use the model name LM Studio exposes to OpenAI-compatible clients.

---

## Alibaba Cloud Coding Plan (optional, paid)

Not free; documented here because Qwen steers ex–OAuth users to it.

- Interactive: `qwen auth coding-plan` or `/auth` → Coding Plan.
- Manual pattern: `modelProviders.openai` with `envKey` `BAILIAN_CODING_PLAN_API_KEY` and region-specific `baseUrl` (`https://coding.dashscope.aliyuncs.com/v1` vs `https://coding-intl.dashscope.aliyuncs.com/v1`). See [Authentication](https://qwenlm.github.io/qwen-code-docs/en/users/configuration/auth/).

---

## Troubleshooting

| Symptom | Likely cause |
|---------|----------------|
| 401 / Invalid API key | Variable named in `envKey` not set for the Qwen process, or wrong key. |
| 404 / model not found | `id` deprecated; update from vendor docs. |
| Connection refused (Ollama/LM Studio) | Server not running or wrong port in `baseUrl`. |
| Gemini errors | Wrong `baseUrl` or wrong `id` for GenAI; compare with Qwen’s [model providers](https://qwenlm.github.io/qwen-code-docs/en/users/configuration/model-providers/) Gemini example. |
| Anthropic errors | `id` must be a real Claude model id for your account tier. |

---

## For Qwen agents (implementation contract)

When the user asks to “add provider X”:

1. Read `~/.qwen/settings.json` → `modelProviders`.
2. Confirm **`authType` key** (`openai` | `gemini` | `anthropic`).
3. Add `{ "id", "envKey", "baseUrl"? , "name"?, "description"? }`; **`envKey` is required** per Qwen docs.
4. Never write secrets into `settings.json`; use `~/.env.d/` or `~/.qwen/.env`.
5. Tell the user to run `/model` and send a test message.
6. Update **this file** if the change is meant to be durable documentation.

---

## Changelog pointer

Ecosystem changelog: `~/.qwen/docs/CHANGELOG.md` — log material edits to `settings.json` or this guide there when appropriate.

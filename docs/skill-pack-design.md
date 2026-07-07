# Skill Pack Design

Project OS Skills are intentionally split into small skills instead of one giant methodology prompt.

## Why split the pack?

A single large skill becomes vague and hard to trigger.

Small skills make agent behavior more precise:

- `project-os-thinking` handles product/system thinking.
- `moat-first-ai-product` handles AI product defensibility.
- `adr-driven-architecture` handles explicit technical decisions.
- `clean-boundary-engineering` handles implementation boundaries.
- `blackbox-contract-security` handles sensitive field protection.
- `runbook-first-ops` handles deployment and operations.
- `qa-as-asset` handles test assets and regression memory.
- `postmortem-knowledge-base` handles incident learning.

## Recommended use order

For a new product:

```text
project-os-thinking
  -> moat-first-ai-product
  -> adr-driven-architecture
  -> clean-boundary-engineering
  -> blackbox-contract-security
  -> qa-as-asset
  -> runbook-first-ops
  -> postmortem-knowledge-base
```

For a bug or incident:

```text
runbook-first-ops
  -> qa-as-asset
  -> postmortem-knowledge-base
  -> adr-driven-architecture if a lasting decision is needed
```

For a new AI feature:

```text
moat-first-ai-product
  -> blackbox-contract-security
  -> clean-boundary-engineering
  -> qa-as-asset
```

## Skill design rules

Each skill should:

1. have a narrow trigger condition
2. define what the agent must produce
3. include anti-patterns
4. include checklists
5. be project-agnostic
6. avoid private project details
7. force concrete decisions instead of generic prose

## What does not belong in skills?

Do not put these in reusable skill files:

- API keys
- credentials
- private URLs
- private customer names
- proprietary prompts copied from internal systems
- private business data
- confidential incident details
- environment-specific passwords or tokens

Skills should contain reusable process, not secrets.

## Project-specific layer

For a real project, keep project-specific facts in separate files such as:

```text
PROJECT_RULES.md
docs/ADR/
docs/runbooks/
docs/postmortems/
```

Then tell the agent:

```text
Use Project OS Skills, but treat PROJECT_RULES.md and docs/ADR as the project-specific source of truth.
```

## Quality bar

A Project OS response is good when it changes the next action.

Bad:

```text
We should improve quality and maintainability.
```

Good:

```text
The public API currently returns raw generation rows. Add `publicGeneration()` and `adminGeneration()` projections, then add a regression test that asserts `enhanced_prompt`, `recipe_id`, and `cost_trace` are absent from ordinary user responses.
```

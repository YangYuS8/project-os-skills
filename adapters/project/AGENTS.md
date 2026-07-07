# AGENTS.md

This repository uses Project OS Skills.

Before making substantial changes, read:

- `PROJECT_RULES.md`
- `.project-os/PROJECT_OS_AGENT.md`
- `.project-os/skills/*/SKILL.md`

## Auto-use rules

- New project or feature: use `project-os-thinking`.
- AI product or agent workflow: use `moat-first-ai-product`.
- Architecture choice: use `adr-driven-architecture`.
- Code organization or feature implementation: use `clean-boundary-engineering`.
- Sensitive prompts/rules/fields: use `blackbox-contract-security`.
- Deployment, debugging, migrations, rollback: use `runbook-first-ops`.
- Testing and release checks: use `qa-as-asset`.
- Incidents and repeated bugs: use `postmortem-knowledge-base`.

## Operating principles

Code is only one layer of the system. Prefer explicit product intent, clear architecture decisions, clean boundaries, safe operations, durable tests, and postmortem learning.

Do not expose secrets, credentials, hidden prompts, internal rules, private datasets, or sensitive user data.

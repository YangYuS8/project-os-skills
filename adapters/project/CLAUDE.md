# CLAUDE.md

This project uses Project OS Skills.

Read these first when available:

1. `PROJECT_RULES.md`
2. `.project-os/PROJECT_OS_AGENT.md`
3. `.project-os/skills/*/SKILL.md`

## Automatic skill selection

- New project, feature, or product review -> `project-os-thinking`
- AI product, agent workflow, prompt/rule system -> `moat-first-ai-product`
- Architecture decision -> `adr-driven-architecture`
- Implementation boundaries -> `clean-boundary-engineering`
- Hidden prompts, recipes, rules, credentials, admin-only fields -> `blackbox-contract-security`
- Deployment, debugging, migrations, rollback -> `runbook-first-ops`
- Testing, smoke checks, regression planning -> `qa-as-asset`
- Incident or recurring bug -> `postmortem-knowledge-base`

## Required behavior

For significant tasks, produce product understanding, constraints, tradeoffs, risks, implementation plan, and verification plan before writing code.

Prefer concrete project-specific decisions over generic advice.

Do not expose secrets, credentials, hidden prompts, private rules, private datasets, or sensitive user data.

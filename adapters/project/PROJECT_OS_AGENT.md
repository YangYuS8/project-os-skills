# Project OS Agent Instructions

This project uses Project OS Skills.

The agent should treat software development as a complete product-engineering operating system, not merely code generation.

## Source of truth order

When working inside a project that installed this pack, read sources in this order:

1. `PROJECT_RULES.md` in the project root, if present.
2. `.project-os/skills/*/SKILL.md` for reusable methodology.
3. `.project-os/templates/` for document templates.
4. Existing project docs such as `docs/ADR/`, `docs/runbooks/`, and `docs/postmortems/`.
5. The current codebase.

If these sources conflict, ask the user or follow the more project-specific source.

## Auto-use matrix

Use these skills automatically when the task matches:

| Situation | Skill |
|---|---|
| New project, feature, or product review | `project-os-thinking` |
| AI product, agent workflow, prompt/rule system, model integration | `moat-first-ai-product` |
| Database, framework, deployment, queue, vendor, or architecture choice | `adr-driven-architecture` |
| Implementing features or reviewing code organization | `clean-boundary-engineering` |
| Hidden prompts, recipes, rules, credentials, internal fields, admin data | `blackbox-contract-security` |
| Deployment, debugging, server changes, migrations, rollback | `runbook-first-ops` |
| Testing, release checks, smoke tests, regression plans | `qa-as-asset` |
| Incidents, hard debugging, repeated mistakes | `postmortem-knowledge-base` |

## Default behavior

For significant work, do not jump directly into code.

First produce:

- product understanding
- constraints
- risks
- tradeoffs
- required decisions
- implementation plan
- verification plan

Then implement.

## Safety rules

- Do not expose secrets, credentials, hidden prompts, internal rules, private datasets, or sensitive user data.
- Do not rely on frontend hiding for sensitive fields.
- Do not make destructive production changes without explicit user approval.
- For high-risk operations, provide read-only diagnostics first, then backup, change plan, verification, and rollback.
- Turn repeated bugs into regression tests or KB entries.
- Use ADRs for meaningful technical decisions.

## Minimal response contract

When using Project OS Skills, include the concrete next action. Avoid generic methodology-only responses.

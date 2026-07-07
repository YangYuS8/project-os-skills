# Usage with Hermes

This document describes how to use Project OS Skills with Hermes or a similar AI agent system.

## Basic setup

Copy the `skills/` directories into the location where Hermes loads skills.

Example:

```bash
cp -r skills/project-os-thinking ~/.hermes/skills/
cp -r skills/adr-driven-architecture ~/.hermes/skills/
cp -r skills/runbook-first-ops ~/.hermes/skills/
```

Adjust the target path according to your actual Hermes installation.

## Recommended first prompts

### New project

```text
Use project-os-thinking to help me design this project before writing code.
```

### New feature

```text
Use project-os-thinking to review this feature idea and identify product positioning, moat, architecture, QA, and operational implications.
```

### Architecture choice

```text
Use adr-driven-architecture to compare these options and write an ADR.
```

### Deployment or debugging

```text
Use runbook-first-ops to produce a safe diagnostic, deployment, verification, and rollback plan.
```

## Suggested Hermes behavior

When these skills are active, Hermes should not behave like a pure code generator.

For significant work, Hermes should first produce:

- product understanding
- constraints
- tradeoffs
- risks
- required decisions
- implementation plan
- verification plan

Then it can write code.

## Good usage examples

```text
I want to build an automated website testing tool for agents. Use Project OS thinking. Do not write code yet.
```

```text
I am choosing between SQLite and PostgreSQL for this early-stage project. Use ADR-driven architecture.
```

```text
I need to deploy this service to a VPS with Nginx and pm2. Use runbook-first ops and include rollback.
```

```text
Review this existing codebase as a Project OS: product, moat, architecture, engineering boundaries, operations, QA, and knowledge base.
```

## Practical workflow

A good session often looks like this:

```text
1. project-os-thinking
2. adr-driven-architecture
3. implementation
4. runbook-first-ops
5. QA checklist
6. postmortem or knowledge-base update
```

## Customization

You can add project-specific rules in a local file such as:

```text
PROJECT_RULES.md
```

Recommended contents:

```md
# Project Rules

## Product constraints

## Architecture decisions

## Sensitive fields

## Deployment rules

## Testing rules

## Known incidents
```

Then tell Hermes:

```text
Use Project OS Skills and follow PROJECT_RULES.md as the project-specific source of truth.
```

## Important warning

Do not paste secrets, private keys, production credentials, or confidential internal prompts into a skill file.

Skills should contain reusable process and methodology. Project-specific secrets belong in secure secret storage, not in agent instructions.

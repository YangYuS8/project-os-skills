# Project OS Skills

English | [简体中文](README.zh-CN.md)

A reusable **Project OS skill pack** for AI agents.

This repository teaches agents to develop software as a full product-engineering operating system, not merely as code generation. The intended workflow is:

```text
Product positioning
  -> moat and knowledge design
  -> ADR-driven architecture
  -> clean engineering boundaries
  -> black-box/security contracts
  -> safe operations and delivery
  -> QA as durable assets
  -> postmortem knowledge base
```

The goal is to make agents think like a small product-engineering team: product manager, architect, engineer, SRE, QA, security reviewer, and knowledge curator.

## Installation

### For humans

**Recommended: let your coding agent install it for you.**

Paste this into Codex, Claude Code, Cursor, Windsurf, OpenCode, Gemini CLI, Hermes, or any coding agent session opened inside the project you want to enhance:

```text
Install and configure Project OS Skills by following the instructions here:
https://raw.githubusercontent.com/YangYuS8/project-os-skills/refs/heads/main/docs/guide/installation.md
```

That is the preferred flow: the agent reads the full guide, chooses the right install mode, runs the installer, verifies the result, and helps fill `PROJECT_RULES.md` for the current project.

### Direct project install

Run this inside the project you want agents to work on:

```bash
curl -fsSL https://raw.githubusercontent.com/YangYuS8/project-os-skills/main/scripts/install.sh | bash -s -- --mode project --dest . --agents all
```

This installs project-local guidance for common agent styles, including `AGENTS.md`, `CLAUDE.md`, `GEMINI.md`, `CODEX.md`, Cursor rule files, Windsurf rule files, and `OPENCODE.md`.

### Native skills install for Hermes-like agents

```bash
git clone https://github.com/YangYuS8/project-os-skills.git
cd project-os-skills
bash scripts/install.sh --mode skills --target hermes
```

By default, this copies skills to:

```text
~/.hermes/skills
```

### Install both

```bash
bash scripts/install.sh --mode all --dest /path/to/project --agents all
```

See [`docs/guide/installation.md`](docs/guide/installation.md), [`docs/quickstart.md`](docs/quickstart.md), [`docs/install-with-agent.md`](docs/install-with-agent.md), [`docs/agent-compatibility.md`](docs/agent-compatibility.md), and [`docs/usage-with-hermes.md`](docs/usage-with-hermes.md).

## Why this exists

Many coding agents can generate code quickly, but they often skip the decisions that keep a project maintainable:

- Who is the product for?
- What real job does the user need done?
- What is the moat beyond calling a public model or API?
- Which knowledge should live in rules, recipes, workflows, or databases?
- Which technical decisions need ADRs?
- Where are the boundaries between UI, API, business logic, data, and operations?
- Which fields, prompts, rules, credentials, and internal logic must never leak?
- How will the system be deployed, rolled back, tested, and debugged?
- How will incidents become reusable knowledge?

Project OS Skills are designed to slow the agent down at the right moments, force explicit tradeoffs, and turn repeated project experience into durable assets.

## Repository structure

```text
project-os-skills/
├── README.md
├── README.zh-CN.md
├── PROJECT_RULES.template.md
├── LICENSE
├── scripts/
│   └── install.sh
├── adapters/
│   ├── README.md
│   └── project/
│       ├── PROJECT_OS_AGENT.md
│       ├── AGENTS.md
│       ├── CLAUDE.md
│       ├── GEMINI.md
│       ├── CODEX.md
│       ├── OPENCODE.md
│       ├── cursor-rules.md
│       └── windsurf-adapter.md
├── skills/
│   ├── project-os-thinking/
│   │   └── SKILL.md
│   ├── moat-first-ai-product/
│   │   └── SKILL.md
│   ├── adr-driven-architecture/
│   │   └── SKILL.md
│   ├── clean-boundary-engineering/
│   │   └── SKILL.md
│   ├── blackbox-contract-security/
│   │   └── SKILL.md
│   ├── runbook-first-ops/
│   │   └── SKILL.md
│   ├── qa-as-asset/
│   │   └── SKILL.md
│   └── postmortem-knowledge-base/
│       └── SKILL.md
├── templates/
│   ├── ADR.md
│   ├── RUNBOOK.md
│   ├── PROJECT_OS_REVIEW.md
│   ├── QA_CHECKLIST.md
│   ├── POSTMORTEM.md
│   └── SECURITY_PROJECTION.md
├── docs/
│   ├── philosophy.md
│   ├── skill-pack-design.md
│   ├── quickstart.md
│   ├── install-with-agent.md
│   ├── agent-compatibility.md
│   ├── usage-with-hermes.md
│   └── guide/
│       └── installation.md
└── examples/
    ├── README.md
    └── autoqa-project-os-review.md
```

## Skills

### `project-os-thinking`

Use this when starting a new project, designing a feature, reviewing an existing product, or asking an agent to turn a rough idea into a maintainable system.

It makes the agent reason through product positioning, target users, JTBD, moat, workflows, system boundaries, QA, operations, and knowledge capture before jumping into implementation.

### `moat-first-ai-product`

Use this when designing AI products or agentic systems.

It makes the agent separate public model capability from defensible product know-how: rules, recipes, workflows, evaluation loops, data, integrations, and operational learning.

### `adr-driven-architecture`

Use this when making technical choices or reviewing architecture.

It makes the agent write Architecture Decision Records for meaningful tradeoffs instead of giving vague recommendations.

### `clean-boundary-engineering`

Use this when implementing features or reviewing code organization.

It makes the agent keep UI, API, business logic, persistence, security, and operations separated by clear responsibilities.

### `blackbox-contract-security`

Use this when the system has internal prompts, recipes, rules, credentials, scoring logic, private data, or admin-only fields.

It makes the agent design server-side public/admin projections instead of relying on frontend hiding.

### `runbook-first-ops`

Use this when deploying, debugging, operating, or changing live systems.

It makes the agent produce safe, staged, verifiable, and rollback-aware operational plans instead of risky one-shot commands.

### `qa-as-asset`

Use this when adding or changing features.

It makes the agent produce durable tests, smoke scripts, regression checklists, and quality gates that become part of the project memory.

### `postmortem-knowledge-base`

Use this after incidents, difficult debugging sessions, or repeated mistakes.

It makes the agent capture symptoms, impact, root cause, fixes, verification, and prevention as reusable knowledge.

## Agent support strategy

Project OS Skills supports two integration modes:

1. **Native skill mode**: copy `skills/*` into a skills directory, currently with a Hermes default.
2. **Project adapter mode**: install `.project-os/` and project instruction files so mainstream agents can discover and apply the methodology inside a repository.

The adapter files include an auto-use matrix so agents can choose the right skill based on task type.

## Design principles

1. **Code is only one layer of the system.**
2. **Moat before features.**
3. **Decisions must be remembered.**
4. **Boundaries beat cleverness.**
5. **Sensitive knowledge must be protected by server-side contracts.**
6. **Operations are part of product engineering.**
7. **Tests and postmortems are assets.**
8. **Templates are scaffolding, not filler.**

## Useful prompts

```text
Use project-os-thinking to design this project before writing code.
```

```text
Use moat-first-ai-product to identify the real moat of this AI product.
```

```text
Use adr-driven-architecture to record the key technical choices and tradeoffs.
```

```text
Use clean-boundary-engineering while implementing this feature.
```

```text
Use blackbox-contract-security to prevent internal prompts/rules/fields from leaking.
```

```text
Use runbook-first-ops to produce a safe deployment and rollback plan.
```

```text
Use qa-as-asset to create durable tests and regression checks.
```

```text
Use postmortem-knowledge-base to turn this incident into reusable knowledge.
```

## License

This project is licensed under the [Apache License 2.0](LICENSE).

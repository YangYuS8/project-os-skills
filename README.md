# Project OS Skills

A reusable **Project OS skill pack** for AI agents.

This repository teaches agents to develop software as a full product-engineering operating system, not merely as code generation. The intended workflow is:

```text
Product positioning
  -> moat and knowledge design
  -> ADR-driven architecture
  -> clean engineering boundaries
  -> safe operations and delivery
  -> QA as durable assets
  -> postmortem knowledge base
```

The goal is to make agents think like a small product-engineering team: product manager, architect, engineer, SRE, QA, and knowledge curator.

## Why this exists

Many coding agents can generate code quickly, but they often skip the decisions that keep a project maintainable:

- Who is the product for?
- What real job does the user need done?
- What is the moat beyond calling a public model or API?
- Which knowledge should live in rules, recipes, workflows, or databases?
- Which technical decisions need ADRs?
- Where are the boundaries between UI, API, business logic, data, and operations?
- How will the system be deployed, rolled back, tested, and debugged?
- How will incidents become reusable knowledge?

Project OS Skills are designed to slow the agent down at the right moments, force explicit tradeoffs, and turn repeated project experience into durable assets.

## Repository structure

```text
project-os-skills/
├── README.md
├── skills/
│   ├── project-os-thinking/
│   │   └── SKILL.md
│   ├── adr-driven-architecture/
│   │   └── SKILL.md
│   └── runbook-first-ops/
│       └── SKILL.md
├── templates/
│   ├── ADR.md
│   ├── RUNBOOK.md
│   └── PROJECT_OS_REVIEW.md
├── docs/
│   ├── philosophy.md
│   └── usage-with-hermes.md
└── examples/
    └── README.md
```

## Current skills

### `project-os-thinking`

Use this when starting a new project, designing a feature, reviewing an existing product, or asking an agent to turn a rough idea into a maintainable system.

It makes the agent reason through product positioning, target users, JTBD, moat, workflows, system boundaries, QA, operations, and knowledge capture before jumping into implementation.

### `adr-driven-architecture`

Use this when making technical choices or reviewing architecture.

It makes the agent write Architecture Decision Records for meaningful tradeoffs instead of giving vague recommendations.

### `runbook-first-ops`

Use this when deploying, debugging, operating, or changing live systems.

It makes the agent produce safe, staged, verifiable, and rollback-aware operational plans instead of risky one-shot commands.

## Design principles

1. **Code is only one layer of the system.**
2. **Moat before features.**
3. **Decisions must be remembered.**
4. **Boundaries beat cleverness.**
5. **Sensitive knowledge must be protected by contracts.**
6. **Operations are part of product engineering.**
7. **Tests and postmortems are assets.**
8. **Templates are scaffolding, not filler.**

## How to use with Hermes

Copy or sync the `skills/` directories into your Hermes skills directory, or reference this repository as a skill pack if your Hermes setup supports remote skill loading.

Useful prompts:

```text
Use project-os-thinking to design this project before writing code.
```

```text
Use adr-driven-architecture to record the key technical choices and tradeoffs.
```

```text
Use runbook-first-ops to produce a safe deployment and rollback plan.
```

See [`docs/usage-with-hermes.md`](docs/usage-with-hermes.md) for more details.

## Roadmap

Planned skills:

- `moat-first-ai-product`
- `clean-boundary-engineering`
- `blackbox-contract-security`
- `qa-as-asset`
- `postmortem-knowledge-base`

## License

No license has been selected yet. Until a license is added, all rights are reserved by the repository owner.

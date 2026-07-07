# Clean Boundary Engineering

## Purpose

Use this skill to help an AI agent implement software without turning the codebase into a tangled feature pile.

The goal is to make each layer responsible for one kind of work:

```text
UI / pages
  -> routes / controllers
  -> business logic
  -> persistence / external services
  -> operations and scripts
```

A project can be a monolith and still have clean boundaries.

## When to use

Use this skill when the user is:

- implementing a new feature
- reviewing generated code
- refactoring messy code
- deciding where logic should live
- adding API routes, database access, background jobs, payment, auth, credits, or admin features
- trying to keep an agent from scattering logic across the project

## Core philosophy

Good boundaries make future work safer.

Bad generated code often works today but creates hidden debt:

- business logic inside UI components
- authorization in the frontend only
- repeated SQL in route handlers
- payment logic mixed with model invocation
- sensitive fields returned by default
- scripts that mutate production without verification
- unclear ownership of retries, refunds, or idempotency

## Required layer responsibilities

### UI layer

Responsible for:

- rendering
- user interaction
- local UI state
- displaying public data already approved by the server

Not responsible for:

- security decisions
- pricing authority
- ownership checks
- hidden prompts/rules
- direct secret access

### Route / controller layer

Responsible for:

- authentication
- authorization guard
- input validation
- rate limiting
- idempotency keys
- charging / quota checks when applicable
- calling business services
- returning public projections

Not responsible for:

- deep business orchestration
- direct scattered SQL unless the project explicitly chooses that pattern
- internal prompt construction in public-facing handlers

### Business logic layer

Responsible for:

- core workflows
- domain rules
- model/tool orchestration
- refunds or compensation logic
- state transitions
- reusable policies
- public/admin projection functions

Not responsible for:

- UI rendering
- HTTP-specific concerns
- storing secrets in plain code

### Persistence layer

Responsible for:

- database access
- migrations
- transactions
- data integrity
- repository/query functions
- object storage integration where appropriate

Not responsible for:

- deciding user permissions without the business layer
- leaking internal fields to public callers by default

### Ops / scripts layer

Responsible for:

- deployment
- migration commands
- backups
- diagnostics
- rollback
- smoke tests

Not responsible for:

- undocumented destructive changes
- production mutations without verification

## Feature implementation checklist

Before writing or reviewing code, answer:

```text
1. What layer owns this behavior?
2. What API boundary is being changed?
3. What state is created or mutated?
4. What permissions are required?
5. What fields are public, private, or admin-only?
6. What failure modes exist?
7. Is the operation idempotent or retry-safe?
8. What tests or smoke checks prove it works?
9. What deployment or migration steps are required?
```

## Output format

When using this skill, produce:

```text
Layer plan:
- UI:
- Route/API:
- Business logic:
- Persistence:
- Ops/scripts:

State and permissions:
- New state:
- Mutations:
- Ownership checks:
- Sensitive fields:

Implementation steps:
1. ...
2. ...

Verification:
- Static checks:
- API checks:
- E2E/smoke checks:

Risks:
- ...
```

## Guardrails for agents

- Do not put security checks only in the frontend.
- Do not return raw database rows to public clients when internal fields exist.
- Do not duplicate complex business rules across routes.
- Do not add a new persistence pattern without explaining why.
- Do not mutate user credits, billing, or irreversible state in multiple layers.
- Do not make background tasks impossible to recover or inspect.
- Do not hide failure handling.

## Final check

Before finishing, verify:

- Can another developer find where this logic lives?
- Can the behavior be tested without clicking through the whole UI?
- Can sensitive fields leak?
- Can retries double-charge, double-submit, or corrupt state?
- Is the design simpler than the problem requires, but not simplistic?

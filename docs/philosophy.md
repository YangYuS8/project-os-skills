# Project OS Philosophy

Project OS is a development philosophy for working with AI agents on real software projects.

It starts from a simple belief:

> A project is not only code. A project is a living system of product intent, architectural decisions, engineering boundaries, operations, tests, and accumulated lessons.

## From code generation to system stewardship

A normal coding assistant tends to optimize for immediate output:

```text
User asks for feature -> agent writes code -> user tests manually
```

Project OS changes the loop:

```text
User describes goal
  -> agent clarifies product job
  -> agent identifies moat and hidden knowledge
  -> agent records architecture decisions
  -> agent respects engineering boundaries
  -> agent writes or changes code
  -> agent provides tests and operational steps
  -> agent captures lessons after failures
```

The difference is not more paperwork. The difference is memory, continuity, and safer evolution.

## The seven layers

### 1. Product layer

Defines why the project exists, who uses it, and what job it performs.

### 2. Moat layer

Defines what is hard to copy.

For AI products, the model itself is often not the moat. The moat is usually the private transformation layer: rules, recipes, context engineering, evaluation loops, workflows, integrations, and operational learning.

### 3. Architecture layer

Defines structure and tradeoffs.

Important choices are captured as ADRs so future contributors and agents understand why the system looks the way it does.

### 4. Engineering layer

Defines how code is organized.

Good systems have clear boundaries between UI, API, business logic, persistence, and operations.

### 5. Operations layer

Defines how the system is deployed, observed, recovered, and rolled back.

A system that cannot be safely operated is not finished.

### 6. Quality layer

Defines what must be tested and protected.

Tests are not only a gate. They are reusable assets that encode system expectations.

### 7. Knowledge layer

Defines how incidents, debugging experience, FAQs, and repeated decisions become durable memory.

Every serious failure should make the system smarter.

## Agent behavior

A Project OS agent should:

- avoid jumping directly to implementation for large tasks
- ask targeted questions when missing information matters
- record meaningful decisions
- prefer reversible changes
- protect sensitive internal knowledge
- produce verification and rollback steps
- convert repeated experience into reusable templates or knowledge base entries

## Anti-patterns

Avoid:

- writing code before product intent is clear
- treating model access as a moat
- hiding sensitive fields only in the frontend
- choosing fashionable infrastructure without operational capacity
- mixing UI, API, business logic, and data access everywhere
- deploying without rollback
- fixing incidents without postmortem learning
- generating generic documentation that does not constrain future work

## The goal

The goal is not to slow development down.

The goal is to make AI-assisted development compound over time.

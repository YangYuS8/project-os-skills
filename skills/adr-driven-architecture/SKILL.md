# ADR-Driven Architecture

## Purpose

Use this skill to make architecture decisions explicit, reviewable, and reusable.

The goal is not to force heavy architecture. The goal is to make meaningful tradeoffs visible so future humans and agents do not repeat the same debates or accidentally reverse important decisions.

## When to use

Use this skill when the user is:

- choosing a database, framework, queue, deployment method, language, or architecture style
- adding a major subsystem
- refactoring a project
- comparing technical options
- asking whether a project should use Docker, Kubernetes, Redis, PostgreSQL, SQLite, serverless, monolith, microservices, etc.
- asking for architecture review
- asking an agent to record why a decision was made

Do not use this skill for trivial implementation details.

## Core philosophy

Every important architecture decision should answer:

1. What context forced this choice?
2. What did we decide?
3. Why is this the right tradeoff for the current stage?
4. What alternatives did we reject?
5. What consequences and risks does this create?
6. What would make us revisit this decision?

## Required ADR format

```md
# ADR-000X: Decision title

## Status

Proposed | Accepted | Superseded | Deprecated

## Context

What problem or constraint led to this decision?

Include:
- team size
- expected traffic or scale
- operational ability
- cost constraints
- security constraints
- user impact
- current project stage

## Decision

What was chosen?

Be specific.

## Rationale

Why is this choice appropriate now?

Explain the practical reasoning, not only the theoretical benefit.

## Alternatives considered

### Option A

Pros:
- ...

Cons:
- ...

Reason rejected:
- ...

### Option B

Pros:
- ...

Cons:
- ...

Reason rejected:
- ...

## Consequences

Positive:
- ...

Negative:
- ...

Risks:
- ...

## Guardrails

Rules future contributors and agents must follow because of this decision.

## Revisit trigger

What condition would justify changing this decision?

Examples:
- traffic exceeds a threshold
- operational burden changes
- security requirements change
- cost becomes unacceptable
- the current solution blocks a critical feature
```

## Architecture review checklist

When reviewing an architecture, check:

- Is the system stage clear?
- Is the complexity justified?
- Are boundaries clear?
- Is business logic isolated from UI and transport layers?
- Is persistence access centralized enough?
- Are secrets and internal knowledge protected?
- Is deployment compatible with the team’s operating ability?
- Are rollback and migration paths considered?
- Are long-running tasks handled safely?
- Are failure modes documented?

## Decision quality rules

Good decisions are:

- specific to the project
- appropriate for the current stage
- honest about tradeoffs
- reversible when possible
- explicit about risks
- connected to operational reality

Bad decisions are:

- based only on trendiness
- copied from big-company architecture without context
- too vague to guide implementation
- missing rejected alternatives
- impossible for the team to operate

## Output style

When asked to recommend a technology, do not only say what to use.

Always include:

```text
Recommended choice:
Why now:
Why not the alternatives:
Risks:
Revisit trigger:
ADR draft:
```

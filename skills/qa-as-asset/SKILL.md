# QA as Asset

## Purpose

Use this skill to make testing a durable project asset rather than a temporary report.

The goal is to help agents produce repeatable checks that preserve product behavior, security boundaries, cost correctness, and operational confidence.

## When to use

Use this skill when the user is:

- adding or changing a feature
- preparing a release
- asking how to test a website, API, agent, workflow, or generated content system
- building an automated QA tool
- reviewing a project for regressions
- creating acceptance criteria or smoke tests

## Core philosophy

A test report is a snapshot.

A test script, checklist, fixture, or regression case is reusable memory.

The agent should prefer assets that can be run again.

## Required output

When using this skill, produce:

```text
1. Quality goals
2. Critical user paths
3. Risk areas
4. Test matrix
5. Minimal smoke suite
6. Regression checklist
7. Security and permission checks
8. Data and fixture requirements
9. Automation plan
10. Release gate
```

## Test categories

### Functional tests

- happy path
- invalid input
- empty input
- edge values
- retry
- cancellation
- partial failure
- state recovery

### Permission tests

- anonymous
- ordinary user
- owner
- cross-user access
- admin
- disabled or banned user
- expired session
- token-based access where applicable

### Security tests

- sensitive field leakage
- IDOR
- rate limiting
- upload validation
- injection
- CSRF where applicable
- secrets in logs
- raw stack traces
- unsafe redirects

### Billing / quota / cost tests

- insufficient balance
- exactly-once charge
- full refund on failure
- partial refund when applicable
- retry without double charge
- idempotent payment callback
- tampered amount rejected

### Long-running task tests

- refresh page
- close/reopen browser
- worker restart
- deployment reload
- timeout
- orphan recovery
- duplicate polling
- failed subtask

### Operational tests

- build
- migration
- backup
- rollback
- smoke endpoint
- health check
- log visibility
- alert trigger

## Minimal smoke suite

For every project, define a minimal smoke suite that can run quickly after deployment.

A good smoke suite answers:

- Is the app reachable?
- Can a normal user complete the core flow?
- Are critical APIs returning expected shapes?
- Are sensitive fields absent?
- Are background tasks recoverable enough?
- Are logs free of obvious fatal errors?

## Output style

Prefer concrete test cases.

Use this format:

```md
## Test case: Title

Risk:

Steps:

Expected result:

Automation candidate: Yes/No

Notes:
```

## Agent rules

- Do not say “test thoroughly” without listing concrete tests.
- Do not only test the happy path.
- Include negative tests and permission tests.
- Include sensitive field absence checks when internal fields exist.
- Include retry/idempotency checks for billing, credits, tasks, and external callbacks.
- Turn any bug found into a regression case.
- Prefer scripts or checklists that can be versioned.

## Final check

Before finishing, verify:

- Can this test plan be run again by another person or agent?
- Does it cover the riskiest parts of the system?
- Does it protect the project’s moat and sensitive fields?
- Does it include release-blocking criteria?

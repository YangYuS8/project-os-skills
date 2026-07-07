# QA Checklist: Feature or Release Name

## Scope

Feature/release:

Owner:

Environment:

Date:

## Quality goals

- ...

## Critical user paths

- [ ] Path 1:
- [ ] Path 2:
- [ ] Path 3:

## Functional tests

| Case | Steps | Expected | Result |
|---|---|---|---|
| Happy path |  |  |  |
| Invalid input |  |  |  |
| Empty input |  |  |  |
| Retry |  |  |  |
| Partial failure |  |  |  |

## Permission tests

| Role | Action | Expected | Result |
|---|---|---|---|
| Anonymous |  |  |  |
| Ordinary user |  |  |  |
| Owner |  |  |  |
| Cross-user |  |  |  |
| Admin |  |  |  |

## Security tests

- [ ] Sensitive fields are absent from public APIs.
- [ ] Admin endpoints require server-side admin authorization.
- [ ] Resource ownership is checked server-side.
- [ ] Uploads validate real file type and size.
- [ ] Rate limits apply to expensive or risky operations.
- [ ] Raw stack traces are not returned to users.
- [ ] Secrets are not logged.

## Billing / quota / cost tests

- [ ] Insufficient balance fails before starting work.
- [ ] Successful operation charges exactly once.
- [ ] Failed operation refunds correctly.
- [ ] Retry does not double-charge.
- [ ] Payment callback is idempotent.
- [ ] Tampered payment data is rejected.

## Long-running task tests

- [ ] Refresh page during task.
- [ ] Close/reopen browser during task.
- [ ] Worker or process restart.
- [ ] Timeout behavior.
- [ ] Partial failure behavior.
- [ ] Orphan recovery.

## Operational tests

- [ ] Build passes.
- [ ] Migration is idempotent.
- [ ] Backup works.
- [ ] Rollback works.
- [ ] Health check passes.
- [ ] Logs have no fatal errors.
- [ ] Smoke suite passes.

## Release gate

Release is blocked if:

- [ ] ...
- [ ] ...

## Regression cases added

- [ ] ...

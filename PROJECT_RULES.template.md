# Project Rules

This file is the project-specific source of truth for agents using Project OS Skills.

Keep reusable methodology in `skills/`. Keep project facts, constraints, and decisions here.

## Product constraints

- Target users:
- Core job to be done:
- Non-goals:
- Current stage:

## Moat and private know-how

Public capabilities:

- ...

Private know-how that must be protected:

- ...

Rules, recipes, workflows, or data that should be maintained:

- ...

## Architecture decisions

Authoritative ADR directory:

```text
docs/ADR/
```

Current accepted decisions:

- ADR-0001:
- ADR-0002:

## Engineering boundaries

UI layer:

API/controller layer:

Business logic layer:

Persistence layer:

Ops/scripts layer:

## Sensitive fields and black-box contracts

Sensitive fields that ordinary users must not receive:

- `field_name`: reason

Projection functions or conventions:

- Public projection:
- Admin projection:

## Deployment rules

Deployment method:

Rollback method:

Backup method:

Environment notes:

- Local:
- Staging:
- Production:

## Testing rules

Required checks before merge/release:

- [ ] Static checks:
- [ ] Smoke tests:
- [ ] Permission tests:
- [ ] Sensitive field leakage tests:
- [ ] Rollback verification:

## Known incidents and KB

Postmortem directory:

```text
docs/postmortems/
```

Known recurring issues:

- ...

## Agent operating rules

- Do not overwrite this file without explicit user approval.
- Do not paste secrets into this file.
- Ask before making high-risk production, database, DNS, payment, or destructive filesystem changes.
- Use Project OS Skills automatically when the task matches their trigger conditions.

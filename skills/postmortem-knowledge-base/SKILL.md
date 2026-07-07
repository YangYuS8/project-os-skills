# Postmortem Knowledge Base

## Purpose

Use this skill to turn incidents, difficult debugging sessions, and repeated mistakes into durable project memory.

The goal is not blame. The goal is to prevent rediscovery.

## When to use

Use this skill when the user is:

- resolving an incident
- debugging a difficult issue
- fixing a repeated mistake
- writing FAQ or troubleshooting documentation
- asking how to avoid the same problem next time
- creating a project knowledge base
- reviewing an operational failure

## Core philosophy

An incident should make the system smarter.

A good postmortem captures:

```text
Impact
  -> symptoms
  -> root cause
  -> detection
  -> mitigation
  -> permanent fix
  -> verification
  -> prevention
  -> knowledge base entry
```

## Required output

When using this skill, produce:

```text
1. Incident summary
2. Impact
3. Timeline
4. Symptoms
5. Root cause
6. Contributing factors
7. Immediate mitigation
8. Permanent fix
9. Verification
10. Prevention
11. Follow-up tasks
12. KB entry
```

## Postmortem template

```md
# PM-YYYY-MM-DD-title

## Summary

What happened?

## Impact

Who or what was affected?

## Timeline

- Time:
- Event:

## Symptoms

What was observed?

## Root cause

What actually caused it?

## Contributing factors

What made it easier for this to happen?

## Mitigation

What stopped the bleeding?

## Permanent fix

What changed to prevent recurrence?

## Verification

How did we prove the fix worked?

## Lessons learned

What did we learn?

## Follow-up tasks

- [ ] ...

## KB entry

Short reusable troubleshooting entry.
```

## Troubleshooting KB format

```md
## Symptom

What the user/operator sees.

## Likely causes

- ...

## Diagnostics

Read-only commands first.

## Fix

Commands or steps.

## Verification

Commands or checks.

## Prevention

- ...
```

## Classification

Classify each entry as one or more:

- product decision
- architecture decision
- engineering bug
- deployment issue
- configuration issue
- dependency issue
- vendor/API issue
- security issue
- data issue
- documentation gap
- agent-caused issue

## Agent rules

- Do not stop at “fixed”.
- Ask what should be added to docs, tests, scripts, or runbooks.
- Identify whether an ADR is needed.
- Identify whether a regression test is needed.
- Identify whether a runbook needs updating.
- Avoid blaming individuals. Focus on systems, constraints, and prevention.
- If the root cause is unknown, say so and list next diagnostics.

## Final check

Before finishing, verify:

- Could another person diagnose the same issue faster using this entry?
- Did we capture prevention, not only repair?
- Did we add or propose a test, runbook, or ADR update?
- Did we avoid leaking secrets or private incident details?

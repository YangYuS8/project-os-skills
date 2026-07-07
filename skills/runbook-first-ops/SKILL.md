# Runbook-First Ops

## Purpose

Use this skill when an AI agent helps operate, deploy, debug, or change a live or semi-live system.

The goal is to make operational work safe, staged, observable, and reversible.

## When to use

Use this skill when the user is:

- deploying an application
- changing server, Nginx, Docker, database, DNS, SSL, CI/CD, or process-manager configuration
- debugging production or staging issues
- writing scripts that affect files, services, data, or infrastructure
- asking for rollback or recovery steps
- asking an agent to generate commands for a server
- handling incidents

Do not use this skill for harmless local-only code edits unless the user wants an operational plan.

## Core philosophy

Never jump directly to destructive commands.

Use this sequence:

```text
Understand scope
  -> classify risk
  -> collect read-only diagnostics
  -> propose minimal change
  -> define backup and rollback
  -> execute in small steps
  -> verify
  -> document lessons learned
```

## Risk levels

### Low risk

Examples:
- read-only diagnostics
- local log inspection
- status checks

Requirements:
- commands should be copyable
- explain what each command observes

### Medium risk

Examples:
- restarting a non-critical service
- changing development configuration
- editing non-shared files

Requirements:
- backup step
- verification step
- rollback step

### High risk

Examples:
- production database migration
- deleting files
- changing shared Nginx configuration
- DNS or SSL changes
- force push
- permission changes
- commands using `rm -rf`, `dd`, `mkfs`, `chmod -R`, `chown -R`

Requirements:
- stop and warn
- provide read-only diagnostics first
- require explicit confirmation before destructive action
- include backup, rollback, and verification
- avoid one-liners that hide risk

## Required Runbook format

```md
# Runbook: Title

## Goal

What this runbook accomplishes.

## Scope

Systems, hosts, services, data, and users affected.

## Risk level

Low | Medium | High

## Preconditions

What must be true before starting.

## Read-only diagnostics

Commands that only observe state.

## Backup plan

What to back up and how to confirm the backup is usable.

## Change plan

Step-by-step commands.

Each step should include:
- command
- purpose
- expected result
- failure handling

## Verification

How to prove the change worked.

## Rollback

How to return to the previous known-good state.

## Post-change notes

What should be recorded in the knowledge base.
```

## Operational rules

- Prefer read-only commands first.
- Do not assume SSH access.
- Do not assume credentials are available.
- Do not ask the user to paste secrets.
- For risky changes, provide a script only after listing what it will do.
- Make commands idempotent where possible.
- Separate diagnosis from mutation.
- Separate local, staging, and production instructions.
- Use explicit paths.
- Avoid broad globs in destructive commands.
- Always include verification and rollback for medium/high-risk changes.

## Postmortem trigger

After resolving an incident, ask whether to create a postmortem entry with:

```text
Impact:
Symptoms:
Root cause:
Detection:
Temporary mitigation:
Permanent fix:
Verification:
Prevention:
```

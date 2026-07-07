# Blackbox Contract Security

## Purpose

Use this skill when a project has private prompts, recipes, rules, scoring logic, credentials, internal workflow state, or admin-only fields.

The goal is to protect the product’s hidden know-how and sensitive data through server-side contracts, not frontend hiding.

Core principle:

> If ordinary users must not see it, the public API must not return it.

## When to use

Use this skill when the user is:

- building an AI product with hidden prompts or recipes
- designing public and admin APIs
- exposing generated works, tasks, assets, jobs, logs, or analytics
- adding admin dashboards
- reviewing data leakage risks
- deciding what fields should be visible to users
- protecting internal agent reasoning, tools, or workflows

## Sensitive content examples

Treat these as private by default:

- hidden prompts
- prompt templates
- chain-of-thought-like internal reasoning
- model routing logic
- rules and recipes
- scoring and ranking logic
- compliance heuristics
- private datasets
- API keys and credentials
- payment provider secrets
- internal errors with stack traces
- admin notes
- other users’ data
- moderation decisions
- operational diagnostics
- cost and vendor details when not intended for users

## Projection pattern

Use explicit projection functions.

Example:

```ts
function publicProject(row: InternalRecord): PublicRecord {
  return {
    id: row.id,
    title: row.title,
    status: row.status,
    resultUrl: row.result_url,
    createdAt: row.created_at,
  };
}

function adminProject(row: InternalRecord): AdminRecord {
  return {
    ...publicProject(row),
    internalPrompt: row.internal_prompt,
    recipeId: row.recipe_id,
    costTrace: row.cost_trace,
    moderationResult: row.moderation_result,
  };
}
```

## Required output

When using this skill, produce:

```text
1. Sensitive fields
2. Public fields
3. Admin-only fields
4. Projection functions
5. Authorization rules
6. API endpoints affected
7. Tests for leakage
8. Logging rules
9. Review checklist
```

## API contract rules

- Public endpoints return public projections only.
- Admin endpoints require server-side admin authorization.
- Non-admin users should not learn whether admin-only endpoints exist unless the product intentionally exposes that.
- Client-provided ownership, role, price, credit, or permission values are untrusted.
- Resource access must be checked against authenticated identity.
- Avoid raw `SELECT *` responses for public APIs.
- Avoid spreading raw ORM/database objects into responses.
- Avoid returning internal errors to clients.
- Avoid logging secrets or hidden prompts into user-visible logs.

## Testing checklist

Every sensitive resource needs tests for:

- anonymous access
- ordinary user access
- owner access
- cross-user access
- admin access
- public endpoint leakage
- admin endpoint authorization
- raw error leakage
- log leakage when relevant

## Output example

```text
Sensitive fields:
- enhanced_prompt
- internal_recipe
- moderation_trace
- vendor_cost

Public projection:
- id
- status
- result_url
- created_at

Admin projection:
- public fields
- enhanced_prompt
- internal_recipe
- moderation_trace
- vendor_cost

Tests:
- ordinary users cannot see sensitive fields
- user A cannot read user B resource
- admin can inspect sensitive fields
```

## Anti-patterns

Avoid:

- “The frontend just won’t render that field.”
- “The admin button is hidden, so it is safe.”
- “The client sends `isAdmin: true`.”
- “The API returns the raw row and frontend filters it.”
- “Internal prompts are okay in browser localStorage.”
- “Errors can expose provider request bodies.”

## Final check

Before finishing, verify:

- Does any public response contain hidden knowledge?
- Can the frontend source reveal protected logic?
- Can a user guess another resource ID and read it?
- Are admin-only fields separated by contract?
- Are tests checking for absence of sensitive keys?

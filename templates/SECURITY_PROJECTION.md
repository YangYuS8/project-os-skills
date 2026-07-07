# Security Projection Contract: Resource Name

## Resource

Name:

Purpose:

Owner:

## Sensitive fields

These fields must not be returned to ordinary users:

- `field_name`: reason

## Public projection

Fields ordinary users may see:

```ts
type PublicResource = {
  id: string;
};
```

Projection function:

```ts
function publicResource(row: InternalResource): PublicResource {
  return {
    id: row.id,
  };
}
```

## Admin projection

Fields admins may see:

```ts
type AdminResource = PublicResource & {
  internalField: string;
};
```

Projection function:

```ts
function adminResource(row: InternalResource): AdminResource {
  return {
    ...publicResource(row),
    internalField: row.internal_field,
  };
}
```

## Authorization rules

| Role | Access |
|---|---|
| Anonymous |  |
| Ordinary user |  |
| Owner |  |
| Admin |  |

## Endpoints

| Endpoint | Projection | Guard |
|---|---|---|
| `GET /api/...` | public | requireUser |
| `GET /api/admin/...` | admin | requireAdmin |

## Leakage tests

- [ ] Public endpoint does not include sensitive fields.
- [ ] Anonymous access is rejected or receives public-only data.
- [ ] User A cannot read User B resource.
- [ ] Admin endpoint rejects non-admin users.
- [ ] Error responses do not include sensitive data.
- [ ] Logs do not expose secrets or hidden prompts.

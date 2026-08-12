# Security design

## Roles → permissions

Product browsing, search, cart, and guest checkout (stories 1–6) require no
sign-in — declared here as a decision, not an omission. The admin area
(stories 10–14) requires sign-in with the `admin` role; a signed-in shopper
without that role gets `403` from every admin-only `ceramics-api` operation.

## Authentication (Thunder)

- Shared dependency name: **`user-auth`** — declared on both `ceramics-webapp`
(SPA-side OIDC + PKCE sign-in) and `ceramics-api` (validates the bearer
token on every protected request).
- Scopes: `openid profile email` (default).
- `ceramics-webapp` sits in front of sign-in for both roles; `ceramics-api`
sits behind it for every operation except the public catalog browse/search
and guest checkout endpoints, which stay open.

## Role resolution

- `ceramics-api` reads the validated caller's identity from the
gateway-injected header (`X-User-Id`) plus the token's role claim. A caller
with no `admin` role claim is treated as a plain Shopper.
- A request to an admin-only operation with no `admin` role claim is denied
with `403`. A request to a Shopper-only owned resource (e.g. another
shopper's order) is denied with `403` even for a signed-in Shopper.
- Guest checkout and public catalog reads perform no role check at all — they
are open by design.
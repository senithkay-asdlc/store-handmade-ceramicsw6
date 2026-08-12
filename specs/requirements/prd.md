# Store Handmade Ceramics — PRD

## Problem Statement

Independent ceramic artisans have no simple way to sell their handmade pieces online. Buyers who want one-of-a-kind ceramics have to hunt across social media, craft fairs, or marketplaces not built for unique, single-quantity goods, and often find a piece already gone by the time they reach out. The store owner today juggles listings, availability, and orders by hand, with no single place to manage the catalog or track fulfillment.

## Solution

An online store for a single ceramics shop, where shoppers browse a catalog of handmade, one-of-a-kind pieces, add them to a cart, and check out with card payment — as a guest or signed in. The store admin manages the catalog and fulfills orders from an admin area, with each piece automatically delisted the moment it sells so shoppers never buy something that's already gone.

## Actors

- **Shopper**: Browses the catalog, manages a cart, checks out (as a guest or signed in), and — if signed in — views their order history.
- **Store Admin**: Signs in to an admin area to manage product listings and fulfill orders.

## User Stories

1. As a Shopper, I want to browse the catalog of handmade ceramic pieces, so that I can discover items I might want to buy.
2. As a Shopper, I want to view a product's detail page with photos, description, price, and availability, so that I can decide whether to purchase it.
3. As a Shopper, I want to search and filter the catalog (e.g. by category, price), so that I can find pieces that match what I'm looking for.
4. As a Shopper, I want to add a piece to my cart, so that I can collect items before checking out.
5. As a Shopper, I want to review and adjust my cart (remove items, see totals) before checkout, so that I can confirm what I'm buying.
6. As a Shopper, I want to check out as a guest with shipping and payment details, so that I can complete a purchase without creating an account.
7. As a Shopper, I want to sign in, so that I can save my details and view my past orders.
8. As a Shopper, I want to receive an order confirmation after checkout, so that I know my purchase succeeded and what happens next.
9. As a Shopper, I want to view my order history when signed in, so that I can track past purchases.
10. As a Store Admin, I want to sign in to an admin area, so that only authorized staff can manage the store.
11. As a Store Admin, I want to create, edit, and remove product listings, so that I can keep the catalog accurate.
12. As a Store Admin, I want a piece to be automatically marked sold and removed from the catalog once purchased, so that shoppers never buy a piece that's already gone.
13. As a Store Admin, I want to view incoming orders with shopper and shipping details, so that I can fulfill them.
14. As a Store Admin, I want to update an order's status (e.g. packed, shipped, delivered), so that shoppers and I can track fulfillment progress.

## Product Decisions

- Single-vendor store: one catalog, one admin team — no multi-seller marketplace features.
- Sign-in is via Thunder, the platform SSO, for both Shoppers (optional) and the Store Admin (required for the admin area).
- Guest checkout is allowed; creating an account is optional and only needed to view order history.
- Catalog items are one-of-a-kind pieces (not stocked/reproducible goods); a piece is automatically marked sold and delisted the instant it's purchased.
- Payment is by card via a hosted payment provider (e.g. Stripe); the store never stores raw card numbers.
- Order fulfillment is tracked via manual status updates by the Store Admin — no shipping-carrier integration or label generation.
- Order confirmations are sent by transactional email. *assumed*

## Phasing

- **Phase 1 — Launch the ceramics storefront**: Ship the full catalog, cart, checkout, and admin fulfillment flow described above. Stories: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14.

## Out of Scope

- Multi-seller marketplace features (seller onboarding, payout splitting, per-seller storefronts).
- Product reviews, ratings, or wishlists.
- Stocked/reproducible items with quantity tracking (all items are one-of-a-kind for now).
- Shipping-carrier integration, label generation, or automated tracking updates.
- Returns, refunds, or exchange management.
- Loyalty or discount/promo-code programs.

## Open Questions

1. Should a returns/refunds policy be supported in the admin flow, or handled entirely outside the system (e.g. by the admin contacting the shopper directly)? — deferred, does not block design.

## Further Notes

None.
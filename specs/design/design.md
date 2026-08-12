# Store Handmade Ceramics — Design

## Overview

A single-vendor storefront for handmade ceramics. Shoppers browse a catalog of one-of-a-kind pieces, add them to a cart, and check out with card payment as a guest or signed in; a Store Admin manages the catalog and fulfills orders from an admin area of the same app. The system is one React SPA (`ceramics-webapp`) talking to one Ballerina API (`ceramics-api`), which owns the catalog/cart/order data, delists a piece the instant it sells, charges the card via a hosted payment provider, and sends order-confirmation email. Sign-in for both shoppers (optional) and the admin (required) goes through Thunder, the platform IDP.

## Context (C1)

```mermaid
graph TD
  shopper([Shopper])
  admin([Store Admin])
  system[[Store Handmade Ceramics]]
  auth[(Thunder Auth)]
  payment[(Payment Provider)]
  email[(Email Provider)]

  shopper --> system
  admin --> system
  system --> auth
  system --> payment
  system --> email
```

## Domain model (ER)

```mermaid
erDiagram
  PRODUCT {
    string id
    string title
    string description
    string category
    decimal price
    string status
    string[] photoUrls
  }
  CART {
    string id
    string shopperId
    string status
  }
  CART_ITEM {
    string id
    string cartId
    string productId
  }
  ORDER {
    string id
    string shopperId
    string status
    decimal total
    string shippingName
    string shippingAddress
    string createdAt
  }
  ORDER_ITEM {
    string id
    string orderId
    string productId
    decimal priceAtPurchase
  }
  SHOPPER_ACCOUNT {
    string id
    string email
    string name
  }

  CART ||--o{ CART_ITEM : contains
  CART_ITEM }o--|| PRODUCT : references
  ORDER ||--o{ ORDER_ITEM : contains
  ORDER_ITEM }o--|| PRODUCT : references
  SHOPPER_ACCOUNT ||--o{ ORDER : places
  SHOPPER_ACCOUNT ||--o| CART : owns
```

`PRODUCT.status` is one of `available` | `sold`. `ORDER.status` is one of
`placed` | `packed` | `shipped` | `delivered`. A guest checkout creates an
`ORDER` with no `SHOPPER_ACCOUNT` link.

## Key flows

### Guest checkout

```mermaid
sequenceDiagram
  participant S as Shopper
  participant W as ceramics-webapp
  participant A as ceramics-api
  participant P as Payment Provider
  participant E as Email Provider

  S->>W: Add product to cart
  W->>A: POST /carts/{id}/items
  S->>W: Checkout (shipping + card details)
  W->>A: POST /orders
  A->>A: Verify product still available
  A->>P: Charge card
  P-->>A: Payment confirmed
  A->>A: Mark product sold, create order
  A->>E: Send order confirmation
  A-->>W: Order created
  W-->>S: Order confirmation
```

### Admin fulfills an order

```mermaid
sequenceDiagram
  participant Ad as Store Admin
  participant W as ceramics-webapp
  participant A as ceramics-api
  participant Au as Thunder Auth

  Ad->>W: Sign in
  W->>Au: OIDC sign-in
  Au-->>W: Token
  Ad->>W: Open Orders queue
  W->>A: GET /orders (bearer token)
  A->>Au: Validate token, resolve role
  A-->>W: Orders list
  Ad->>W: Update order status
  W->>A: PATCH /orders/{id}
  A-->>W: Order updated
```
// Store Handmade Ceramics — storefront + admin area

screen Catalog "Shopper browses and searches the ceramics catalog"
  navbar "Ceramics Co | Shop -> Catalog | Cart -> Cart | Sign in -> SignIn"
  row
    heading "Handmade Ceramics"
    right
    search "Search pieces…"
    select "Category: All"
  row
    card "Speckled Stoneware Mug"
      image "photo" 200x150
      text "$38 · One of a kind"
      button "View" -> ProductDetail
    card "Blue Glaze Bowl"
      image "photo" 200x150
      text "$52 · One of a kind"
      button "View" -> ProductDetail
    card "Terracotta Vase"
      image "photo" 200x150
      text "$64 · One of a kind"
      button "View" -> ProductDetail

screen ProductDetail "Shopper reviews a single piece before adding it to cart"
  navbar "Ceramics Co | Shop -> Catalog | Cart -> Cart | Sign in -> SignIn"
  breadcrumb "Shop / Speckled Stoneware Mug"
  split 60/40
    left
      image "photo gallery" 480x320
      text "Hand-thrown stoneware mug with a speckled glaze. One-of-a-kind piece — once it's gone, it's gone."
    right
      heading "Speckled Stoneware Mug"
      badge "Available" success
      text "$38"
      button "Add to cart" primary -> Cart

screen Cart "Shopper reviews items and totals before checking out"
  navbar "Ceramics Co | Shop -> Catalog | Cart -> Cart | Sign in -> SignIn"
  heading "Your Cart"
  table "Item | Price | "
    row "Speckled Stoneware Mug | $38 | Remove"
    row "Blue Glaze Bowl | $52 | Remove"
  row
    right
    text "Total: $90"
  row
    right
    button "Checkout" primary -> Checkout

screen Checkout "Shopper enters shipping and payment details — guest or signed in"
  navbar "Ceramics Co | Shop -> Catalog | Cart -> Cart | Sign in -> SignIn"
  heading "Checkout"
  text "Checking out as a guest — Sign in instead"
  input "Full name"
  input "Shipping address"
  input "Email (for your confirmation)"
  divider
  heading "Payment"
  input "Card number"
  row
    input "Expiry"
    input "CVC"
  row
    right
    button "Place order" primary -> OrderConfirmation

screen OrderConfirmation "Shopper sees their order was placed"
  navbar "Ceramics Co | Shop -> Catalog | Cart -> Cart | Sign in -> SignIn"
  heading "Order confirmed!"
  text "We've emailed your confirmation. Order #10482 — $90"
  button "Continue shopping" primary -> Catalog

screen SignIn "Shopper or Store Admin signs in via Thunder"
  navbar "Ceramics Co | Shop -> Catalog | Cart -> Cart | Sign in -> SignIn"
  heading "Sign in"
  text "Sign in to save your details and view order history."
  button "Continue with Thunder" primary -> OrderHistory

screen OrderHistory "Signed-in Shopper tracks their past purchases"
  navbar "Ceramics Co | Shop -> Catalog | Cart -> Cart | My Orders -> OrderHistory"
  heading "My Orders"
  table "Order | Date | Total | Status"
    row "#10482 | Aug 10 | $90 | Shipped"
    row "#10391 | Jul 22 | $64 | Delivered"

screen AdminListings "Store Admin manages product listings"
  navbar "Ceramics Co Admin"
  sidebar "Listings -> AdminListings | Orders -> AdminOrders"
  row
    heading "Product Listings"
    right
    button "New listing" primary -> AdminEditListing
  table "Title | Price | Status | " -> AdminEditListing
    row "Speckled Stoneware Mug | $38 | Available | Edit"
    row "Terracotta Vase | $64 | Sold | Edit"

screen AdminEditListing "Store Admin creates or edits a product listing"
  navbar "Ceramics Co Admin"
  sidebar "Listings -> AdminListings | Orders -> AdminOrders"
  breadcrumb "Listings / Speckled Stoneware Mug"
  heading "Edit Listing"
  input "Title"
  textarea "Description"
  row
    input "Category"
    input "Price"
  image "Upload photos" 300x160
  row
    right
    button "Cancel" -> AdminListings
    button "Save listing" primary -> AdminListings

screen AdminOrders "Store Admin views and fulfills incoming orders"
  navbar "Ceramics Co Admin"
  sidebar "Listings -> AdminListings | Orders -> AdminOrders"
  row
    heading "Orders"
    right
    select "Status: All"
  table "Order | Shopper | Total | Status | " -> AdminOrderDetail
    row "#10482 | J. Alvarez | $90 | Placed | View"
    row "#10391 | Guest | $64 | Packed | View"

screen AdminOrderDetail "Store Admin updates one order's fulfillment status"
  navbar "Ceramics Co Admin"
  sidebar "Listings -> AdminListings | Orders -> AdminOrders"
  breadcrumb "Orders / #10482"
  heading "Order #10482"
  text "J. Alvarez — 123 Kiln St, Springfield"
  table "Item | Price"
    row "Speckled Stoneware Mug | $38"
    row "Blue Glaze Bowl | $52"
  row
    select "Status: Placed"
    button "Update status" primary -> AdminOrders

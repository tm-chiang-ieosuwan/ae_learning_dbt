with order_items as (
  select
    id               as order_item_id,
    order_id,
    user_id,
    product_id,
    inventory_item_id,
    status,
    created_at,
    shipped_at,
    delivered_at,
    returned_at,
    sale_price,
    sale_price as unit_price,
    sale_price * 1 as gross_revenue
  from {{ source('thelook', 'order_items') }}
)
select * from order_items
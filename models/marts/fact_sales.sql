with oi as (select * from {{ ref('stg_order_items') }}),
     o  as (select * from {{ ref('stg_orders') }}),
     p  as (select * from {{ ref('stg_products') }})

select
  oi.order_item_id,
  oi.order_id,
  o.user_id,
  p.product_id,
  o.order_ts,
  o.order_date,
  o.order_month,
  o.order_quarter,
  p.brand,
  p.category,
  oi.unit_price,
  oi.gross_revenue
from oi
join o using (order_id)
join p using (product_id)
where o.status = 'Complete'

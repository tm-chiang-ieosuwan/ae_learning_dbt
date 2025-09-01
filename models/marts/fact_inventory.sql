select
  id               as inventory_item_id,
  product_id,
  created_at,
  sold_at,
  cast(created_at as date) as created_date,
  case when sold_at is not null then 1 else 0 end as is_sold,
  date_diff(sold_at, created_at, day) as days_to_sell
from {{ source('thelook', 'inventory_items') }}
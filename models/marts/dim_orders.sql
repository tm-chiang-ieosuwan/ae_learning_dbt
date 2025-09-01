select distinct
  order_id,
  user_id,
  order_date,
  order_month,
  order_quarter,
  status,
  is_shipped,
  is_delivered,
  is_returned
from {{ ref('stg_orders') }}
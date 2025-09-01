select distinct
  product_id,
  brand,
  category,
  product_name,
  department,
  sku,
  distribution_center_id,
  cost,
  retail_price
from {{ ref('stg_products') }}

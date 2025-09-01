with products as (
  select
    id    as product_id,
    brand,
    category,
    name  as product_name,
    department,
    sku,
    distribution_center_id,
    cost,
    retail_price
  from {{ source('thelook', 'products') }}
)
select * from products
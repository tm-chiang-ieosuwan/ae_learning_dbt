with orders as (
  select
    order_id,
    user_id,
    status,
    gender,                       
    created_at,                  
    shipped_at,
    delivered_at,
    returned_at,
    num_of_item,
    cast(created_at as date) as order_date,
    created_at              as order_ts,
    date_trunc(cast(created_at as date), month)   as order_month,
    date_trunc(cast(created_at as date), quarter) as order_quarter,
    case when shipped_at   is not null then 1 else 0 end as is_shipped,
    case when delivered_at is not null then 1 else 0 end as is_delivered,
    case when returned_at  is not null then 1 else 0 end as is_returned
  from {{ source('thelook', 'orders') }}
)
select * from orders
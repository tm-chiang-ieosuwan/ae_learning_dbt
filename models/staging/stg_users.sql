with users as (
  select
    id          as user_id,
    first_name,
    last_name,
    email,
    age,
    gender,
    state,
    street_address,
    postal_code,
    city,
    country,
    latitude,
    longitude,
    traffic_source as signup_traffic_source,
    created_at     as user_created_ts,
    user_geom
  from {{ source('thelook', 'users') }}
)
select * from users

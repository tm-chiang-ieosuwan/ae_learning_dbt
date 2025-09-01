with events as (
  select
    id                     as event_id,
    user_id,
    sequence_number,
    session_id,
    created_at             as event_ts,
    cast(created_at as date) as event_date,
    traffic_source,
    event_type,
    uri,
    ip_address,
    city,
    state,
    postal_code,
    browser
  from {{ source('thelook', 'events') }}
)
select * from events
select
  event_id,
  user_id,
  event_ts,
  event_date,
  traffic_source,
  event_type,
  session_id,
  browser,
  city,
  state
from {{ ref('stg_events') }}
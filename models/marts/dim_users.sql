select distinct
  user_id,
  first_name,
  last_name,
  email,
  age,
  gender,
  state,
  city,
  country,
  signup_traffic_source,
  user_created_ts
from {{ ref('stg_users') }}
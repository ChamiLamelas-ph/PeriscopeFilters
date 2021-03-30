-- generate dates including today using row numbers of [daily_topline_spend]
-- will provide the user with only 1000 days they can select from starting from today
select (
    convert_timezone('America/Los_Angeles', dateadd(day,1,getdate()))::date - row_number() over (order by true)
  )::date as n
from [daily_topline_spend]
order by 1 desc
limit 1000
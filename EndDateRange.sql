select (
    convert_timezone('America/Los_Angeles', dateadd(day,1,getdate()))::date - row_number() over (order by true)
  )::date as n
from [daily_topline_spend]
order by 1 desc
limit 1000
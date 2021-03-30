case
  -- date column should be equal to today's date in LA
  when [value] = 'today' then [column] = to_char(convert_timezone('America/Los_Angeles', getdate()), 'YYYY-MM-DD')
  -- date column should be equal to 1 day before today's date in LA
  when [value] = 'yesterday' then [column] = to_char(dateadd(day,-1,convert_timezone('America/Los_Angeles', getdate())), 'YYYY-MM-DD')
  -- date column should be between 2 days ago and today's date in LA
  when [value] = 'last3d' then [column] between to_char(dateadd(day,-2,convert_timezone('America/Los_Angeles', getdate())), 'YYYY-MM-DD') and to_char(convert_timezone('America/Los_Angeles', getdate()), 'YYYY-MM-DD')
  -- date column should be between 6 days ago and today's date in LA
  when [value] = 'last7d' then [column] between to_char(dateadd(day,-6,convert_timezone('America/Los_Angeles', getdate())), 'YYYY-MM-DD') and to_char(convert_timezone('America/Los_Angeles', getdate()), 'YYYY-MM-DD')
  -- date column should be between 13 days ago and today's date in LA
  when [value] = 'last14d' then [column] between to_char(dateadd(day,-13,convert_timezone('America/Los_Angeles', getdate())), 'YYYY-MM-DD') and to_char(convert_timezone('America/Los_Angeles', getdate()), 'YYYY-MM-DD')
  -- date column should be between 29 days ago and today's date in LA
  when [value] = 'last30d' then [column] between to_char(dateadd(day,-29,convert_timezone('America/Los_Angeles', getdate())), 'YYYY-MM-DD') and to_char(convert_timezone('America/Los_Angeles', getdate()), 'YYYY-MM-DD')
  -- date column's year and month should match year and month of today's date in LA
  when [value] = 'thism' then substring([column],1,7) = to_char(convert_timezone('America/Los_Angeles', getdate()), 'YYYY-MM')
  -- date column's year and month should match year and month of day one month back from today's date in LA
  when [value] = 'lastm' then substring([column],1,7) = to_char(convert_timezone('America/Los_Angeles', dateadd(month, -1, getdate())), 'YYYY-MM')
else 1=1 end
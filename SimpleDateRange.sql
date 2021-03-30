case
  when [value] = 'today' then [column] = to_char(convert_timezone('America/Los_Angeles', getdate()), 'YYYY-MM-DD')
  when [value] = 'yesterday' then [column] = to_char(dateadd(day,-1,convert_timezone('America/Los_Angeles', getdate())), 'YYYY-MM-DD')
  when [value] = 'last3d' then [column] between to_char(dateadd(day,-2,convert_timezone('America/Los_Angeles', getdate())), 'YYYY-MM-DD') and to_char(convert_timezone('America/Los_Angeles', getdate()), 'YYYY-MM-DD')
  when [value] = 'last7d' then [column] between to_char(dateadd(day,-6,convert_timezone('America/Los_Angeles', getdate())), 'YYYY-MM-DD') and to_char(convert_timezone('America/Los_Angeles', getdate()), 'YYYY-MM-DD')
  when [value] = 'last14d' then [column] between to_char(dateadd(day,-13,convert_timezone('America/Los_Angeles', getdate())), 'YYYY-MM-DD') and to_char(convert_timezone('America/Los_Angeles', getdate()), 'YYYY-MM-DD')
  when [value] = 'last30d' then [column] between to_char(dateadd(day,-29,convert_timezone('America/Los_Angeles', getdate())), 'YYYY-MM-DD') and to_char(convert_timezone('America/Los_Angeles', getdate()), 'YYYY-MM-DD')
  when [value] = 'thism' then substring([column],1,7) = to_char(convert_timezone('America/Los_Angeles', getdate()), 'YYYY-MM')
  when [value] = 'lastm' then substring([column],1,7) = to_char(convert_timezone('America/Los_Angeles', dateadd(month, -1, getdate())), 'YYYY-MM')
else 1=1 end
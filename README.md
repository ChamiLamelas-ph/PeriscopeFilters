# Periscope Filters

## Date Range Filters 

In place of the provided `DateRange` filter, one can implement it as a combination of 3 filters. The first filter (`SimpleDateRange`) will provide a list of date ranges the user can select from. The second two filters allow the user to select start (`StartDateRange`) and end (`EndDateRange`) dates from a list of dates. This is done follow [this community post](https://support.sisense.com/hc/en-us/community/posts/360037989093-Custom-Date-Range-Filter) as provided by Periscope support 3/30/2021.

### Implementation

`SimpleDateRange.sql` gives the SQL used to generate the dates for the filter values:
* `today` - today in LA time zone
* `yesterday` - yesterday
* `last3d` - last 3 days (including today)
* `last7d` - last 7 days (including today)
* `last14d` - last 14 days (including today)
* `last30d` - last 30 days (including today)
* `thism` - this month
* `lastm` - last month
This is placed The dates for the second filter value and onward are also generated during query execution time in the LA time zone.

`StartDateRange.sql` gives the SQL used to generate the dates that can be selected as the starting date starting back from today in the LA time zone.

`EndDateRange.sql` gives the SQL used to generate the dates that can be selected as the ending date starting back from today in the LA time zone.

### Usage in Dashboard Design

Inside charts, you can filter dates using the following SQL:
```
select distinct(date) from [daily_topline_spend]
where [date=SimpleDateRange]
and [date>=StartDateRange]
and [date<=EndDateRange]
order by date
```
Here the actual column being filtered is `date`. The column you filter on **must be a YYYY-MM-DD string**.

### Usage by Viewers

This section assumes that all three filters function as radio buttons as opposed to checkboxes and that filtering is implemented in charts using the code above.

If the viewer wishes to choose one of the `SimpleDateRange` filters, they should either:
* Not select any value for `StartDateRange` or `EndDateRange`.
* Select values for `StartDateRange` and `EndDateRange` that are beyond the dates that would be included in the selected `SimpleDateRange` filter.

If the user wishes to choose the `StartDateRange` and `EndDateRange` filters, you should remove all selections from the `SimpleDateRange` filter to be safe. Note that in choosing these ranges, you can begin typing in the date into search bar at the top of the filter selection menu.




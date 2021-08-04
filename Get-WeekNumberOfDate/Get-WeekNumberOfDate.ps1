# Get week number of date
get-date -UFormat %V

"{0:d1}" -f ($(Get-Culture).Calendar.GetWeekOfYear((Get-Date),[System.Globalization.CalendarWeekRule]::FirstFourDayWeek, [DayOfWeek]::Monday))

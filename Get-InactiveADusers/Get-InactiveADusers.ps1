
Import-Module ActiveDirectory 
$DaysInactive = 90
$inactiveTime = (Get-Date).Adddays(-($DaysInactive))
# Get AD Users inactive for x days
Get-ADUser -SearchBase "OU=AllUsers,DN=DemoDoamin,DN=local" -Filter {LastLogonTimeStamp -lt $inactiveTime -and enabled -eq $true} -Properties LastLogonTimeStamp |
    # Create output Name and lastLogonTimestamp attributes
    Select-Object Name,@{Name="LastLoginDate"; Expression={[DateTime]::FromFileTime($_.lastLogonTimestamp).ToString('yyyy-MM-dd')}} |
        # Create CSV file    
        export-csv c:\Junk\Inactive_Users.csv -NoTypeInformation
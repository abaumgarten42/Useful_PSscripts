# Add a calculated property to an object

# Calculate "IsOld" property based on date and threshold date
$dateTime = (Get-Date).AddDays(-380) # Get Date - x days - for testing
$threshold = (Get-Date).AddDays(-365) # define threshold for "old" in - x days
# here we go
$a = $dateTime |
    Select-Object Date,@{ Name = 'isOld' ; Expression = { If ($_ -lt $threshold ) {$true} else {$false}} }
$a

# Calculate true/false property for LastLogonDate of AD computer = older than 365 days
$threshold = (Get-Date).AddDays(-365) # define threshold for "old" in - x days
Get-AdComputer -properties -filter | 
    Select-Object Name, OperatingSystem, OperatingSystemVersion, LastLogonDate, @{ Name = 'isOld' ; Expression = { If ($_.LastLogonDate -lt $threshold ) {$true} else {$false}} } | 
        Out-File -Encoding utf8 -FilePath "C:\Downloads\computers.txt"

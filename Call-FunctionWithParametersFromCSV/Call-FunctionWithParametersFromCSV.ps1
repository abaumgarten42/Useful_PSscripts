## Call a Function and read parameters from CSV file

# Define Function 
function JustForTest {
    param (
        [string]$wlidsvc,
        [string]$Action,
        [string]$ServiceStatus
    )
    # Put your code here
    Write-Output "Service = $wlidsvc / Action = $Action / Status  = $ServiceStatus"
}
# Read CSV file with parameters
$lines = Import-Csv -Path test1.csv -Delimiter ","
# Execute function for each line in CSV using the parameter values
foreach ($line in $lines) {
    JustForTest -wlidsvc $line.wlidsvc -Action $line.Action -ServiceStatus $line.ServiceStatus
}
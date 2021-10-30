# Get all disks in Azure in a Subcription + related VM
# Requires the AZ cmdlets
# Login with Connect-AzAccount
# Set context with Set-AzContext -Name "<Name of Subscription>"
# or Set-AzContext -SubscriptionID "<Subscription ID>"

# "Long" version
$result = "DiskName,DiskResourceGroupName,VMname,VMResourceGroupName `r`n"
$diskObjects = get-azdisk
foreach ($diskObj in $diskObjects) {
    $diskName = $diskObj.Name    
    $diskRG = $diskObj.ResourceGroupName
    $relVMname = ($diskObj.ManagedBy).Split("/")[-1]
    $VMobj = Get-AZVM -Name $relVMname
    $vmName = $VMobj.Name
    $vmRG = $VMobj.ResourceGroupName
    $result += "$diskName" +","+ "$diskRG" +","+ "$vmName" +","+ "$vmRG" + "`r`n"
    }
$result

# "Short" version
$result = "DiskName,DiskResourceGroupName,VMname,VMResourceGroupName `r`n"
$diskObjects = get-azdisk
foreach ($diskObj in $diskObjects) {
    $VMobj = Get-AZVM -Name (($diskObj.ManagedBy).Split("/")[-1])
    $result += ((($diskObj.Name),($diskObj.ResourceGroupName),($VMobj.Name),($VMobj.ResourceGroupName)) -join ",") + "`r`n"
    }
$result

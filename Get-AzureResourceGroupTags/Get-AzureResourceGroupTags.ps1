# Get Tags from a ResourceGroup and check values

$rgName = "azneiaasdemo"
$envName = "Environment"
$envValue = "PROD"
$tags = Get-AzTag -ResourceId (Get-AzResourceGroup -Name "$rgName").ResourceId
$value = $tags.Properties.TagsProperty.$envName
# Just some magic
if ($value) {
    if ($value -eq $envValue) { Write-Host "Value $($value.ToUpper()) found in Tag $($envName.ToUpper()) :-)" }
    else { Write-Output "Value $($envValue.ToUpper()) not found in Tag $($envName.ToUpper()) : Current value is $($value.ToUpper())" }
}
else { Write-Output "Tag with name $($envName.ToUpper()) not found" }
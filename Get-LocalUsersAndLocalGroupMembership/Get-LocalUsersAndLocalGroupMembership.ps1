$ADSI = [ADSI]"WinNT://$env:COMPUTERNAME"
$ADSI.Children | Where-Object { $_.SchemaClassName -eq "User" } | ForEach-Object {
    $GROUPS = $_.Groups() | ForEach-Object { $_.GetType().InvokeMember("Name", 'GetProperty', $null, $_, $null) }
    $_ | Select-Object @{n = 'UserName'; e = { $_.Name } }, @{n = 'LocalGroupMemberships'; e = { $GROUPS -join ' ; ' } }
}
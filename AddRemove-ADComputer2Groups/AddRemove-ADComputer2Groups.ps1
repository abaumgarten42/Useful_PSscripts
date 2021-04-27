# Example how to add computer in AD Group
# Example how to remove computer of AD Group
# based on OU -> All computer in a OU will be added or removed

$ou = 'ou=WVD,dc=MyDomain,dc=com'
$grp = "WVD_Hosts"

# Add computer to group
Get-ADComputer -SearchBase $ou -Filter * -SearchScope OneLevel | ForEach-Object { Add-ADGroupMember $grp -Members $_.DistinguishedName }

# Remove computer from group
$grpMembers = Get-ADGroupMember -Identity $grp
foreach ($member in $grpMembers) {
    if ($member.DistinguishedName -notlike "*$ou") {
        Remove-ADGroupMember $grp -Members $member.DistinguishedName
    }
}
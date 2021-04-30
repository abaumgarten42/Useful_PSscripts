# Get details and groupmemberships of AD user

Import-Module ActiveDirectory
# List of users
$users = "mmouse","ppan1234"

$Table = @() # clear table variable
foreach ($user in $users) {
    $grp = "" # clear grp variable
    $Row = [ordered]@{SamAccountName = "";DisplayName = "";Email = "";Groups = ""} # build hashtable
    $a = Get-AdUser -Identity $user -Properties * # get user
    $groups = $a.MemberOf # groupmemberships of user
    foreach ($g in $groups) {
        $b = Get-ADGroup $g # get groups
        $grp += $b.Name + "," # prepate group output
    }
    $grp = $grp.Substring(0, $grp.Length - 1) 
    # build row data
    $row.SamAccountName = $a.SamAccountName
    $row.DisplayName = $a.DisplayName
    $row.Email = $a.EmailAddress
    $row.Groups = $grp
    $objRow = New-Object PSObject -Property $row # prepare row object
    $Table += $objRow # add row to table
}
$Table

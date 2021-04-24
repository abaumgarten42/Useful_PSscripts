# Sets the password and Change Password At Logon for AD user in list
# txt contains SamAccountNames

$users = Get-Content -Path "./UserSetPasswordList.txt"
foreach ($user in $users) {
    # Set the password
    Set-ADAccountPassword -Identity $user -Reset -NewPassword (ConvertTo-SecureString -AsPlainText "p@ssw0rd" -Force)
    # Set ChangePasswordAtLogon
    Set-ADUser -Identity $user -ChangePasswordAtLogon $true
}$users = Get-Content -Path "UserNameList.txt"
foreach ($user in $users) {
    # Set the password
    Set-ADAccountPassword -Identity $user -Reset -NewPassword (ConvertTo-SecureString -AsPlainText "p@ssw0rd" -Force)
    # Set ChangePasswordAtLogon
    Set-ADUser -Identity $user -ChangePasswordAtLogon $true
}
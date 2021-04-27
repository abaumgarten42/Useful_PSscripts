# Clear Profile Path of AD User
# One user
# All users in a AD Group 
  
  #Try one user first
  Get-ADUser -Identity "<testUser-samAccountName>" -Properties ProfilePath | Set-ADUser -Clear ProfilePath

  # Not tested by myself - use on your own risk!
  Get-ADGroupMember -Identity "<YourGroupContainingUsers-Name>" | Where-Object { $_.objectClass -eq "user" } | Set-ADUser -Clear ProfilePath
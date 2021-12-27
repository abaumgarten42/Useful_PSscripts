# How to chain piplines

# && will execute the first and the second command if the first command is successfull
Write-Output "This is the first command" && Write-Output "This is the second command"

# || will execute the first and the second command if the first command fails
Write-Output "This is the first command" || Write-Output "This is the second command"
Write-Error "This is the first command" || Write-Output "This is the second command"

# it's simmilar to this 
Write-Output "This is the first command" ; if ($?) {Write-Output "This is the second command"}
Write-Error "This is the first command" ; if (-not $?) {Write-Output "This is the second command"}

# more details here:
# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_pipeline_chain_operators
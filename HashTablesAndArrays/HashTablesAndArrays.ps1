# Hashtable
$hash = @{}
$hash = @{ Id = "Id1"
    Name      = "Name1"
}
$hash

# Read input and HashTable
$in = Read-Host -Prompt 'Enter value pair "id:name"'
$hash = @{ Id = (($in).Split(":")[0])
    Name      = (($in).Split(":")[1])
}
$hash

# Array
$array = @()
$array=@(1,2,3,5,6,7,8)
$array

# Read input and Array
$in = Read-Host -Prompt 'Enter values separated by comma'
$array = @(($in).Split(","))
$array
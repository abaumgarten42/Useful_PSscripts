# Compare 2 arrays and report which string is missing

$array1 = @('black', 'blue', 'red', 'white', 'yellow')
$array2 = @('black', 'yellow', 'grey','purple','green')

$array1 | ForEach-Object {
    if ($array2 -notcontains $_) {
        Write-Host "`$array2 does not contain `$array1 string [$_]"
    }
}
$array2 | ForEach-Object {
    if ($array1 -notcontains $_) {
        Write-Host "`$array1 does not contain `$array2 string [$_]"
    }
}

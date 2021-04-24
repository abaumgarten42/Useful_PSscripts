# Use script variables in a Scriptblock example

$a = "1"
$b = "2"

Invoke-Command -ComputerName Server01 -ScriptBlock {
    Write-Output The value of variable a is: $using:a
    Write-Output The value of variable b is: $using:b
}

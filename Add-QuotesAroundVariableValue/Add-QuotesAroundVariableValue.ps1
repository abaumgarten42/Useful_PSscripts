# Add double quotes around a variable value

$outputExample = 'C:\Program Files\WinRAR\uninstall.exe param1,param2'
$outputExampleWithQuotes = '"{0}"' -f $outputExample
$outputExampleWithQuotes

# Add double quotes around a variable value / without params
$outputExample = 'C:\Program Files\WinRAR\uninstall.exe param1,param2'
$params = ((Split-Path -Path $outputExample -Leaf).Split(" "))[1]
$outputFileAndPath = ($outputExample.replace($params,"")).Trim()
$outputExampleWithQuotes = ('"{0}"' -f $outputFileAndPath) + " $params"
$outputExampleWithQuotes
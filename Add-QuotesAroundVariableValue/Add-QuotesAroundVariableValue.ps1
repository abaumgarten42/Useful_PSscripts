# Add double quotes around a variable value

$outputExample = 'C:\Program Files\WinRAR\uninstall.exe param1,param2'
$outputExampleWithQuotes = '"{0}"' -f $outputExample
$outputExampleWithQuotes
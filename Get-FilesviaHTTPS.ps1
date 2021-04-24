# Get files via HTTPS

$url = 'https://packages.vmware.com/tools/esx/latest/windows/'
$url1 = 'https://packages.vmware.com/tools/esx/latest/windows/x64/'

$content = Invoke-WebRequest $url1 -UseBasicParsing
$filename = $content.Links.HREF | Select-Object -Skip 1 | ForEach-Object { $_.Split("-") }
$filename[2] + "-" + $filename[3]
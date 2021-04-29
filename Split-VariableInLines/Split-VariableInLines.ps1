# Split a multi-line variable in seperate lines

$Description = "This is line 1
This is line 2
This is line 3"

$secondLine = ($Description.Split([Environment]::NewLine))[1] # Number starts with 0 for first line
$secondLine

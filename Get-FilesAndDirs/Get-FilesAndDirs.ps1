# Get content of folder and subfolders - output if object is file or folder 

$Path = "C:\Test"
Get-ChildItem -Path $path -Recurse | ForEach-Object {

    if ($_.PsisContainer) {
        "$($_.Name) = directory"
    }
    else {
        "$($_.Name) = file"
    }
}
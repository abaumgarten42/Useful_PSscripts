# Create large file - just containing zeros
$file = new-object System.IO.FileStream c:\temp\testfile1.bin, Create, ReadWrite
$file.SetLength(4MB)
$file.Close()
#####
# Create large file - just containing zeros
fsutil.exe file createnew c:\temp\fsutilfile.bin 4096000
#####
# Create large file - Random content
$file = "c:\temp\testfile4.bin"
$sizeInMB = 8
$out = new-object byte[] ($sizeInMB*1048576)
(new-object Random).NextBytes($out)
[IO.File]::WriteAllBytes($file, $out)
######
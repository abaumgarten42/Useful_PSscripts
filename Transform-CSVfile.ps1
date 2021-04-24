$NewLines = "newID,DisplayName,Email,oldID,FirstName,LastName`r`n" #Define new header
Import-Csv -Path ./transformScript.csv | # read csv file
ForEach-Object { # for each line in csv
    $i = $_.ID # get ID value
    $f = $_.FirstName # get FirstName value
    $l = $_.LastName # get LastName value
    $newID = $i + $f.Substring(0, 1) + $l.Substring(0, 1) # build new ID - ID + first char of firstname and lastname
    $displayName = '"' + "$l, $f" + '"' # build DisplayName with quotes - , and space in display name
    $emailAddress = "$f.$l" + "@test.org" # build email-address
    $NewLines += "$newID,$displayName,$emailAddress,$i,$f,$l" + "`n"  # build new lines with new values
}
$NewLines
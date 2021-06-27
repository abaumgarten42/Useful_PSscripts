# Random Password Generator

# Scramble String function
function Scramble-String([string]$inputString){     
    $characterArray = $inputString.ToCharArray()   
    $scrambledStringArray = $characterArray | Get-Random -Count $characterArray.Length     
    $outputString = -join $scrambledStringArray
    return $outputString 
}
# Build random string - Add additional Lines if more than 8 characters required
$a = @(
    [char](97..122 | get-random), # small letters
    [char](65..90 | get-random), # capital letters
    (0..9 | get-random), # numbers
    [char](97..122 | get-random), # snall letters
    ('!','@','#','$','%','^','&','*','?',';','+' | get-random), # special characters
    [char](65..90 | get-random), # capital letters
    (0..9 | get-random), # numbers
    [char](97..122 | get-random) # small letters
   ) -join ''
# Mixing the random characters again 
$passWord = Scramble-String $a
$passWord
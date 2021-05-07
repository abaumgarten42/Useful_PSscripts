# Working with variables in function / parent + child scope of functions

# Set variables in script (parent scope)
$A = "Variable A set in script - parent scope"
$B = "Variable B set in script - parent scope"
function TestFunction {
    # Set variable in function (A = script scope / parent)
    $script:A = "Variable A set in function with script/parent scope"
    # Set variable in function (B = function scope / child)
    $B = "Variable B set in function - child scope"
}
# Call function
TestFunction
# Result
$A
$B
# Workinhg with datatable object

# Define the DataTable Columns
$table = New-Object system.Data.DataTable 'TestDataTable'
$newcol = New-Object system.Data.DataColumn FirstName, ([string]); $table.columns.add($newcol)
$newcol = New-Object system.Data.DataColumn LastName, ([string]); $table.columns.add($newcol)
$newcol = New-Object system.Data.DataColumn ID, ([int]); $table.columns.add($newcol)

# Add a DataTable row
$row = $table.NewRow()
$row.FirstName = ("Bill")
$row.LastName = ("Gates")
$row.ID = [int](12345)
$table.Rows.Add($row) 

# Get data from csv
$file = "./usersDataTable.csv" 
$users = Import-Csv $file -Delimiter ";" 
$users | ForEach-Object {
    $row = $table.NewRow()
    $row.FirstName = ($_.FirstName)
    $row.LastName = ($_.LastName)
    $row.ID = [int]($_.ID)
    $table.Rows.Add($row)
}

# Read datatable object

$table

# Select by LastName = ....
# $table.Select("LastName = 'Gates'")
# $table.Select("LastName = 'Gates'").ID
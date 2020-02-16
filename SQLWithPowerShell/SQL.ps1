$dbConn = New-Object -TypeName System.Data.SqlClient.SqlConnection
$dbConn.ConnectionString = "Server=localhost\SQLEXPRESS;Trusted_Connection=True;"
$dbConn.Open()

$createDB = "CREATE DATABASE mikesdb;"
$createTable = "use mikesdb; CREATE TABLE mikestable (ID int, firstname varchar(255), lastname varchar(255),)"

$command = New-Object -Type System.Data.SqlClient.SqlCommand
$command.Connection = $dbConn

$command.CommandText = $createDB
$reader = $command.ExecuteReader()

$command.CommandText = $createTable
$reader = $command.ExecuteReader()

$dbConn.State
$dbConn.Close()
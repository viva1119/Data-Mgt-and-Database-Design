<?php
echo "Search Developer<br/>";
$serverName = "LAPTOP-S80IJ82T\SQLDEV18"; 
$connectionInfo = array( "Database"=>"AppStoreDatabase");
$conn = sqlsrv_connect( $serverName, $connectionInfo);

if($conn)
{
    echo "Connection Successfully";
}
else
{
    echo "Failed to connect the database ! <br/>";
    die(print_r(sqlsrv_errors(),true));
}

$sql= "select * from Developer";
$stmt= sqlsrv_query($conn,$sql);

if($stmt === false)
{
    die(print_r(sqlsrv_errors(),true));
}
echo "
<table class='talbe' border=1>
<tr>
<th>DeveloperID</th>
<th>OfficialWebsite</th>
<th>DeveloperType</th>
<th>DeveloperName</th>
<th>Introduction</th>
</tr>";

while ($row=sqlsrv_fetch_Array($stmt,SQLSRV_FETCH_ASSOC))
{
    echo"<tr>";
    echo"<td>".$row['DeveloperID']."</td>";
    echo"<td>".$row['OfficialWebsite']."</td>";
    echo"<td>".$row['DeveloperType']."</td>";
    echo"<td>".$row['DeveloperName']."</td>";
    echo"<td>".$row['Introduction']."</td>";
    echo"<tr>";
}
    echo"</table>";
?>


<html>
<body background="border.jpg">
<form action="" method="post">

<h3>DeveloperID :</h3><input    type = 'text' name='DeveloperID'><br><br>
<input type = 'submit' name="Search" value= "Search">
</form>
<a href='home.php'><h2>Back to home page</h2></a>
</body>
</html>


<?php

if(isset($_POST["Search"])){
$serverName = "LAPTOP-S80IJ82T\SQLDEV18"; 
$connectionInfo = array( "Database"=>"AppStoreDatabase");
$conn = sqlsrv_connect( $serverName, $connectionInfo);


$DeveloperID=$_POST['DeveloperID'];

$sql="SELECT * FROM Developer WHERE DeveloperID='$DeveloperID'
";
$stmt = sqlsrv_query( $conn, $sql);

if( $stmt) {
		echo "Successfully.<br />";
    }
   
 else if( $stmt === false) {
		echo "insert fail.<br />";
    }




echo "
<table class='talbe' border=1>
<tr>
<th>DeveloperID</th>
<th>OfficialWebsite</th>
<th>DeveloperType</th>
<th>DeveloperName</th>
<th>Introduction</th>
</tr>";

while ($row=sqlsrv_fetch_Array($stmt,SQLSRV_FETCH_ASSOC))
{
    echo"<tr>";
    echo"<td>".$row['DeveloperID']."</td>";
    echo"<td>".$row['OfficialWebsite']."</td>";
    echo"<td>".$row['DeveloperType']."</td>";
    echo"<td>".$row['DeveloperName']."</td>";
    echo"<td>".$row['Introduction']."</td>";
    echo"<tr>";
}
    echo"</table>";


}
?>
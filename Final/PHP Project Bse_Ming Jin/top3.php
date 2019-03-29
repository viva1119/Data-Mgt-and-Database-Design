<?php
echo "Top 3 Application<br/>";
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

$sql= "select * from DownLoad";
$stmt= sqlsrv_query($conn,$sql);

if($stmt === false)
{
    die(print_r(sqlsrv_errors(),true));
}
echo "
<table class='talbe' border=1>
<tr>
<th>DownLoadID</th>
<th>ApplicationID</th>
<th>AppName</th>
<th>Version</th>
<th>DeviceID</th>
<th>Status</th>
</tr>";

while ($row=sqlsrv_fetch_Array($stmt,SQLSRV_FETCH_ASSOC))
{
    echo"<tr>";
    echo"<td>".$row['DownLoadID']."</td>";
    echo"<td>".$row['ApplicationID']."</td>";
    echo"<td>".$row['AppName']."</td>";
    echo"<td>".$row['Version']."</td>";
    echo"<td>".$row['DeviceID']."</td>";
    echo"<td>".$row['Status']."</td>";
    echo"<tr>";
}
    echo"</table>";
?>


<html>
<body background="border.jpg">
<form action="" method="post">

<input type = 'submit' name="Search" value= "Search Top 3">
</form>
<a href='home.php'><h2>Back to home page</h2></a>
</body>
</html>


<?php

if(isset($_POST["Search"])){
$serverName = "LAPTOP-S80IJ82T\SQLDEV18"; 
$connectionInfo = array( "Database"=>"AppStoreDatabase");
$conn = sqlsrv_connect( $serverName, $connectionInfo);



$sql="SELECT top 3
 ApplicationID, AppName,Version,COUNT(ApplicationID) as Downloads 

      FROM DownLoad 
      
group by ApplicationID,AppName,Version
order by Downloads desc

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
<th>ApplicationID</th>
<th>AppName</th>
<th>Version</th>
<th>Downloads</th>
</tr>";

while ($row=sqlsrv_fetch_Array($stmt,SQLSRV_FETCH_ASSOC))
{
    echo"<tr>";
    echo"<td>".$row['ApplicationID']."</td>";
    echo"<td>".$row['AppName']."</td>";
    echo"<td>".$row['Version']."</td>";
    echo"<td>".$row['Downloads']."</td>";

    echo"<tr>";
}
    echo"</table>";


}
?>
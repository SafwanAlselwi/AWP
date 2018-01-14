<?php
//to ignore the warning of the Deprecated: mysql_connect() function
error_reporting(E_ALL ^ E_DEPRECATED);

# take inputs & store in local variables
$name  = $_REQUEST['name'];
$addr1 = $_REQUEST['addr1'];
$addr2 = $_REQUEST['addr2'];
$email = $_REQUEST['email'];

# mysql_connect() connects the script to MySQL server
$con = mysql_connect('localhost','root','') or die('Could not connect');

# select a database
mysql_select_db("awp_lab_db",$con);

# query
if(mysql_query("insert into student_info (name,addr1,addr2,email) values('$name','$addr1','$addr2','$email')")){
		echo "Data inserted successfully!";
}

# release the database handle by closing the connection
mysql_close($con);
 ?>
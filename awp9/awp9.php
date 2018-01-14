<?php
//to ignore the warning of the Deprecated: mysql_connect() function
error_reporting(E_ALL ^ E_DEPRECATED);

$db=mysql_connect("localhost","root","") or die("Unable to connect");
mysql_select_db("awp_lab_db");

$doc= new DOMDocument();
$doc->load('awp9.xml');
$students = $doc->getElementsByTagName("student");
foreach($students as $student){
	$ages = $student->getElementsByTagName("age");
	$age  = $ages->item(0)->nodeValue;
	
	$names = $student->getElementsByTagName("name");
	$name  = $names->item(0)->nodeValue;
	
	$emails = $student->getElementsByTagName("email");
	$email  = $emails->item(0)->nodeValue;
	
	$query="insert into student_info (age, name, email) values('$age','$name','$email')";
	$res = mysql_query($query) or die("Unable to insert data");
}
print "<h2 align=center>Student Data Record</h2><br><br>";
print "<table border=1 align=center>";
print "<tr bgcolor=lightgrey>";
print "<th>Age</th>";
print "<th>Name</th>";
print "<th>Email</th>";
print "</tr>";

$res=mysql_query("select * from student_info");
while($row = mysql_fetch_array($res)){
	print "<tr>";
	print "<td>".$row['age']."</td>";
	print "<td>".$row['name']."</td>";
	print "<td>".$row['email']."</td>";
	print "</tr>";
}
print "</table>";
?>
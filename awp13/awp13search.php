<html>
	<h2>Retrieved Results</h2>
	<?php
	//to ignore the worning of the Deprecated: mysql_connect() function 
	error_reporting(E_ALL ^ E_DEPRECATED);
	$name = $_REQUEST['name'];
	
	$con=mysql_connect('localhost','root','') or die('Could not connect');
	mysql_select_db("awp_lab_db",$con);
	$result=mysql_query("select * from student_info where name like '%".$name."%'");
	
	if(mysql_num_rows($result) == 0)
		echo "No Data Matched";
	else{
		?>
			<table border="1">
			<tr>
				<th>Name</th>
				<th>Address Line 1</th>
				<th>Address Line 2</th>
				<th>Email-ID</th>
			</tr>
		<?php
			# retrieve all rows with matches
			while($row=mysql_fetch_array($result)){
				echo "<tr>";
					echo "<td>".$row['name']."</td>";
					echo "<td>".$row['addr1']."</td>";
					echo "<td>".$row['addr2']."</td>";
					echo "<td>".$row['email']."</td>";
				echo "</tr>";
			}
		}
		mysql_close($con);
		?>
	</table>
</html>
#!/wamp64/bin/perl/bin/perl -w
print "Content-type: text/html; \n\n";

use CGI;
$q=new CGI;
$Sname=$q->param("pname");
$Sage=$q->param("age");

use DBI;
$con = DBI->connect("dbi:mysql:awp_lab_db", "root", "") or die "Error $DBI::errstr";

$q = $con->prepare("insert into student_info(name,age) values ('$Sname',$Sage)");
$q->execute();

$q = $con->prepare("select * from student_info");
$q->execute();

print "
<html>
	<head> <title>Database Information</title> </head>
	<body>
		<h1>Inserting Of Record Successful!!!</h1>
		<hr>
		<center>
			<h2>User Information</h2>
			<hr>
			<table border=1 cellpadding=10>
				<tr><th>NAME</th><th>AGE</th></tr>";
					while(($Sname,$Sage) = $q->fetchrow() )
					{
						print "<tr><td>$Sname</td><td>$Sage</td></tr>";
					}
					$q->finish();
					$con->disconnect();
		print"</center>
		</table>
	</body>
</html>";
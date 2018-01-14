#!/wamp64/bin/perl/bin/perl -w

use CGI":standard";
print header();
print start_html('Server informations');

#this is a here-document
print<<"here";
	<table border="1">
	<tr>
		<th>Name</th>
		<th>Value</th>
	</tr>
here
#end of here-document
 
#display values
foreach $i(sort keys %ENV){
	print "<tr>
				<td>$i</td>
				<td>$ENV{$i}</td>
		   </tr>";
}
print"</table>";
print end_html;
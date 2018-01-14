#!/wamp64/bin/perl/bin/perl -w
print "Content-type: text/html; \n\n";

use CGI;
#create new CGI object to handle query
$q = new CGI;
#take input and store in local variable
$name = $q->param('name');

#define various greeting messages
@greet=("Hello","Hi","Marhaba","Sallam");

#choose a message based on the length of the input
$i = length($name)%4;

print"
<html>
<center>
	<h2>$greet[$i], $name</h2>
</center>
</html>";
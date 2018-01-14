#!"c:\wamp64\bin\perl\bin\perl.exe"
#Write a Perl program to display a digital clock which displays the current time of the server.
use CGI":standard";
print "Content-type: text/html;\n\n";
print "<html>
	   <head>
			<title>Digital Clock</title>
			<meta http-equiv=\"refresh\" content=\"1\">
	   </head>
	   <body>";
			my($s,$m,$h)=localtime();
			print h2("current time");
			print "$h:","$m:","$s";
print "</body></html>";
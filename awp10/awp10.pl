#!/wamp64/bin/perl/bin/perl -w
print "Content-type: text/html; \n\n";

#load CGI standard routines
use CGI":standard";

#open a file called count.txt to store values of number of views
open(FILE,"<count.txt");

#contents of file are copied to the variable
$count = <FILE>;

#close the file
close(FILE);

$count++;

#append the new incremented value to the beginning of the file
open(FILE,">count.txt");
print FILE "$count";
print "This page has been viewed $count times";
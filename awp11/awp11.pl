#!/wamp64/bin/perl/bin/perl -w
# Write a CGI-Perl program to use a cookie to remember the
# day of the last login from a user and display it when run.
# Note: ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday,$isdst) = localtime;

use CGI ":standard";

#>>> Get the existing day cookie, if there was one
@last_day = cookie('last_time');

#>>> Get the current date and make t he new cookie
$day_of_week = (qw(Sunday Monday Tuesday Wednesday Thursday Friday Saturday)) [(localtime)[6]];
$month = (qw(January February March April May June July August September October November December))[(localtime)[4]];
$day_of_month = (localtime)[3];
@day_stuff = ($day_of_week, $day_of_month, $month);

$day_cookie = cookie(-name => 'last_time',-value => \@day_stuff,-expires => '+1m'); #-expires => '+5d');
					
#>>> Produce the return document
#>>> First, put the cookie in the new header
print header(-cookie => $day_cookie);
print start_html('Cookies in Perl');

#>>> If there was no day cookie, this is the first visit
if (scalar(@last_day) == 0){
	print "Welcome, This is your first visit <br/>";
}
#>>> Otherwise, welcome the user back and give the date of the last visit
else
{
	($day_of_week , $day_of_month, $month) = @last_day;
	print "Welcome back, <br/> ",
		  "Your last visit was on ",
	      "$day_of_week, $month $day_of_month <br />";
}
print end_html;
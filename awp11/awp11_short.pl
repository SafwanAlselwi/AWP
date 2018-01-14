#!/wamp64/bin/perl/bin/perl -w
# Write a CGI-Perl program to use a cookie to remember the
# day of the last login from a user and display it when run.

use CGI ":standard";
@last_day = cookie('last_time');
$day = (localtime);

$day_cookie = cookie(-name => 'last_time', -value => $day, -expires => '+2m');			
print header(-cookie => $day_cookie);
print start_html('This is day_cookie.pl');

if (scalar(@last_day) == 0){
	print "Welcome to you on your first visit to our site <br/>";
}
else
{	($day)=@last_day;
	print "Welcome back!<br/> ",
		  "Your last visit was on $day <br/>";
}
print end_html;
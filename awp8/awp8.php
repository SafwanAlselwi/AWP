<!--
Program 8: Write a PHP program to store current date-time in a COOKIE and display the 
"Last visited on" date-time on the web page upon reopening of the same page.

Tags used:
    date("G:i -m/d/y") - Gives the timestamp where,
     	* G represents 24-hour format of hour without leading zeros
     	* i represents Minutes with leading zeros
     	* m represents Numeric representation of a month, with leading zeros
     	* d represents Day of the month, 2 digits with leading zeros
     	* y represents A two digit representation of a year
-->
<?php
	#create cookie
	setcookie('last_visit',date("G:i -m/d/y"),time()+60);
	#check if cookie exists
	if(isset($_COOKIE['last_visit'])){
			$visit = $_COOKIE['last_visit'];
			echo "Welcome back, Your last visit was: " .$visit;
	}
	else{ 
		#no cookies
		echo "Welcome, This is your first visit" ;
	}
?>
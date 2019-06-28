file {"/var/tmp/puppetdemo":
	ensure => "present",
	group => "thinknyx",
	mode => "777",
	owner => "demouser",
}

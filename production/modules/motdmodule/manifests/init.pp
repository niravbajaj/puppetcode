class motdmodule {
	
	$filename = "/etc/motd"
	$message = "Login Successful... Unauthorized login to this machine will be reported!"
	$username = "nirav"
	$userid = "4564"
	$usershell = "/bin/bash"

	file {"$filename":
	ensure => "present",	
	content => "$message\nThis server name is $::hostname with total memory ${::memory['system']['total']} having kernel release $::kernelrelease with uptime $::uptime\n",
	}

	user {"$username":
	ensure => "present",
	uid => "$userid",
	shell => "$usershell",
	}
}

class webserver_msg {
	# Install epel & nginx Package
	package {"epel-release":
		ensure => "present",
		before => Service['nginx'],
	}
	
	notify {"epic-release is installed":}
	
	package {"nginx":
		ensure => "present",
	}
	
	notify {"Nginx is installed":
		message => "Nginx is installed...",
	}

	# Configure file
	file {"/usr/share/nginx/html/index.html":
		ensure => "present",
		content => "<h1>This web server is running on client</h1>",
	}

	notify {"Check your browser":
		message => "Check your browser...",
	}

	#start service
	service {"nginx":
		ensure => "running",
		enable => "true",
		subscribe => File['/usr/share/nginx/html/index.html'],
	}
	
	notify {"Nginx is started":
		message => "Nginx is started...",
	}	

}

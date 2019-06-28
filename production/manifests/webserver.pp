class webserver {
	# Install epel & nginx Package
	package {"epel-release":
		ensure => "present",
		before => Service['nginx'],
	}
	
	package {"nginx":
		ensure => "present",
		require => Package['epel-release'],
	}

	# Configure file
	file {"/usr/share/nginx/html/index.html":
		ensure => "present",
		content => "<h1>This web server is running on client</h1>",
	}

	#start service
	service {"nginx":
		ensure => "running",
		enable => "true",
		subscribe => File['/usr/share/nginx/html/index.html'],
	}

}

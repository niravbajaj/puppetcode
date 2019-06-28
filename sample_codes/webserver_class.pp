class webserver {
	# Install Package
	package {"httpd":
		ensure => "present",
		before => Service['httpd'],
	}
	
	# Create File
	file {"/var/www/html/index.html":
		ensure => "present",
		content => "<h1>This is my class program</h1>",
	}
	
	# Start Service
	service {"httpd":
		ensure => "running",
		enable => "true",
		subscribe => File['/var/www/html/index.html']
	}
}

# Call Class
include webserver

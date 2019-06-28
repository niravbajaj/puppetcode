class webmodule {
	# install Package
	package {"httpd":
		ensure => "present",
	}

	# Configure Index File
	file {"/var/www/html/index.html":
		ensure => "present",
		content => "<h1>This is my first real Puppet run using Node defination and Puppet Module</h1>",
	}
	
	#Start Service
	service {"httpd":
		ensure => "running",
		enable => "true",
		subscribe => File['/var/www/html/index.html'],
		require => Package['httpd'],
	}
}

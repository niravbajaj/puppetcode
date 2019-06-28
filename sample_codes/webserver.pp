#Install pckg
package {"httpd":
	ensure => "present",
}

#create file
file {"/var/www/html/index.html":
	ensure => "present",
	content => "<h1>Hello World</h1>",
}

#start service
service {"httpd":
	ensure => "running",
	enable => "true",
}

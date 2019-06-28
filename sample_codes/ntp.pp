# Install NTP Package 
package {"ntp":
	ensure => "present",
	before => Service['ntpd'],
}

# edit Config File
file {"/etc/ntp.conf":
	ensure => "present",
	content => "server 0.centos.pool.ntp.org
		server 1.centos.pool.ntp.org
		server 2.centos.pool.ntp.org
		server 4.centos.pool.ntp.org\n",
	notify => Service['ntpd'],
}

# start service
service {"ntpd":
	ensure => "running",
	enable => "true",
	
}

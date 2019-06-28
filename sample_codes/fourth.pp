file{"/var/tmp/demodir":
	ensure => "directory",
}
file {"/var/tmp/demodir/demofile.txt":
	ensure => "present",
	content => "This is my first Puppet File",
	mode => "777",
	group => "root",
	owner => "root",
}

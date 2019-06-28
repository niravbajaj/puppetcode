class nginxmod::nginxuser{
	user {"nginxuser":
	ensure => "present",
	uid => "4499",
	shell => "/bin/bash",
	}
}

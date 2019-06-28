group {'newgrp':
	ensure => "present",
	gid => "9988",
}
user {"thinknyxuser":
	ensure => "present",
	uid => "9876",
	gid => "9988",
	shell => "/bin/bash",
	password => '$1$obI3ssqR$FHM6PzqBXPJQ5NUDI2Ej50',

}

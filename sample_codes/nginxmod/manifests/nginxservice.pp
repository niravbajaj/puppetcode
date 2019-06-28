class nginxmod::nginxservice{
	
	service {"nginx":
	ensure => "running",
	enable => "true",
	require => Class['nginxmod::nginxpkg'],
	subscribe => Class['nginxmod::nginxfile']
	}
}

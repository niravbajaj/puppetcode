class nginxmod::nginxpkg{
	package{'nginx':
	ensure => "present",
	before => Class['nginxmod::nginxservice']
	}
}

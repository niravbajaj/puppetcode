class nginxmod::nginxfile{
	
	file {"/usr/share/nginx/html/index.html":
	ensure => "present",
	content => "Module based Nginx",
	require => Class['nginxmod::nginxpkg'],
	}
} 

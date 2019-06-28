class nginxmod {

	include nginxmod::nginxpkg
	include nginxmod::nginxservice
	include nginxmod::nginxfile
	include nginxmod::nginxuser
}

class tomcatmodule{
        #install JDK
        package {"java-1.8.0-openjdk-src.x86_64":
                ensure => "1:1.8.0.212.b04-0.el7_6",
        }

        #Download Tomcat
        exec {'/usr/bin/wget -O /var/tmp/apache-tomcat-9.0.21.tar.gz "http://www-us.apache.org/dist/tomcat/tomcat-9/v9.0.21/bin/apache-tomcat-9.0.21.tar.gz"':
#               path => "['usr/bin','/usr/sbin']",
        }

        #extract tomcat
        exec {"/usr/bin/tar -xvf /var/tmp/apache-tomcat-9.0.21.tar.gz -C /var/tmp/":
#               path => "['usr/bin','/usr/sbin']",
                require => Exec['/usr/bin/wget -O /var/tmp/apache-tomcat-9.0.21.tar.gz "http://www-us.apache.org/dist/tomcat/tomcat-9/v9.0.21/bin/apache-tomcat-9.0.21.tar.gz"'],
        }

        #create tomcat dir
        file {"/usr/local/tomcat9":
                ensure => "directory",
                mode => "777",
                before => Exec['/usr/local/tomcat9/bin/startup.sh'],
        }

        #move tomcat folder
        exec {"/usr/bin/mv -f /usr/tmp/apache-tomcat-9.0.21/* /usr/local/tomcat9":
                path => "['usr/bin','/usr/sbin']",
                require => File['/usr/local/tomcat9'],
        }

        #set CATALINE_Home
        exec {'/bin/echo "export CATALINA_HOME=/usr/local/tomcat9" >> /root/.bashrc; source /root/.bashrc':
#               path => "/usr/bin/echo",
                require => Exec['/usr/bin/mv -f /usr/tmp/apache-tomcat-9.0.21/* /usr/local/tomcat9'],
        }
	
	 #start service
        exec {"/usr/local/tomcat9/bin/startup.sh":
#               path => "/usr/local/tomcat9",
                require => Package['java-1.8.0-openjdk-src.x86_64'],
        }
}


group { "puppet":
	ensure => "present",
}

Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

$hadoop_home = "/home/vagrant"

exec { "apt-get update":
	command => 'apt-get update',
}

package { "openjdk-7-jdk" :
	ensure => present,
	require => Exec['apt-get update'],
}

exec { "download_hadoop": 
	command => 'wget -O /home/vagrant/hadoop-2.7.0.tar.gz http://apache.cbox.biz/hadoop/common/hadoop-2.7.0/hadoop-2.7.0.tar.gz', 
	path => $path, 
	unless => 'ls /home/vagrant | grep hadoop­2.7.0', 
	require => Package['openjdk-7-jdk'], 
} 
 
exec { "unpack_hadoop" : 
  command => "tar -zxf /home/vagrant/hadoop-2.7.0.tar.gz", 
  path => $path, 
  creates => "${hadoop_home}/hadoop­2.7.0", 
  require => Exec["download_hadoop"], 
} 
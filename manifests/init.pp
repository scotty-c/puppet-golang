# This class installs Google language GO

class golang(

$base_dir = '/usr/local/go',
$version  = 'go1.4.1',
$goroot   = '$GOPATH/bin:/usr/local/go/bin:$PATH',
$workdir  = '/usr/local/'
){
  
   
package {'git':
 ensure => 'present', 
 alias  => 'git', 
 before => Exec['make GO']
 } 
   
package { 'gcc':
 ensure => installed,
 before => Exec['make GO']
}
package { 'glibc-devel':
 ensure => installed,
 before => Exec['make GO']
}

vcsrepo { "${base_dir}":
 ensure   => present,
 provider => git,
 source   => 'https://github.com/golang/go.git',
 revision => "master",
 before   => [Exec['make GO'], Exec['checkout go']]
 }
 
exec { 'checkout go':
 path     => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
 command  => "git checkout ${version}",
 cwd      => '/usr/local/go/',	
 before   => Exec['make GO'],
 unless   => "cat /etc/profile.d/golang.sh | grep ${goroot}"
}


exec { 'make GO':
 path     => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
 cwd      => '/usr/local/go/src/',
 command  => 'sh -c ./all.bash',
 unless   => "cat /etc/profile.d/golang.sh | grep ${goroot}"
 }

file { '/etc/profile.d/golang.sh':
 ensure  => present,
 content => template('golang/golang.sh.erb'),
 owner   => root,
 group   => root,
 mode    => 'a+x',
 require => Exec['make GO']
 } 
}

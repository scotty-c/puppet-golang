# This class installs Google language GO

class golang(

  $base_dir = '/usr/local/go',
  $version  = 'go1.4.1',
  $goroot   = '$GOPATH/bin:/usr/local/go/bin:$PATH',
  $workdir  = '/usr/local/'
){
  
   
  package {'git':
  ensure   => installed, 
  alias    => 'git', 
  before   => Exec['make GO']
  } 
   
  package { 'gcc':
  ensure   => installed,
  before   => Exec['make GO']
  }

  case $::osfamily {
  
  'RedHat': {
  
  package { 'glibc-devel':
  ensure   => installed,
  before   => Exec['make GO']
    }
   }
  
  'Debian': { 
  
  package {'libc6-dev':
  ensure   => installed,
  before   => Exec['make GO']
  } ->

  package {'bison':
  ensure   => installed,
  before   => Exec['make GO']
  } ->

  package {'make':
  ensure   => installed,
  before   => Exec['make GO']
  } ->

  package {'build-essential':
  ensure   => installed,
  before   => Exec['make GO']
   }
  }
  
  default: { notify {"$::osfamily is not supported by this module":}
   }
  }

  vcsrepo { "${base_dir}":
  ensure   => present,
  provider => git,
  source   => 'https://github.com/golang/go.git',
  revision => 'master',
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
  require  => [Package['libc6-dev'], Package['bison'], Package['make']],
  unless   => "cat /etc/profile.d/golang.sh | grep ${goroot}"
  }

  file { '/etc/profile.d/golang.sh':
  ensure   => present,
  content  => template('golang/golang.sh.erb'),
  owner    => root,
  group    => root,
  mode     => 'a+x',
  require  => Exec['make GO']
   } 
  }


# This manifest builds Golang
class golang::install(
  
  $from_repo       = $golang::from_repo,
  $repo_version    = $golang::repo_version,
  $package_version = $golang::package_version,
  $base_dir        = $golang::base_dir,
  $workdir         = $golang::workdir,
  $goroot          = $golang::goroot,

  ){

  validate_bool($from_repo)
  
  if $from_repo {
    
    wget::fetch { 'get golang package':
    source      => "https://storage.googleapis.com/golang/${repo_version}.linux-amd64.tar.gz",
    destination => "/tmp/${repo_version}.linux-amd64.tar.gz",
    timeout     => 0,
    verbose     => false,
    } ->
  
    exec { 'untar go':
    command => "tar -C /usr/local -xzf ${repo_version}.linux-amd64.tar.gz",
    cwd     => '/tmp',
    path    => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
    creates => '/etc/profile.d/golang.sh',
    before  => File['/etc/profile.d/golang.sh']
    }
  } 
  
  else {
    package { 'golang':
    ensure => $package_version,
    }
    
    file { [$base_dir, "${$base_dir}/src"]:
    ensure => directory,
    }
  }
  
  file { '/etc/profile.d/golang.sh':
  ensure  => present,
  content => template('golang/golang.sh.erb'),
  owner   => root,
  group   => root,
  mode    => 'a+x',
  }
}
#
class golang::packages {
  
  package { 'gcc':
  ensure => installed,
  }->

  case $::osfamily {
  
  'RedHat': {
  
  package { 'glibc-devel':
  ensure => installed,
    }
  }
  
  'Debian': {
  
  package {'libc6-dev':
  ensure => installed,
  } ->

  package {'bison':
  ensure => installed,
  } ->

  package {'make':
  ensure => installed,
  } ->

  package {'build-essential':
  ensure => installed,
    }
  }
  
  default: { notify {"${::osfamily} is not supported by this module":}
    }
  }
}
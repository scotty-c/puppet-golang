 # This class installs Google language GO.

class golang (

  $manage_dependencies = $golang::params::manage_dependencies,
  $base_dir            = $golang::params::base_dir,
  $version             = $golang::params::version,
  $goroot              = $golang::params::goroot,
  $workdir             = $golang::params::workdir,
    
) inherits golang::params {

validate_re($::osfamily, '^(Debian|RedHat)$', 'This module only works on Debian and Red Hat based systems.')
validate_bool($manage_dependencies)

if $manage_dependencies {
    class {'golang::packages':}->
    class {'golang::install':}
    contain 'golang::install'
    }

else {
    class {'golang::install':}
    }
  }
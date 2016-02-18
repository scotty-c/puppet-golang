 # This class installs Google language GO.

class golang (

  $from_repo           		= $golang::params::from_repo,
  $base_dir            		= $golang::params::base_dir,
  $repo_version        		= $golang::params::repo_version,
  $package_version     		= $golang::params::package_version,
  $goroot              		= $golang::params::goroot,
  $workdir             		= $golang::params::workdir,
  $wgetnocheckcertificate	= $golang::params::wgetnocheckcertificate,

) inherits golang::params {

validate_re($::osfamily,
  '^(Debian|RedHat)$',
  'This module only works on Debian and Red Hat based systems.')

include golang::install
}
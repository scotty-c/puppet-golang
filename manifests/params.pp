# This is the params class
class golang::params {
  
  $manage_dependencies = true
  $from_source         = false
  $base_dir            = '/usr/local/go'
  $version             = 'go1.4.2'
  $package_version     = 'present'
  $goroot              = '$GOPATH/bin:/usr/local/go/bin:$PATH'
  $workdir             = '/usr/local/'

}

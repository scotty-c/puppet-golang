# This is the params class
class golang::params {

  $manage_dependencies = true
  $from_source         = false

  validate_bool($from_source)

  if ($from_source) {
    $base_dir        = '/usr/local/go'
    $version         = 'go1.4.2'
    $goroot          = '$GOPATH/bin:/usr/local/go/bin:$PATH'
    $workdir         = '/usr/local/'
    }

  else {
  $base_dir        = '/usr/local/go'
  $package_version = 'present'
  $goroot          = '$GOPATH/bin:$PATH'
  $workdir         = '/usr/local/go'
  }
}

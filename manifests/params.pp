#
class golang::params {
  
  $manage_dependencies = true
  $base_dir            = '/usr/local/go'
  $version             = 'go1.4.2'
  $goroot              = '$GOPATH/bin:/usr/local/go/bin:$PATH'
  $workdir             = '/usr/local/'

}
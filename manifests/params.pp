# This is the params class
class golang::params {

  $from_repo     = true
  $from_package  = false
  
  validate_bool($from_repo)


  if $from_repo {
    $base_dir        = '/usr/local/go'
    $repo_version    = 'go1.5.3'
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

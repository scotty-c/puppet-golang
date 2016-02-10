# golang 

[![Build Status](https://travis-ci.org/scotty-c/puppet-golang.svg?branch=master)](https://travis-ci.org/scotty-c/puppet-golang)

#### Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Usage](#usage)
4. [Dependencies](#dependencies) 
5. [Development](#development)

## Overview

This is a module that will install Google's Go language for all users.

## Module Description

This module installs GO from OS repo (ie. yum or apt) or staright from Google's repo, making it compatbale with any OS that listed on Google's site https://golang.org/doc/install
## Please note !!!!!
I have depricated installing GO from source as it was making Puppet runs way to long. If you want to keep using this feature please use a version of this module that is 1.* 
As of 2.* they feature will no long be available.


## Usage
For basic usage:
```
include golang
```
To customise the install please see the below examples. The deafult param is now to install from package !!!! 

To install from golang repo as tar.gz:

```puppet
class {'golang':
  base_dir    => '/usr/local/go',
  from_repo   => true,
  rep_version => 'go1.5.3',
  goroot      => '$GOPATH/bin:/usr/local/go/bin:$PATH',
  workdir     => '/usr/local/',
  }
```

To install from the OS repos (yum ot apt)

```puppet
class {'golang':
  base_dir        => '/usr/local/go',
  from_repo       => false,
  package_version => 'present',
  goroot          => '$GOPATH/bin:/usr/local/go/bin:$PATH',
  workdir         => '/usr/local/',
  }
```

Or all data can be set in Hiera ie ```golang::base_dir: /usr/local/go ```

##Dependencies

This module needs puppetlabs/vcsrepo

## Development

Pull request welcome. Just hit me up.

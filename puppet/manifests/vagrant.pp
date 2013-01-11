#include nginx
include mongodb
dotvim::vim { "vagrant":
  git_repo => "git://github.com/heim/dotvim.git",
}
oh_my_zsh::custom_files { "vagrant": } ->
class { "rbenv":
  user    => "vagrant",
  compile => true,
  version => "1.9.3-p125",
  shell => "zsh",
}
# extract into class rails_dependencies
  Package {
    require => Exec["apt-get update"],
  }
  package { "libsqlite3-dev": 
    ensure => installed,
  }
  package { "libsqlite3-ruby": 
    ensure => installed,
  }
  if ! defined(Package["python-software-properties"]) {
    package { "python-software-properties": 
      ensure => installed,
    }
  }
  exec { "add-apt-repository ppa:chris-lea/node.js && apt-get update": 
    path => "/usr/bin/", 
    require => Package["python-software-properties"],
  }
  if ! defined(Exec["apt-get update"]) {
    exec { "apt-get update": 
      path => "/usr/bin:/bin/:/sbin/:/usr/sbin"
    }
  }
  package { "nodejs": 
    ensure => installed, 
    require => Exec["add-apt-repository ppa:chris-lea/node.js && apt-get update"],
  }

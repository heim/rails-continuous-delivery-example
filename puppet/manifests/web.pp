
package { "git-core":
  ensure => latest,
}
package { "zsh":
  ensure => latest,
}
exec {"clone_oh_my_zsh":  
  path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games",
  cwd => "/home/vagrant",
  command => "curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh",
  require => [Package["git-core"], Package["zsh"]],
}

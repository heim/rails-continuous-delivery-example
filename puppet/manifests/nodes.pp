node basenode {
  Exec { path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games", }
}

node "test" inherits basenode {
  include web
}
}

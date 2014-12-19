class repo::clean {
  case $::osfamily {
    'RedHat' : {
      tidy { '/etc/yum.repos.d' :
        matches => [ "*.repo" ],
        recurse => 1,
      } ->
      exec { 'yumclean' :
        path    => [ '/bin','/usr/sbin','/sbin','/usr/bin' ],
        command => [ 'yum clean all' ],
      }
    }
    default : {
      fail ("Your ${::osfamily} is not supported yet")
    }
  }
}

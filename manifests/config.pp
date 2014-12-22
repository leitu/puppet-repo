class repo::config inherits repo {
      #add your repo as hash here
      # 'Myrepo' => { descr = 'foo',
      #               baseurl = 'http://example.com/centos/xxx',
      #               gpgcheck = 1,}
      # 'Myotherrepo' => { 'descr = 'bar',
      #               baserul = 'http://example.com/centos/yyy',
      #               gpgcheck =1 ,}
      # }
  $myrepo = {
       'Thoughtworks'                =>  { descr   => 'Thoughtworks',
                            baseurl  => "http://${repo_server}/CentOS/6.5/os/x86_64",
                            gpgkey   => "http://${repo_server}/CentOS/6.5/os/x86_64/RPM-GPG-KEY-CentOS-6",
                            gpgcheck => '1', },
        'Thoughtworks-Update'        =>  { descr => 'Thoughtworks-Update',
                            baseurl  => "http://${repo_server}/CentOS/6.5/updates/x86_64",
                            gpgkey   => "http://${repo_server}/RPM-GPG-KEY-EPEL-6",
                            gpgcheck => '1', },
        'Scaleworks'                 =>  { descr => 'scaleworks',
                            baseurl  =>  "http://${repo_server}/scaleworks/centos/6/x86_64",
                            gpgkey   =>  "http://${repo_server}/scaleworks/RPM-GPG-KEY-SCALEWORKS",
                            gpgcheck => '1', },
         'ThoughtWorks-puppet'       =>   { descr  => 'ThoughtWorks-puppet',
                            baseurl  =>  "http://${repo_server}/puppet/el/6/products/x86_64",
                            gpgkey   =>  "http://${repo_server}/puppet/el/RPM-GPG-KEY-puppetlabs",
                            gpgcheck => '1' },
         'ThoughtWorks-dependencies' =>   { descr => 'ThoughtWorks-dependencies',
                            baseurl  =>  "http://${repo_server}/puppet/el/6/dependencies/x86_64",
                            gpgcheck => '1' }
      }
    if is_hash($myrepo) !=true {
      fail('Please input the right format')
    }
  case $::osfamily {
    'RedHat' : {
      tidy { "/etc/yum.repos.d" :
        matches => [ "*.repo" ],
        recurse => 1,
      }
      create_resources(yumrepo, $myrepo)
      }
    default : {
      fail("Your ${::osfamily} is not supported yet")
    }
 }
}

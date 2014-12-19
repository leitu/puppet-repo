class repo::config inherits repo {
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
  case $::osfamily {
    'RedHat' : {
      create_resources(yumrepo, $myrepo)
      }
    default : {
      fail("Your ${::osfamily} is not supported yet")
    }
 }
}

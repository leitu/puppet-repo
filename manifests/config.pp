class repo::config inherits repo {
    $myrepo = {
      #add your repo as hash here
      # 'Myrepo' => { descr = 'foo',
      #               baseurl = 'http://example.com/centos/xxx',
      #               gpgcheck = 1,}
      # 'Myotherrepo' => { 'descr = 'bar',
      #               baserul = 'http://example.com/centos/yyy',
      #               gpgcheck =1 ,}
      # }
      }
    if is_hash($myrepo) !=true {
      fail('Please input the right format')
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

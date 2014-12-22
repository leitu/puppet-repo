# == Class: repo
#
# Author Name alex.lei.tu@gmail.com
#
# === Copyright
#
# Copyright 2014 Lei Tu.
#
class repo (
  $repo_server = '10.18.2.179',
) {

  if is_ip_address($repo_server) != true {
    fail("Please input ip adress")
  }

  include repo::config
}

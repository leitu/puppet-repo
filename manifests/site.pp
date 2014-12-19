node default {
  class { 'repo' : }
  -> class { 'nagios' : }
  -> class { 'haproxy' : }
}

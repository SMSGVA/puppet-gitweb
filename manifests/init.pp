# Class: gitweb
#
# Parameters:
#
# Actions:
#
# Requires:
#   - puppetlabs-apache
# Sample Usage:
class gitweb {

  include apache

  package { "gitweb":
    ensure  => present,
  }

  file { "/etc/gitweb.conf":
    ensure  => present,
    owner   => "root",
    group   => "root",
    mode    => "0644",
    source  => "puppet:///modules/gitweb/gitweb.conf",
    require => Package["gitweb"],
  }
}

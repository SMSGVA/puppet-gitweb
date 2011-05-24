# Class: gitweb
#
# Parameters:
#
# Actions:
#
# Requires:
#   - puppetlabs-apache
# Sample Usage:
#
class gitweb {

  include gitweb::settings

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

  apache::vhost { "$gitweb::settings::site_alias":
    priority      => "10",
    port          => "443",
    ssl           => true,
    docroot       => "/var/www/git",
    template      => "gitweb/apache-gitweb.conf.erb",
  }
}

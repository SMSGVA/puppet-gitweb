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
    content => template("gitweb/gitweb.conf.erb"),
    require => Package["gitweb"],
  }

  A2mod <| title == "rewrite" |>

  apache::vhost { "$gitweb::settings::site_alias":
    priority      => "10",
    port          => "80",
    ssl           => false,
    docroot       => "/var/www/git",
    template      => "gitweb/apache-gitweb.conf.erb",
  }
}

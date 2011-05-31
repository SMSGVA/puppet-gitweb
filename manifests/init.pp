# Class: gitweb
#   Installs gitweb and configures apache to server it.
# Parameters:
#
# Actions:
#
# Requires:
#   - apache
#   - gitweb::settings
# Sample Usage:
#   include gitweb
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

  apache::vhost::redirect { "${gitweb::settings::site_alias}":
    port  => "80",
    dest  => "https://${gitweb::settings::site_alias}",
  }

  apache::vhost { "${gitweb::settings::site_alias}_ssl":
    priority      => "10",
    port          => "443",
    ssl           => true,
    docroot       => "/var/www/git",
    template      => "gitweb/apache-gitweb.conf.erb",
  }
}

# puppet-gitweb #

Installs and configures gitweb

## Synopsis ##

    # Override the defaults, optional
    class { "gitweb::settings":
      site_alias => "gitweb.example.com",
      projectroot => "/home/git/repositories",
    }

    include gitweb # magic!

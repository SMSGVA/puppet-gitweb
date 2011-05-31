# Class: gitweb::settings
#
# Parameters:
#   - site_alias: The site alias to make gitweb available
#   - projectroot: The location where the git repositories are stored
# Actions:
#
# Requires:
#
# Sample Usage:
#
class gitweb::settings (
  $site_alias = "gitweb",
  $projectroot = "/var/cache/git"
) {
}

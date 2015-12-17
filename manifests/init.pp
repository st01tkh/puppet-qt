# == Class: qt 
#
# Installs Qt and Qt Creator IDE on Ubuntu Trusty (for now)
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { qt:
#  }
#
# === Authors
#
# st01tkh <st01tkh@gmail.com>
#
# === Copyright
#
# Copyright 2015 st01tkh
# 
#
class qt {
  case $operatingsystem {
  'Solaris':          {
    notify {'No action for Solaris yet':}
  }
  'RedHat', 'CentOS': {
    notify {'No action for RedHat and/or CentOS yet':} 
  }
  /^(Ubuntu)$/:{
    case $lsbdistcodename {
    'precise': {
        exec {"add_ppa_beineri_opt_qt551_precise_repo":
          command => "add-apt-repository -y ppa:beineri/opt-qt551-precise",
          path => [ '/bin', '/sbin', '/usr/bin', '/usr/sbin', '/usr/local/bin', '/usr/local/sbin' ]
        }
        exec {"up_ppa_beineri_opt_qt551_precise_repo":
          command => "apt-get -y update",
          path => [ '/bin', '/sbin', '/usr/bin', '/usr/sbin', '/usr/local/bin', '/usr/local/sbin' ]
        }
        package {"qt-latest":
          ensure => 'installed',
        }
        package {"qt55creator":
          ensure => 'installed',
        }

        Exec["add_ppa_beineri_opt_qt551_precise_repo"]->
        Exec["up_ppa_beineri_opt_qt551_precise_repo"]->
        Package["qt-latest"]->
        Package["qt55creator"]
    }
    'trusty': {
        exec {"add_ppa_beineri_opt_qt551_trusty_repo":
          command => "add-apt-repository -y ppa:beineri/opt-qt551-trusty",
          path => [ '/bin', '/sbin', '/usr/bin', '/usr/sbin', '/usr/local/bin', '/usr/local/sbin' ]
        }
        exec {"up_ppa_beineri_opt_qt551_trusty_repo":
          command => "apt-get -y update",
          path => [ '/bin', '/sbin', '/usr/bin', '/usr/sbin', '/usr/local/bin', '/usr/local/sbin' ]
        }
        package {"qt-latest":
          ensure => 'installed',
        }
        package {"qt55creator":
          ensure => 'installed',
        }

        Exec["add_ppa_beineri_opt_qt551_trusty_repo"]->
        Exec["up_ppa_beineri_opt_qt551_trusty_repo"]->
        Package["qt-latest"]->
        Package["qt55creator"]
    }
    }
  }
  /^(Debian)$/:{
    notify {'No action for Debian yet':}
  }
  default: {
    notify {'No action by default':}
  }
  }

}

# == Class: qt::unified 
#
# Downloads Qt Unified installer
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { qt::unified:
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
define remote_file($remote_location=undef, $mode='0644'){
  exec{ "retrieve_${title}":
    command => "/usr/bin/wget -q ${remote_location} -O ${title}",
    creates => $title,
  }

  file{$title:
    mode    => $mode,
    require => Exec["retrieve_${title}"],
  }
}

class qt::unified {
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
    }
    'trusty': {
        remote_file{'/tmp/qt-unified-linux-x64-online.run':
          remote_location => 'http://download.qt.io/official_releases/online_installers/qt-unified-linux-x64-online.run',
          mode => '0755',
        }
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

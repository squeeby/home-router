class apache2::fastcgi {
  package { "libapache2-mod-fcgid":
    ensure => "installed",
    require => Package["apache2"],
  }

  exec { "a2enmod fastcgi":
    creates => "/etc/apache2/mods-enabled/fastcgi.load",
    require => Package["libapache2-mod-fcgid"],
    notify => Service["apache2"],
  }
}

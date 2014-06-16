# encoding: utf-8
name             'jenkins-hardening'
maintainer       'Christoph Hartmann'
maintainer_email 'chris@lollyrock.com'
license          'Apache 2.0'
description      'Installs/Configures a secure jenkins'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'jenkins'
depends 'nginx'

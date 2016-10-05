maintainer       "The Hybrid Group"
maintainer_email "jerry@hybridgroup.com"
license          "All rights reserved"
description      "Installs/Configures ntp as a client or server"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"

recipe "ntp", "Installs and configures ntp either as a server or client"

%w{ ubuntu debian redhat centos fedora scientific }.each do |os|
  supports os
end

attribute "ntp",
  :display_name => "NTP",
  :description => "Hash of NTP attributes",
  :type => "hash"

attribute "ntp/service",
  :display_name => "NTP Service",
  :description => "Name of the NTP service",
  :default => "ntp"

attribute "ntp/is_server",
  :display_name => "NTP Is Server?",
  :description => "Set to true if this is an NTP server",
  :default => "false"

attribute "ntp/servers",
  :display_name => "NTP Servers",
  :description => "Array of servers",
  :type => "array",
  :default => ["ntp1.tfoundry.com iburst", "time.nist.gov"]

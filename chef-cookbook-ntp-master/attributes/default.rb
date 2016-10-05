case platform
  when "ubuntu","debian"
    default[:ntp][:service] = "ntp"
  when "redhat","centos","fedora","scientific"
    default[:ntp][:service] = "ntpd"
end

default[:ntp][:is_server] = false
default[:ntp][:servers] = ["time.nist.gov", "time-nw.nist.gov"]
default['ntp']['leapfile'] = "/etc/ntp.leapseconds"

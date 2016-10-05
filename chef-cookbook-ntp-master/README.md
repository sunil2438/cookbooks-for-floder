chef-ntp
========

Description
===========

Installs and configures ntp as a client or a server.  Attributes are defined via the roles.

Requirements
============

Should work on any Red Hat-family or Debian-family Linux distribution.

Attributes
==========

* ntp[:is_server]

  - Boolean, should be true or false, defaults to false

* ntp[:servers] (applies to NTP Servers and Clients)

  - Array, should be a list of upstream NTP public servers.  The NTP protocol
    works best with at least 3 servers.  The NTPD maximum is 7 upstream
    servers, any more than that and some of them will be ignored by the daemon.

* ntp[:restrictions] (applies to NTP Servers only)

  - Array, should be a list of restrict lines to restrict access to NTP
    clients on your LAN.

USAGE
=====

Use the roles to install as a ntp client or ntp server:

Set up the ntp attributes in a role. For example in a ntpclient.rb role applied to all nodes:

    name "ntpclient"
    default_attributes(
      "ntp" => {
        "servers" => ["time.nist.gov", "time-nw.nist.gov"]
      }
    )

Then in an ntpserver.rb role that is applied to NTP servers:

    name "ntpserver"
    default_attributes(
      "ntp" => {
        "is_server" => "true",
        "servers" => [0.north-america.pool.ntp.org", "2.north-america.pool.ntp.org", "3.north-america.pool.ntp.org", "4.north-america.pool.ntp.org"]
        "restrictions" => ["10.0.0.0 mask 255.0.0.0 nomodify notrap"]
      }
    )



class ntpconfig{

package{"ntp":
ensure =>"present",}
#NTP Service startup

file{
  "/etc/ntp.conf":
  ensure => "present",
  content=>"server 0.centos.pool.ntp.org ibrust\n",
}
# NTP Service Startup
service { "ntpd":
ensure => "running",
}
}

# site.pp
node 'stapp01.stratos.xfusioncorp.com' {
  include ntpconfig
}
 
node 'stapp02.stratos.xfusioncorp.com' {
  include ntpconfig
}
 
node 'stapp03.stratos.xfusioncorp.com' {
  include ntpconfig
}

class ssh_node1{
       ssh_authorized_key {'tony@stapp01':
           user => 'tony',
           ensure => 'present',
           type => 'ssh-rsa',
           key => $pub_key,
           }
           }
class ssh_node2{
       ssh_authorized_key {'steve@stapp02':
           user => 'steve',
           ensure => 'present',
           type => 'ssh-rsa',
           key => $pub_key,
           }
           }
class ssh_node3{
       ssh_authorized_key {'banner@stapp03':
           user => 'banner',
           ensure => 'present',
           type => 'ssh-rsa',
           key => $pub_key,
           }
           }
node 'stapp01.stratos.xfusioncorp.com' {
  include ssh_node1
  }
node 'stapp02.stratos.xfusioncorp.com' {
  include ssh_node2
  }
node 'stapp03.stratos.xfusioncorp.com' {
  include ssh_node3
  }

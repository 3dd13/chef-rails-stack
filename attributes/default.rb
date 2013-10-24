require 'securerandom'

default["users"] = []

default["app_server"] = "unicorn"

default["default_ruby_version"] = "2.0.0-p247"

default['authorization']['sudo']['users'] = node['users'].map(&:user)
default['authorization']['sudo']['passwordless'] = true

default["memcached"]["listen"]  = "127.0.0.1"

default["sysctl"]["parameters"]["fs.file-max"] = "65536"
default["sysctl"]["parameters"]["net.core.somaxconn"] = "4096"
default["sysctl"]["parameters"]["net.core.rmem_max"] = "16777216"
default["sysctl"]["parameters"]["net.core.wmem_max"] = "16777216"
default["sysctl"]["parameters"]["net.ipv4.tcp_fin_timeout"] = "15"
default["sysctl"]["parameters"]["net.ipv4.tcp_keepalive_time"] = "1800"
default["sysctl"]["parameters"]["net.ipv4.tcp_rmem"] = "4096 87380 16777216"
default["sysctl"]["parameters"]["net.ipv4.tcp_wmem"] = "4096 65536 16777216"
default["sysctl"]["parameters"]["net.ipv4.tcp_syncookies"] = "1"
default["sysctl"]["parameters"]["net.ipv4.ip_local_port_range"] = "5000 65535"
default["sysctl"]["parameters"]["vm.swappiness"] = "30"
default["sysctl"]["parameters"]["net.core.netdev_max_backlog"] = "10000"
default["sysctl"]["parameters"]["net.ipv4.tcp_max_syn_backlog"] = "10000"

default['puma']['threads']['min'] = 0
default['puma']['threads']['max'] = 16
default['puma']['workers'] = 0

default['unicorn']['timeout'] = 60 
default['unicorn']['workers'] = 2

default['rvm']['ruby']['implementation'] = 'ruby'
default['rvm']['ruby']['version'] = '2.0.0'
default['rvm']['ruby']['patch_level'] = 'p247'
default['rvm']['default_ruby']      = "ruby-2.0.0-p247"
default['rvm']['user_default_ruby'] = "ruby-2.0.0-p247"
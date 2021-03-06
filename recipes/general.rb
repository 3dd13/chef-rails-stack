# general components for server

execute "locale-gen" do
  command "locale-gen ru_RU.UTF-8"
end

include_recipe "apt"
include_recipe "nodejs::install_from_package"
include_recipe "memcached"

include_recipe "nginx"

service "nginx" do
  supports :reload => true
end

# include_recipe "rbenv"
include_recipe "rvm::system"

# install image processing libraries
%w{imagemagick libmagickcore-dev libmagickwand-dev advancecomp gifsicle jpegoptim libjpeg-progs optipng pngcrush}.each do |pkg|
  package pkg
end

# install monit
package "monit" do
  action :install
end

# some system magick
service 'procps' do
  supports :restart => true
  action :nothing
end

template "/etc/sysctl.conf" do
  source "sysctl.conf.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, "service[procps]"
end
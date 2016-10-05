#
# Cookbook Name:: Graylog-server
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
require 'pry'
remote_file '/opt/graylog_repo.deb' do
source 'https://packages.graylog2.org/repo/packages/graylog-1.2-repository-ubuntu14.04_latest.deb'
end

 
 dpkg_package "graylog_repo" do
  source "/opt/graylog_repo.deb"
  action :install
end

package "apt-transport-https"

execute "apt-get update"

package "graylog-server" do 
	action :install
end


 user "admin" do 
	# password = node[:graylog][:password]
 #	password "Adm!nP@s$%43"
end

 
 # package "pwgen"
   # execute 'pwgen -N 1 -s 96'
 
 encry_pass = %x(echo -n #{node[:graylog][:password]} | sha256sum) 
 
 
 puts encry_pass 
 
   template '/etc/graylog/server/server.conf' do
   source 'server.conf.erb'
   owner 'root'
   group 'root'
   variables :password => encry_pass 
   mode  '0777'
  end
 #binding.pry
 
 service 'graylog-server' do
   supports restart: true
   action :restart
   end
  
   
   
    # execute 'graylog' do
   # command 'sudo update-rc.d graylog-server defaults'
   # end
 
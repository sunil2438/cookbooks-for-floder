#
# Cookbook Name:: MongoDB
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# apt_repository "10gen" do
  # uri "http://downloads-distro.mongodb.org/repo/ubuntu-upstart"
  # keyserver "keyserver.ubuntu.com"
   # key "7F0CEB10"
  # distribution "trusty"
  # components %w[10gen]
  # action :add
# end
execute "sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10"
  
cookbook_file "/etc/apt/sources.list.d/mongodb-org-3.0.list" do 
	source "mongodb-org-3.0.list"
	action :create_if_missing
end

execute "apt-get update"

package "mongodb-org"

# /etc/init.d/mongod if not U have to create service file
cookbook_file "/etc/init.d/mongod" do 
	source "mongod"
	action :create_if_missing
end

service "mongod" do 
  supports restart: true
  action [:enable, :start]
  end
  
  execute 'MongoDB' do
  command 'sudo update-rc.d mongod defaults'
  end
	

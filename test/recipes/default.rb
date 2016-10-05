#
# Cookbook Name:: test
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

cookbook_file "/tmp/lib-installer.sh" do
  source "lib-installer.sh"
  mode 0755
end

execute "directory_Creation" do


 command "/bin/mkdir #{node['test']['dir']}"
action:run
end
#
# Cookbook Name:: graylog-web-interface
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "graylog-web"

template '/etc/graylog/web/web.conf' do
  source 'web.conf.erb'
  owner 'root'
  group 'root'
  mode  '0777'
 end
 

  
  service 'graylog-web' do
  supports restart: true
  action :start
  end
  
  
  # execute 'graylog-web' do
  # command 'update-rc.d graylog-web defaults'
  # end
  
  

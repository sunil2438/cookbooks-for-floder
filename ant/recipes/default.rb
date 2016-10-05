#
# Cookbook Name:: ant
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

 
package 'openjdk-6-jdk' do
  action :install
  not_if 'ps -ef | grep java'
end

execute 'apache_ant' do
  cwd '/opt'
  command 'wget http://www.us.apache.org/dist/ant/binaries/apache-ant-1.9.6-bin.tar.gz;tar xvfvz apache-ant-1.9.6-bin.tar.gz -C /opt'
  
end
execute 'move file' do
  cwd '/opt'
  command ' sudo ln -s /opt/apache-ant-1.9.6 /opt/ant'
end
execute 'echo' do
cwd '/opt'
command "sh -c 'echo ANT_HOME=/opt/ant >> /etc/environment';ln -s /opt/ant/bin/ant /usr/bin/ant"
end







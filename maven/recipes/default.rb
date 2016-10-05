#
# Cookbook Name:: maven
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

execute 'apache_maven' do
  cwd '/opt'
  command 'wget http://mirror.olnevhost.net/pub/apache/maven/binaries/apache-maven-3.2.1-bin.tar.gz;tar -xzvf apache-maven-3.2.1-bin.tar.gz -C /opt'
  
  
end
execute 'move file' do
  cwd '/opt'
  command ' sudo ln -s /opt/apache-maven-3.2.1 /opt/mvn'
end
execute 'echo' do
cwd '/opt'
command 'sh -c echo "MVN_HOME=/opt/mvn" >> /etc/environment;ln -s /opt/mvn/bin/mvn /usr/bin/mvn'
end
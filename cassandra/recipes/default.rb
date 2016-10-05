#
# Cookbook Name:: cassandra
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'python-software-properties' do 
	action :install
end

package 'software-properties-common' do
	action :install
end

execute 'add repo' do
	command 'add-apt-repository ppa:webupd8team/java;apt-get update;echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections; apt-get -y install oracle-java8-installer;apt-get install oracle-java8-set-default -y'
end

execute 'add keys' do
	command 'apt-key adv --recv-key --keyserver keyserver.ubuntu.com #{node[:cassandra][:var1]};apt-key adv --export --armor #{node[:cassandra][:var1]} | sudo apt-key add -;apt-key adv --recv-key --keyserver keyserver.ubuntu.com  #{node[:cassandra][:var2]}; apt-key adv --export --armor #{node[:cassandra][:var2]} | sudo apt-key add -;apt-key adv --recv-key --keyserver keyserver.ubuntu.com  #{node[:cassandra][:var3]};apt-key adv --export --armor #{node[:cassandra][:var3]} | sudo apt-key add -'
end

execute 'install cassandra' do
	command 'echo "deb #{node[:cassandra][:debian]} 22x main" | sudo tee -a #{node[:cassandra][:source_list]};echo "deb-src #{node[:cassandra][:debian]} 22x main" | sudo tee -a #{node[:cassandra][:source_list]};apt-get update;apt-get install cassandra'
end
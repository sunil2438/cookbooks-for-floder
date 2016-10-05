#
# Cookbook Name:: JBOSS
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#





#include_recipe 'JBOSS::java' 

#execute '/opt' do
	#cwd '/opt'
 #command 'adduser --no-create-home --disabled-password --disabled-login wildfly'
  # not_if File.exists?('adduser --no-create-home --disabled-password --disabled-login wildfly') 
#end

ark "wildfly" do 

url 'http://download.jboss.org/wildfly/8.2.0.Final/wildfly-8.2.0.Final.tar.gz'
action :put
#not_if File.exists?('http://download.jboss.org/wildfly/8.2.0.Final/wildfly-8.2.0.Final.tar.gz') 
#cmd '/opt'
end

#execute 'wildly' do
  #command 'sudo ln -s wildfly-8.2.0.Final wildfly'
  #not_if File.exists?('/sudo ln -s wildfly-8.2.0.Final wildfly') 
  #end
  
  #execute 'chown -R wildfly.wildfly wildfly'
  #execute'chown -R wildfly.wildfly wildfly-8.2.0.Final'
  #directory '/opt/wildfly' do
  #owner 'wildfly'
  #group 'wildfly'
  #mode '0755'
  #action :nothing
   # action :create_if_missing
 # not_if File.exists?('/opt/wildfly') 
#end
#directory '/opt/wildfly-8.2.0.Final' do
  #owner 'wildfly'
  #group 'wildfly'
  #mode '0755'
 #action :nothing
    #action :create_if_missing
  #not_if File.exists?('/opt/wildfly-8.2.0.Final') 
#end

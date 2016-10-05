#
# Cookbook Name:: jenkins
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'jenkins::java'

# apt_repository "jenkins" do
# 	key "https://pkg.jenkins.io/debian/jenkins-ci.org.key"
# 	uri "http://pkg.jenkins.io/debian-stable"
# 	components ["binary"]
# 	action :add
# end

execute "#{node["jenkins"]["apt_repo_key"]}"
execute "#{node["jenkins"]["apt_resource_list"]}"

 

execute "apt-get update"
# execute "apt-get install jenkins"
package 'jenkins'
  
# service 'jenkins' do
#   supports :status => true, :restart => true, :reload => true
#   action [ :enable, :start]
# end
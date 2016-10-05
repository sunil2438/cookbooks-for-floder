#
# Cookbook Name:: Elasticsearch
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

execute 'Elasticsearch' do
  command 'wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -;echo "deb http://packages.elastic.co/elasticsearch/1.7/debian stable main" | sudo tee -a /etc/apt/sources.list.d/elasticsearch.list;sudo apt-get update;apt-get install elasticsearch;sudo update-rc.d elasticsearch defaults'
  end
  
  template '/etc/elasticsearch/elasticsearch.yml' do
  source 'elasticsearch.yml.erb'
  owner 'root'
  group 'root'
  mode  '0777'
 end
 
  service 'elasticsearch' do
  supports restart: true
  action [:enable, :start]
  end
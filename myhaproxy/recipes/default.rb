#
# Cookbook Name:: myhaproxy
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.



all_web_nodes = search("node","role:web")
all_web_nodes.each do |web_node| 
member = { 
"hostname" => web_node["cloud"]["public_hostname"], 
"ipaddress" => web_node["cloud"]["public_ipv4"], 
"port" => 80,
 "ssl_port" => 80 
 } 
 members.push(member) 
 end 
 node.default['haproxy']['members'] = members 
 include_recipe "haproxy::default"
 

 # node.default['haproxy']['members'] = [ 
 # {
# "hostname" => "Learnchef", 
# "ipaddress" => "192.168.153.27", 
# "port" => 80 
# }, {
 # { 
 # "hostname" => "Learnchef", 
 # "ipaddress" => "192.168.153.26", 
 # "port" => 80
# }
 # }
 # ] 

# include_recipe "haproxy::default"

all_web_nodes = search("node","role:web AND 
chef_environment:#{node.chef_environment}")
members = []


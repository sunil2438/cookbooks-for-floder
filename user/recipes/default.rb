#
# Cookbook Name:: user
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

user 'test' do
  comment 'This is a test user'
  shell '/bin/bash'
end

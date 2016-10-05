#
# Cookbook Name:: workstation
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
include_recipe 'workstation::setup'

include_recipe 'apt::default'

package "apache2" do 
	action :install
end

end

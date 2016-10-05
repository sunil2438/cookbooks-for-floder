#
# Cookbook Name:: jenkins
# Spec:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


		require 'spec_helper'
			  describe 'jenkins::default' do
			  let(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }

			  # it 'creates apt repo' do
			  #   expect(chef_run).to run_execute('#{node["jenkins"]["apt_repo_key"]}')
			  #   expect(chef_run).to run_execute('#{node["jenkins"]["apt_resource_list"]}')
			  # end

			  it 'installs jenkins' do
			    expect(chef_run).to install_package('jenkins')
			   end
	     end
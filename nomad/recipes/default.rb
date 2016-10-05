#
# Cookbook Name:: nomad
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
# execute 'create dir' do
# command "mkdir nomad_test, cwd '/nomad_test'"
# end

# execute 'Download nomad file' do
	# command "wget https://releases.hashicorp.com/nomad/0.3.2/nomad_0.3.2_linux_amd64.zip"
# end

# package 'unzip'
# execute 'To unzip the nomad folder' do
	# command "unzip nomad_0.3.2_linux_amd64.zip"
# end

# execute 'change mode' do
# command "sudo chmod +x nomad; sudo mv nomad /usr/bin/nomad;sudo mkdir -p /etc/nomad.d;sudo chmod a+w /etc/nomad.d"
# end

# execute 'export' do
# command "NOMAD_ADDR=http://192.168.152.143:4646"
# end

env 'NOMAD_ADDR' do
  value 'http://192.168.152.143:4646'
end


template 'nomad_test/server.hcl' do
source 'server.hcl.erb'
end

template 'nomad_test/client.hcl' do
source 'client.hcl.erb'
end

execute 'agent' do
command "nomad agent -config server.hcl -bind 192.168.152.143 > nomad_server.log &; nomad agent -config client.hcl -bind 192.168.152.143 > nomad_client.log &"
end


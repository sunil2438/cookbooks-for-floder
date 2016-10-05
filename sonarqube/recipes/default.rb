#
# Cookbook Name:: sonarqube
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

#


ark "sonarqube" do 
url 'http://dist.sonar.codehaus.org/sonarqube-5.1.zip'
path '/opt'

action :put
end


execute 'move file' do
 cwd '/opt'
 command ' sudo mv sonarqube-5.1 /opt/sonar'
 not_if do File.exists?('/opt/sonar') end
  end


case node[:platform] 
when "ubuntu","debian"
  package "ntpdate" do
    action :install
  end
end

package "ntp" do
  action :install
end

template "/etc/ntp.conf" do
  source "ntp.conf.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, "service[ntp]"
end

service "ntp" do
  service_name node[:ntp][:service]
  action [:enable, :start]
end

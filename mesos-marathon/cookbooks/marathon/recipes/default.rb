
remote_file "12.04_mesos_0.14.0_amd64.deb" do
		source "http://downloads.mesosphere.io/master/ubuntu/12.04/mesos_0.14.0_amd64.deb"
end

execute "apt-get update ; touch apt-get-updated" do
	creates "apt-get-updated"
end

apt_package "unzip" do
end
apt_package "default-jre-headless" do
end
apt_package "zookeeper-bin" do
end
apt_package "zookeeperd" do
end

apt_package "libcurl3" do
	ignore_failure true
end

execute "apt-get -f install ; touch apt-get-fixed" do
	creates "apt-get-fixed"
end

execute "dpkg -i 12.04_mesos_0.14.0_amd64.deb" do
	creates "/usr/local/sbin/mesos-master"
end

directory "/opt/marathon" do
end


remote_file "/opt/marathon/marathon.jar" do
	source "http://downloads.mesosphere.io/marathon/marathon-0.0.6-SNAPSHOT-jar-with-dependencies.jar"
	mode 0774
end

remote_file "/etc/init/marathon.conf" do
	source "http://downloads.mesosphere.io/marathon/marathon.conf"
end

execute "initctl reload-configuration" do
end

service "zookeeper" do
	action :restart
end

service "mesos-master" do
	action :restart
	provider Chef::Provider::Service::Upstart
end

service "mesos-slave" do
	action :restart
	provider Chef::Provider::Service::Upstart
end

service "marathon" do
	action :restart
	provider Chef::Provider::Service::Upstart
end




execute "install_cs" do
	user "vagrant"
	group "vagrant"
	command "curl https://raw.github.com/n8han/conscript/master/setup.sh | HOME=/home/vagrant sh"
	creates "#{::File.expand_path('~vagrant')}/bin/cs"	
end	

file "/etc/profile.d/setup_cs_path" do
	owner "vagrant"
	group "vagrant"
	mode "0644"
	content 'export PATH=$PATH:~/vagrant/bin'
end

execute "install giter8" do
	user "vagrant"
	group "vagrant"
	command "/home/vagrant/bin/cs n8han/giter8"
	creates "#{::File.expand_path('~vagrant')}/bin/g8"	
end

execute "create sample" do
	user "vagrant"
	group "vagrant"
	cwd "/home/vagrant"
	command "/home/vagrant/bin/g8 scalatra/scalatra-sbt  --name=hello-world"
	creates "/home/vagrant/hello-world"	
end

execute "chmod sbt" do
	user "vagrant"
	group "vagrant"
	cwd "/home/vagrant/hello-world"
	command "chmod +x ./sbt"
end

execute "build" do
	user "vagrant"
	group "vagrant"
	cwd "/home/vagrant/hello-world"
	environment "HOME" => "/home/vagrant"
	command  "./sbt container:start"
end

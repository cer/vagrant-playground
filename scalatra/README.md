This example installs JDK 7 and Scalatra in a VM and creates a hello world example. 
Moreover, Vagrant is configured to proxy localhost:8080 to port 8080 on the VM. 
This means that you can access the example application from your physical machine's browser.

To run this example:

1. Install Vagrant along with VirtualBox or Fusion
1. $ git clone https://github.com/cer/vagrant-playground.git
1. $ cd vagrant-playground/scalatra
1. Launch and configure the VM and create the hello world application by running:

    $ vagrant up
1. If that fails because of a sporadic networking error then repeatedly run: 

    $ vagrant provision
1. Ssh into the VM using:

    $ vagrant ssh
1. Inside the VM, cd into the hello world application and start the web container:
 1.   $ cd hello-world
 1.   $ ./sbt
 1.   > container:start
1. On your physical machine's web browser go to http://localhost:8080

 

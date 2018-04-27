# -*- mode: ruby -*-
# vi: set ft=ruby :

nodes = [
  { :hostname => 'deploy.server',   :ip => '192.168.55.21', :box => 'centos/7' },
  { :hostname => 'api.server',      :ip => '192.168.55.22', :box => 'centos/7' }
]


# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.
  nodes.each do |node|
    config.vm.define node[:hostname] do |nodeconfig|

      # Every Vagrant development environment requires a box. You can search for
      # boxes at https://vagrantcloud.com/search.
      nodeconfig.vm.box = node[:box]

      # Disable automatic box update checking. If you disable this, then
      # boxes will only be checked for updates when the user runs
      # `vagrant box outdated`. This is not recommended.
      # nodeconfig.vm.box_check_update = false

      # Create a forwarded port mapping which allows access to a specific port
      # within the machine from a port on the host machine. In the example below,
      # accessing "localhost:8080" will access port 80 on the guest machine.
      # NOTE: This will enable public access to the opened port
      # nodeconfig.vm.network "forwarded_port", guest: 80, host: 8080

      # Create a forwarded port mapping which allows access to a specific port
      # within the machine from a port on the host machine and only allow access
      # via 127.0.0.1 to disable public access
      # nodeconfig.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

      # Create a private network, which allows host-only access to the machine
      # using a specific IP.
      # nodeconfig.vm.network "private_network", ip: "192.168.33.10"
      nodeconfig.vm.network "private_network", ip: node[:ip]

      # Create a public network, which generally matched to bridged network.
      # Bridged networks make the machine appear as another physical device on
      # your network.
      # nodeconfig.vm.network "public_network"

      nodeconfig.vm.hostname = node[:hostname]

      nodeconfig.vm.provision "shell", inline: <<-EOC
        useradd testing
        echo "testing:testing"  | chpasswd
        sed -i 's/# %wheel  ALL=(ALL)       ALL/%wheel  ALL=(ALL)       ALL/' /etc/sudoers
        sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
        systemctl restart sshd
        usermod -aG wheel testing
        yum install wget -y
        yum install sshpass -y
        echo "192.168.55.21 deploy.server" >> /etc/hosts
        echo "192.168.55.22 api.server" >> /etc/hosts
      EOC

      # Share an additional folder to the guest VM. The first argument is
      # the path on the host to the actual folder. The second argument is
      # the path on the guest to mount the folder. And the optional third
      # argument is a set of non-required options.
      # nodeconfig.vm.synced_folder "../data", "/vagrant_data"

      # Provider-specific configuration so you can fine-tune various
      # backing providers for Vagrant. These expose provider-specific options.
      # Example for VirtualBox:
      #
      # nodeconfig.vm.provider "virtualbox" do |vb|
      #   # Display the VirtualBox GUI when booting the machine
      #   vb.gui = true
      #
      #   # Customize the amount of memory on the VM:
      #   vb.memory = "1024"
      # end
      #
      # View the documentation for the provider you are using for more
      # information on available options.
    
      # Enable provisioning with a shell script. Additional provisioners such as
      # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
      # documentation for more information about their specific syntax and use.
      # nodeconfig.vm.provision "shell", inline: <<-SHELL
      #   apt-get update
      #   apt-get install -y apache2
      # SHELL

    end
  end
end

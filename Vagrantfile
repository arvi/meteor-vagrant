# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "hashicorp/precise32"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network "forwarded_port", guest: 3000, host: 3000

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  # config.ssh.forward_agent = true

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"
  
  # Note: The folder is synchronised two times. It is necessary because Meteor don't likes the shared folders of Virtualbox that are usually used.
  
  # Two way synchronization with a Virualbox shared folder. Use it when you create or edit files in the guest.
  config.vm.synced_folder ".", "/meteor"
  
  # One way synchronization from the host to the guest with rsync. It must be used to start the app.
  config.vm.synced_folder ".", "/vagrant", type: "rsync", 
    rsync__args: ["--verbose", "--archive", "--delete", "-z", "--copy-links"],
    rsync__exclude: [
      ".meteor/local/",
      ".git/",
      ".idea/",
      ".npm/",
      ".build/",
      "node_modules/",
      # Add your local packages here that should be copied, with:
      # "+ /app/packages/MY_PACKAGE/***",
      "/*/packages/**"
    ]
  # Configure the window for gatling to coalesce writes.
  if Vagrant.has_plugin?("vagrant-gatling-rsync")
    config.gatling.latency = 1.5
  end

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  #config.vm.provider "virtualbox" do |vb|
  #   # Don't boot with headless mode
  #   vb.gui = true

    # Use VBoxManage to customize the VM. For example to change memory:
    # vb.customize ["modifyvm", :id, "--ioapic", "on"] # This is needed for multiple CPUs
    # vb.customize ["modifyvm", :id, "--memory", "1024"]
    # vb.customize ["modifyvm", :id, "--cpus", "2"]
  # end
  #
  # View the documentation for the provider you're using for more
  # information on available options.

  # Shell Provisioning - execute a script within the guest machine
  config.vm.provision :shell, :path => "provision/01_bootstrap.sh"
  config.vm.provision :shell, :path => "provision/02_user-install-meteor.sh"
  config.vm.provision :shell, :path => "provision/99_cleanup.sh"

end
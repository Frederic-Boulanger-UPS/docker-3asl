# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "generic/ubuntu2004"

	# Set hostname and name of VM
	config.vm.hostname = "3asl.2020"
	config.vm.define "3asl.2020"
	
  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"
  config.vm.synced_folder ".", "/home/vagrant/workspace"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    # vb.gui = true
    # Set the name of the VM
    vb.name = "3asl.2020"
    # Customize the amount of memory on the VM:
    vb.memory = "1024"
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
  config.vm.provision "shell", privileged: "true", inline: <<-SHELL
		apt-get update
		apt-get upgrade -y

		apt-get install -y x11-apps xdg-utils

		apt-get install -y gcc ocaml menhir \
			libnum-ocaml-dev libzarith-ocaml-dev libzip-ocaml-dev \
			libmenhir-ocaml-dev liblablgtk3-ocaml-dev liblablgtksourceview3-ocaml-dev \
			libocamlgraph-ocaml-dev libre-ocaml-dev libjs-of-ocaml-dev

		apt-get install -y alt-ergo wget

		# Install Z3 4.8.6
		wget https://github.com/Z3Prover/z3/archive/z3-4.8.6.tar.gz \
			&& tar zxf z3-4.8.6.tar.gz \
			&& cd z3-z3-4.8.6; env PYTHON=python3 ./configure; cd build; make; make install; \
			cd ../..; rm -r z3-*

		wget http://wwwlehre.dhbw-stuttgart.de/~sschulz/WORK/E_DOWNLOAD/V_2.0/E.tgz \
			 && tar zxf E.tgz \
			 && cd E; ./configure --prefix=/usr/local; make; make install; \
			 cd ..; rm -r E E.tgz

		wget https://gforge.inria.fr/frs/download.php/file/38367/why3-1.3.3.tar.gz \
			&& tar zxf why3-1.3.3.tar.gz \
			&& cd why3-1.3.3; ./configure; make ; make install ;\
			why3 config --detect-provers && mv /root/.why3.conf /home/vagrant/ \
			&& chown vagrant:vagrant /home/vagrant/.why3.conf ;\
			cd ..; yes | rm -r why3-1.3.3*

		wget http://mirrors.kernel.org/ubuntu/pool/main/libf/libffi/libffi6_3.2.1-8_amd64.deb
		apt-get install ./libffi6_3.2.1-8_amd64.deb
		rm libffi6_3.2.1-8_amd64.deb

		echo "deb https://dl.bintray.com/souffle-lang/deb-unstable bionic main" | tee -a /etc/apt/sources.list
		apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 379CE192D401AB61
		apt-get update
		apt-get install -y souffle

		# Append line to .profile in order to set the X11 display
		echo "" >> .profile
		echo "# Set display to host" >> .profile
		echo 'export DISPLAY=`who | tail -n 1 | sed -e '"'"'s/^.*(\\([^)]*\\))$/\\1/'"'"'`:0.0' >> .profile

		# Append line to .profile in order to fix libGL issue on Windows
		echo "" >> .profile
		echo "# Fix issue with libGL on Windows" >> .profile
		echo 'export LIBGL_ALWAYS_INDIRECT=1' >> .profile
  SHELL
end

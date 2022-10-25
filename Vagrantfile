Vagrant.configure("2") do |config|
    config.vm.define "puppetdns" do |puppetdns|
      puppetdns.vm.box = "ubuntu/focal64"
      puppetdns.vm.network "public_network", ip: "192.168.4.9"
      puppetdns.vm.hostname = "puppetdns.puppet-playground.com"
      puppetdns.vm.provision "ansible" do |ansible|
        ansible.verbose = "v"
        ansible.playbook = "ansible/playbook.yml"
      end
    end

    config.vm.define "puppetserver" do |puppetserver|
      puppetserver.vm.provider "virtualbox" do |vm|
        vm.memory = 4096
        vm.cpus = 2
      end

      puppetserver.vm.box = "ubuntu/focal64"
      puppetserver.vm.network "public_network", ip: "192.168.4.10"
      puppetserver.vm.hostname = "puppetserver.puppet-playground.com"
      puppetserver.vm.provision "ansible" do |ansible|
        ansible.verbose = "v"
        ansible.playbook = "ansible/playbook.yml"
      end

    end

    config.vm.define "puppetdb" do |puppetdb|
      puppetdb.vm.provider "virtualbox" do |vm|
        vm.memory = 4096
        vm.cpus = 2
      end
      puppetdb.vm.box = "ubuntu/focal64"
      puppetdb.vm.network "public_network", ip: "192.168.4.11"
      puppetdb.vm.hostname = "puppetdb.puppet-playground.com"
      puppetdb.vm.provision "ansible" do |ansible|
        ansible.verbose = "v"
        ansible.playbook = "ansible/playbook.yml"
      end
    end

    config.vm.define "postgres" do |postgres|
      postgres.vm.provider "virtualbox" do |vm|
        vm.memory = 4096
        vm.cpus = 2
      end
      postgres.vm.box = "ubuntu/focal64"
      postgres.vm.network "public_network", ip: "192.168.4.12"
      postgres.vm.hostname = "postgres.puppet-playground.com"
      postgres.vm.provision "ansible" do |ansible|
        ansible.verbose = "v"
        ansible.playbook = "ansible/playbook.yml"
      end
    end
  end

# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version ">= 1.9.0"

Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.
  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.

  unless Vagrant.has_plugin?("vagrant-cachier")
    raise Vagrant::Errors::VagrantError.new, "Plugin missing: vagrant plugin install vagrant-cachier"
  end
  config.cache.scope = :box

#  config.vm.box = "centos7_deploy"
#  config.vm.box_url = "file:///d:/vagrant_boxes/centos7_deploy.json"

  config.vm.define "monitoring" do |monitoring|
    monitoring.vm.box = "centos7_deploy"
#    monitoring.vm.box_url = "file:///d:/vagrant_boxes/centos7_deploy.json"
    monitoring.vm.box_url = "http://vbox.lmiw.net/centos7_deploy.json"
    monitoring.vm.box_check_update = true
    monitoring.vm.hostname = "monitoring.local"
    monitoring.vm.network(:private_network, {
	  ip: "192.168.49.10",
      auto_config: true
    })
	monitoring.vm.network "forwarded_port", guest: 80, host: 8870
	monitoring.vm.provision "shell", inline: <<-SHELL
	  ifup eth1
    SHELL
  end
  
  config.vm.define "deploy" do |deploy|
    deploy.vm.box = "centos7_deploy"
    deploy.vm.box_url = "http://vbox.lmiw.net/centos7_deploy.json"
    deploy.vm.box_check_update = true
    deploy.vm.hostname = "deploy.local"
    deploy.vm.network(:private_network, {
	  ip: "192.168.49.11",
      auto_config: true
    })
	deploy.vm.network "forwarded_port", guest: 80, host: 8880
	deploy.vm.network "forwarded_port", guest: 443, host: 4443
	
	deploy.vm.provision "shell", inline: <<-SHELL
	  ifup eth1
    SHELL
  end
end

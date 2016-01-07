# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "parallels/ubuntu-14.04"
  config.vm.hostname = "template"
  #config.vm.network :private_network, ip: "10.211.55.91"

  # Set the name of the VM. See: http://stackoverflow.com/a/17864388/100134
  config.vm.define :template do |template|
  end

  # TODO: Change username from 'vagrant' to 'pichuang'
  config.ssh.username = 'vagrant'
  config.ssh.password = 'vagrant'

  config.vm.provider "parallels" do |prl|
    prl.memory = 360
    prl.cpus = 1
  end

  #Configuration Management -- Ansible
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provisioning/playbook.yml"
    ansible.inventory_path = "provisioning/hosts"
    ansible.sudo = "true"
  end
end

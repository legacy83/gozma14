Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/trusty64"
  config.vm.box_url = "http://bit.ly/1lxaHBB"

  config.vm.hostname = "gozma14"
  config.vm.network "private_network", ip: "192.168.27.14"

  #config.ssh.insert_key = false
  #config.vm.synced_folder "..", "/vagrant"

  #config.vm.provider "virtualbox" do |v|
  #  v.memory = 1024
  #  v.gui = true
  #end

  ###############################################################
  # gozma14
  ###############################################################

  config.vm.provision "shell", path: "cli/core.sh"
  config.vm.provision "shell", path: "cli/lamp.sh"
  config.vm.provision "shell", path: "cli/lapp.sh"

  ###############################################################
  # gozma14/recipes
  ###############################################################

  config.vm.provision "shell", path: "cli/recipes/frontTools.sh"
  config.vm.provision "shell", path: "cli/recipes/apache2VirtualHosts.sh"
  config.vm.provision "shell", path: "cli/recipes/apache2UnderVagrant.sh"

end
Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "gozma14"

  config.vm.network "private_network", ip: "192.168.27.14"

  config.vm.provision "shell", path: "provision/core.sh"
  config.vm.provision "shell", path: "provision/cloud.sh"
  config.vm.provision "shell", path: "provision/lamp.sh"
  config.vm.provision "shell", path: "provision/lapp.sh"

end

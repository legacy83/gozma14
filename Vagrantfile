Vagrant.configure("2") do |config|
  # Ubuntu 14.04 - Precise Pangolin
  config.vm.define "ubuntu14" do |ubuntu14|
    ubuntu14.vm.box = "bento/ubuntu-14.04"
    ubuntu14.vm.hostname = "gozma14"
    ubuntu14.vm.network "private_network", ip: "192.168.27.14"
    # provisioners
    ubuntu14.vm.provision 'shell', path: './vagrant/provision/provision-01--common.sh'
    ubuntu14.vm.provision 'shell', path: './vagrant/provision/provision-02--webserver.sh'
    ubuntu14.vm.provision 'shell', path: './vagrant/provision/provision-03--databases.sh'
    ubuntu14.vm.provision 'shell', path: './vagrant/provision/provision-04--extras.sh'
    ubuntu14.vm.provision 'shell', path: './vagrant/provision/provision-05--cleanup.sh'
    # synced folders
    ubuntu14.vm.synced_folder '.', '/vagrant', disabled: true
    ubuntu14.vm.synced_folder '~/PhpStorm__Projects', '/projects', owner: 'vagrant', group: 'vagrant'
  end
end

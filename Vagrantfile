Vagrant.configure("2") do |config|
    config.ssh.forward_agent = true
    config.ssh.insert_key = false

    # Ubuntu 14.04 - Trusty Tahr
    config.vm.define "gozma14" do |gozma14|
        gozma14.vm.box = "geerlingguy/ubuntu1404"
        gozma14.vm.hostname = "gozma14"
        gozma14.vm.network "private_network", ip: "192.168.27.14"
        config.vm.provision "ansible" do |ansible|
            ansible.playbook = "playbook.yml"
        end
    end
end
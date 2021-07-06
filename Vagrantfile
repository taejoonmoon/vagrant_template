DOMAIN="example.com"
# ubuntu 20.0.4
ubuntu_box="ubuntu/focal64"
common_bootstrap="bootstrap.sh"

Vagrant.configure(2) do |config|
  # vagrant plugin install vagrant-hostmanager
  # vagrant hostmanager
  config.hostmanager.manage_host = true

  config.vm.define "web" do |vmconfig|
    vmconfig.vm.box = "#{ubuntu_box}"
    vmconfig.vm.network "private_network", ip: "192.168.33.10"
    vmconfig.vm.hostname = "web.#{DOMAIN}"
    vmconfig.vm.provision :shell, path: "#{common_bootstrap}"

    #vmconfig.vm.provider "virtualbox" do |vb|
    #  vb.memory = "1024"
    #end
  end
 
  config.vm.define "db" do |vmconfig|
    vmconfig.vm.box = "#{ubuntu_box}"
    vmconfig.vm.network "private_network", ip: "192.168.33.11"
    vmconfig.vm.hostname = "db.#{DOMAIN}"
    vmconfig.vm.provision :shell, path: "#{common_bootstrap}"
  end
end

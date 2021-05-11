DOMAIN="example.com"
#ubuntu_box="ubuntu/xenial64"
# ubuntu 20.0.4
ubuntu_box="ubuntu/focal64"
centos6_box="centos/6"
centos7_box="centos/7"
common_bootstrap="bootstrap.sh"

Vagrant.configure(2) do |config|

  config.vm.define "ubuntu01" do |ubuntu|
    ubuntu.vm.box = "#{ubuntu_box}"
    ubuntu.vm.network "private_network", ip: "192.168.33.12"
    ubuntu.vm.hostname = "gitlab.example.com"
    ubuntu.vm.provision :shell, path: "#{common_bootstrap}"

    ubuntu.vm.provider "virtualbox" do |vb|
      vb.memory = "8192"
    end

  end
 
  config.vm.define "ubuntu02" do |ubuntu|
    ubuntu.vm.box = "#{ubuntu_box}"
    ubuntu.vm.network "private_network", ip: "192.168.33.13"
    ubuntu.vm.hostname = "runner.example.com"
    ubuntu.vm.provision :shell, path: "#{common_bootstrap}"
  end

#  config.vm.define "centos6" do |centos|
#    centos.vm.box = "#{centos6_box}"
#    centos.vm.network "private_network", ip: "192.168.33.14"
#    centos.vm.hostname = "centos6.#{DOMAIN}"
#    centos.vm.provision :shell, path: "#{common_bootstrap}"
#    centos.vbguest.auto_update = false
#  end
#
#  config.vm.define "centos7" do |centos|
#    centos.vm.box = "#{centos7_box}"
#    centos.vm.network "private_network", ip: "192.168.33.15"
#    centos.vm.hostname = "centos7.#{DOMAIN}"
#    centos.vm.provision :shell, path: "#{common_bootstrap}"
#    centos.vbguest.auto_update = false
#  end

end

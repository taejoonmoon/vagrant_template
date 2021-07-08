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
    
    # create ssh private key
    # ssh-keygen -t ed25519 -C "your_email@example.com"
    vmconfig.vm.provision "shell", inline: <<-SHELL
echo "-----BEGIN OPENSSH PRIVATE KEY-----
b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAAAMwAAAAtzc2gtZW
QyNTUxOQAAACBRyHgGuG5BEqZTOrjEgofHd+FJsuHi0DZ+s2IENDn7PAAAAJieK+tbnivr
WwAAAAtzc2gtZWQyNTUxOQAAACBRyHgGuG5BEqZTOrjEgofHd+FJsuHi0DZ+s2IENDn7PA
AAAEDJSOmsjiqLO5KnkKV1btJZ3ScafLHWMIg0N1YbEHVPQ1HIeAa4bkESplM6uMSCh8d3
4Umy4eLQNn6zYgQ0Ofs8AAAAEWFuc2libGVfb3BlcmF0aW9uAQIDBA==
-----END OPENSSH PRIVATE KEY-----" > ~vagrant/.ssh/id_ed25519
chmod 600 ~vagrant/.ssh/id_ed25519
chown vagrant.vagrant ~vagrant/.ssh/id_ed25519
    SHELL

    vmconfig.vm.provision :shell, path: "ansible_install.sh"

  end
 
  config.vm.define "db" do |vmconfig|
    vmconfig.vm.box = "#{ubuntu_box}"
    vmconfig.vm.network "private_network", ip: "192.168.33.11"
    vmconfig.vm.hostname = "db.#{DOMAIN}"
    vmconfig.vm.provision :shell, path: "#{common_bootstrap}"

    vmconfig.vm.provision :shell, path: "ansible_install.sh"
  end
end

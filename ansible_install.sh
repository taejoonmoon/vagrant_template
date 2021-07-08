#!/bin/bash
if !  dpkg -l ansible > /dev/null  ; then
    sudo apt-get update
    sudo apt-get install software-properties-common
    sudo apt-add-repository --yes --update ppa:ansible/ansible
    sudo apt-get install ansible --yes
fi

#sudo ansible-playbook /vagrant/ansible/playbook.yml

grep -q ansible_operation ~vagrant/.ssh/authorized_keys || echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFHIeAa4bkESplM6uMSCh8d34Umy4eLQNn6zYgQ0Ofs8 ansible_operation" >> ~vagrant/.ssh/authorized_keys

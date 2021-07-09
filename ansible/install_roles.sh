#!/bin/bash
test -d roles || mkdir roles
#git clone git@github.com:VntgCorp/ansible-osconfig.git roles/osconfig
ansible-galaxy install --roles-path roles/ -r requirements.yml
#ansible-playbook -i localhost playbook.yml

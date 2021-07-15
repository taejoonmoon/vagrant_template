# ansible_playbook

## install ansible
```
sudo apt-get update
sudo apt-get install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt-get install ansible --yes
```

remote 로 실행을 할 경우 ansible에서 접속하려는 서버에 ssh로 로그인을 할 수 있어야 하며 root 권한이 있어야 함
아래 ssh public key 부분을 필요한 서버의 ssh 설정에 추가해주면 됨. (.ssh/authorized_keys)
localhost 에서 실행시에는 operation 계정을 만들고 이 부분을 자동으로 설정해줌.

```
grep -q ansible_operation ~vagrant/.ssh/authorized_keys || \\
echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFHIeAa4bkESplM6uMSCh8d34Umy4eLQNn6zYgQ0Ofs8 ansible_operation" >> ~vagrant/.ssh/authorized_keys
```

## ansible playbook
해당 git repo에 접근권한 있어야 함. 배포용으로 사용하는 ssh key에 대한 정보를 관리자에게 받아서 사용하면 됨.

```
git clone git@github.com:VntgCorp/ansible_playbook.git
cd ansible_playbook/
ansible-galaxy install --roles-path roles/ -r requirements.yml
```


localhost 에서 실행시에는 ssh 설정이 필요없음. 

```
# localhost
ansible-playbook -i localhost site.yml

# localhost and remote
ansible-playbook -i hosts site.yml
```

## ansible-pull
사전에 git repo에 접근권한이 있어야 함.

```
ansible-pull -i "127.0.0.1," -U https://github.com/VntgCorp/ansible_playbook.git
```

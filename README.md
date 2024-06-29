# ansible-boot
This repository is my way to setup my personal PC on a Ubuntu 20.04 and Arch

You will be asked for the name of your username and password. If not submitting a password, it will not be set or changed.
That user's id is hardcoded to `1000`. See [add-user.yml](./roles/localhosts/tasks/add-user.yml)

Same applies for the ansible user. Excepts for the user and group id, which is asked for.

The sudoers group is hardcoded as 'wheel', for now. You can change it at [add-user.yml](./roles/localhosts/tasks/add-user.yml) too.

Run as root:
```shell
./run-ansible.sh
```
This 
## Install uptodate ansible on ubuntu
sudo apt remove ansible
pip3 install ansible


## Work in progress
### role `xorg`
- borg backup
- rustdesk
### role `vhorst`
- wireguard


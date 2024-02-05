#!/bin/bash
#
SCRIPT_LOC=$( cd -- "$(dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)

chmod 0755 /
${SCRIPT_LOC}/config-network.sh
pacman -S python python-pip python-pipx git ansible vim-ansible whois
ln -s /usr/bin/vim /usr/bin/vi

grub-mkconfig -o /boot/grub/grub.cfg
git clone git@github.com:l-wegner/ansible-boot.git

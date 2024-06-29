#!/bin/bash
#
SCRIPT_LOC=$( cd -- "$(dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)
if [ "$EUID" -ne 0 ]
then
  sudo "S0" "$@"
fi
echo "Creating the user"
source ${SCRIPT_LOC}/create-user.sh


echo "switching to ansible user: ${TOOR_NM}"

sudo -u "${TOOR_NM}" -- bash -c '
cd
mkdir -p git && cd git
pwd
echo "linking the repo"
#git clone git@github.com:l-wegner/ansible-boot.git
sudo cp -r /home/larser/git/ansible-boot/ .
sudo chown -R ${TOOR_NM}:${TOOR_NM} ansible-boot
cd ansible-boot
ansible-playbook -vv -i inventory site.yml --tags paru

ansible-playbook -vv -i inventory site.yml --tags workstation,aur
' --TOOR_NM=$TOOR_NM --USER_NM=$USER_NM
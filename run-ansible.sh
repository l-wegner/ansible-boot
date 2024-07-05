#!/bin/bash
#
set -e
SCRIPT_LOC=$( cd -- "$(dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)
if [ "$EUID" -ne 0 ]
then
  sudo "S0" "$@"
fi
echo "Creating the user"
source ${SCRIPT_LOC}/create-user.sh


echo "switching to ansible user: ${TOOR_NM}"

sudo -i -u "${TOOR_NM}" --preserve-env=TOOR_NM,USER_NM <<EOF
cd
mkdir -p git && cd git
echo "linking the repo"
if [ -d ansible-boot ]; then
  cd ansible-boot && git pull
else
  git clone https://github.com/l-wegner/ansible-boot.git && cd ansible-boot
fi
ansible-playbook -vv -i inventory site.yml --tags paru

ansible-playbook -vv -i inventory site.yml --tags workstation,aur 
EOF

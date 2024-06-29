#!/bin/bash

function prompt_user() {
USER_NM_DEF="lars"
TOOR_NM_DEF="toor"
TOOR_UID_DEF="1001"
echo "Enter user name [${USER_NM_DEF}]: " && read USER_NM && \
echo "Enter password for ${USER_NM:-${USER_NM_DEF}} user:" && read -s USER_PW && \
echo "Enter ansible user name [${TOOR_NM_DEF}]: " && read TOOR_NM && \
echo "Enter password for ansible user[${TOOR_NM:-${TOOR_NM_DEF}}]:" && read -s TOOR_PW && \
echo "Enter UID and GID for ansible user [${TOOR_UID_DEF}]: " && read TOOR_UID

export USER_NM=${USER_NM:-${USER_NM_DEF}}
export TOOR_NM=${TOOR_NM:-${TOOR_NM_DEF}}
if [ ! -z "$USER_PW" ]; then
  export USER_PW_HASH=$(echo $USER_PW | mkpasswd -m sha-512 -s)
fi
if [ ! -z "$TOOR_PW" ]; then
  export TOOR_PW_HASH=$(echo $TOOR_PW | mkpasswd -m sha-512 -s)
fi

if [ ! -z "$TOOR_UID" ]; then
  export TOOR_UID
fi
}

prompt_user
ansible-playbook -vv -i inventory site.yml --tags user

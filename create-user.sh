#!/bin/bash
echo "Enter user name: " && read USER_NM && \
echo "Enter password for $USER_NM user:" && read -s USER_PW && \
echo "Enter password for ansible user:" && read -s TOOR_PW && \
echo "Enter UID and GID for ansible user (e.g. 1001): " && read TOOR_UID

export USER_NM
if [ ! -z "$USER_PW" ]; then
  export USER_PW_HASH=$(echo $USER_PW | mkpasswd -m sha-512 -s)
fi
if [ ! -z "$TOOR_PW" ]; then
  export TOOR_PW_HASH=$(echo $TOOR_PW | mkpasswd -m sha-512 -s)
fi

if [ ! -z "$TOOR_UID" ]; then
  export TOOR_UID
fi

ansible-playbook -vv -i inventory site.yml $*

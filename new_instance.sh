#!/bin/bash

NEW_HOSTNAME="$1"

if [ -z $NEW_HOSTNAME ]; then
    echo "./new_instance.sh <new hostname>"
    exit
fi

echo
echo "Create instance: $NEW_HOSTNAME"
sed -in "s/template/$NEW_HOSTNAME/g" ./Vagrantfile
sed -in "s/template/$NEW_HOSTNAME/g" ./provisioning/hosts

echo
echo "Vagrant up (no provision)"
vagrant up --no-provision


NEW_IP=$(vagrant ssh-config | grep HostName | awk '{print $2}')
echo
echo "New IP Address:" $NEW_IP
sed -in "s/1.1.1.1/$NEW_IP/g" ./provisioning/hosts

echo
echo "Vagrant provision"
vagrant provision

echo
echo "Vagrant SSH"
vagrant ssh
echo

#!/bin/bash

sudo apt -y autoclean
sudo apt -y clean
sudo apt -y autoremove
sudo apt-get -f install 
sudo dpkg -l | awk '/^rc/ {print $2}' | xargs sudo dpkg --purge
sudo echo "vm.swappiness=5" >> /etc/sysctl.conf

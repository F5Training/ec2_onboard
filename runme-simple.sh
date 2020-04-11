#!/bin/bash
###
### Enable Byobu & Toggle UTF-8
###
byobu-enable
/usr/lib/byobu/include/toggle-utf8

###
### APT update, upgrade and install (auto)
###
sudo apt update
#sudo apt upgrade -y
sudo apt purge lxd -y
sudo apt autoremove -y
sudo snap install lxd
sudo apt install -y --no-install-recommends \
  ansible

###
### Clone aws-lxd
###
git clone https://github.com/F5Training/aws-lxd.git ~/aws-lxd


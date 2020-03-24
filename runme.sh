#!/bin/bash
###
### Enable Byobu & Toggle UTF-8
###
byobu enable
/usr/lib/byobu/include/toggle-utf8

###
### Update ~/.bashrc file so pyenv envs persist
###
cat <<EOF >> ~/.bashrc
###
### Pyenv
###
export PATH="/home/ubuntu/.pyenv/bin:$PATH"
eval "\$(pyenv init -)"
EOF

###
### APT update, upgrade and install (auto)
###
sudo apt update
sudo apt upgrade -y
sudo apt purge lxd -y
sudo apr autoremove -y
sudo snap install lxd
sudo apt install -y --no-install-recommends \
  make build-essential libssl-dev zlib1g-dev libbz2-dev \
  libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev \
  xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

###
### Clone github repo pyenv
###
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

###
### Export environment variable for proper execution of pyenv
###
export PATH="/home/ubuntu/.pyenv/bin:$PATH"
eval "$(pyenv init -)"

###
### Clone github repo pyenv-update
###
git clone https://github.com/pyenv/pyenv-update.git $(pyenv root)/plugins/pyenv-update

###
### Clone aws-lxd
###
git clone git@bitbucket.org:tsanghan/aws-lxd.git ~/aws-lxd

###
### Install python 3.8.2, set to global and rehssh
###
pyenv install 3.8.2
pyenv global 3.8.2
pyenv rehash
pip install --upgrade pip
pip install pipenv

###
### Make projects/ansible
###
#mkdir -p projects/ansible
#cd projects/ansible

###
### Change directory to aws-lxd
###
cd ~/aws-lxd

###
### Install in venv ansible and jemspath
###
pipenv install ansible
pipenv install jmespath

#!/bin/bash
###
### Enable Byobu
###
byobu enable

###
### APT update, upgrade and install (auto)
###
sudo apt update
sudo apt upgrade -y
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
### Install python 3.8.1, set to global and rehssh
###
pyenv install 3.8.1
pyenv global 3.8.1
pyenv rehash
pip install --upgrade pip
pip install pipenv

###
### Make projects/ansible
###
mkdir -p projects/ansible
cd projects/ansible

###
### Install in venv ansible and jemspath
###
pipenv install ansible
pipenv install jmespath

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

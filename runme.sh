#!/bin/bash
byobu enable
sudo apt update
sudo apt upgrade -y
sudo apt install -y --no-install-recommends \
  make build-essential libssl-dev zlib1g-dev libbz2-dev \
  libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev \
  xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

git clone https://github.com/pyenv/pyenv.git ~/.pyenv

export PATH="/home/ubuntu/.pyenv/bin:$PATH"
eval "$(pyenv init -)"

git clone https://github.com/pyenv/pyenv-update.git $(pyenv root)/plugins/pyenv-update

pyenv install 3.8.1
pyenv global 3.8.1
pyenv rehash
pip install --upgrade pip
pip install pipenv

mkdir -p projects/ansible
cd projects/ansible

pipenv install ansible
pipenv install jmespath

cat <<EOF >> ~/.bashrc
###
### Pyenv
###
export PATH="/home/ubuntu/.pyenv/bin:$PATH"
eval "\$(pyenv init -)"
EOF

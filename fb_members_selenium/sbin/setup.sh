#!/bin/bash
if [ "$(which pip)" == "" ]; then
  sudo apt-get -y install python-pip
fi
sudo pip install selenium bs4 lxml
if [ "$(which geckodriver)" == "" ]; then
  mkdir -p ~/bin
  cd ~/bin
  wget https://github.com/mozilla/geckodriver/releases/download/v0.24.0/geckodriver-v0.24.0-linux64.tar.gz
  tar zxvf geckodriver-v0.24.0-linux64.tar.gz
fi

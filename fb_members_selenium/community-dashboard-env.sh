#!/bin/bash
sudo apt-get -y install python-pip
sudo pip install selenium bs4 lxml
mkdir -p ~/bin
cd ~/bin
wget https://github.com/mozilla/geckodriver/releases/download/v0.24.0/geckodriver-v0.24.0-linux64.tar.gz
tar zxvf geckodriver-v0.24.0-linux64.tar.gz
export FB_EMAIL="YOUR-FB-EMAIL"
export FB_PASS="YOUR-FB-PASSWORD"

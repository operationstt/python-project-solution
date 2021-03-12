#! /bin/bash

sudo apt-get update
sudo apt install python3-pip python3-venv -y
pip3 -V
python3 -m venv venv
. ./venv/bin/activate
python3 -m pip install -r requirements.txt
sudo apt install python-pytest -y
#pytest hello_world_test.py

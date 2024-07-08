#!/bin/bash

sleep 30

sudo yum update -y

sudo yum install -y gcc-c++ make
curl -sL https://rpm.nodesource.com/setup_14.x | sudo -E bash -
sudo yum install -y nodejs


sudo mv /tmp/actividad.service /etc/systemd/system/actividad.service
sudo systemctl enable actividad.service
sudo systemctl start actividad.service

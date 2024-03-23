#!/bin/bash

sudo apt install -y docker.io docker-compose


sudo systemctl enable --now docker


sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

docker --version
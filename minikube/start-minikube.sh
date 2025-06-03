#!/bin/bash

# Instalar kubectl no Ubuntu 25.04 (noble)
set -e
sudo apt-get update -y
sudo apt-get install -y ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings

curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.30/deb/Release.key | \
sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
sudo chmod a+r /etc/apt/keyrings/kubernetes-apt-keyring.gpg

echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.30/deb/ /" | \
sudo tee /etc/apt/sources.list.d/kubernetes.list > /dev/null

sudo apt-get update -y
sudo apt-get install -y kubectl

# Iniciar Minikube com o driver Docker

# No Minikube, o **driver** define onde e como as máquinas virtuais (ou containers) que rodam o Kubernetes serão criadas. 
# Ele determina o ambiente de execução do cluster local.

# O parâmetro `--driver` serve para escolher qual tecnologia será usada para criar o nó do cluster. Exemplos de drivers:  
# - docker (usa containers Docker)
# - `virtualbox` (usa VMs VirtualBox)
# - `kvm2`, `hyperkit`, `none`, etc.

# **Por que usar `--driver=docker`?**  
# Ao usar `--driver=docker`, o Minikube cria o cluster Kubernetes dentro de containers Docker, sem precisar de máquinas virtuais.
# Isso é mais rápido, consome menos recursos e é mais simples de gerenciar, especialmente em ambientes de desenvolvimento.

# Se não especificar o driver, o Minikube tenta detectar automaticamente,
# mas pode não escolher o melhor para seu sistema. Por isso, é recomendado definir explicitamente o driver desejado.
minikube start --driver=docker

# Verificar o status do Minikube
minikube status


# minikube kubectl -- get po -A
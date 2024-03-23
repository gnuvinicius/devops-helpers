## tutorial

### instalar kubectl

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

kubectl get pods
kubectl delete pod <nome>
kubectl port-forward pod/<nome> 8082:80



so funciona enquanto esta rodando o comando preso no terminal
kubectl port-forward pod/myapp-7cd85db74f-sgbk4 8091:80



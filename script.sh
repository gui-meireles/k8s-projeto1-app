#!/bin/bash

echo "building"

docker build -t aocs/kube-backend:1.0 backend/.
docker build -t aocs/kube-dabase:1.0 database/.

echo "Push"

docker push aocs/kube-backend:1.0
docker push aocs/kube-dabase:1.0

echo "Criando servicos no cluster kubernets..."

kubectl apply -f ./services.yml

echo "Realizando os deployments..."

kubectl apply -f ./deployment.yml

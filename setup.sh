#!/bin/sh
echo "Deleting previous Minikube elements."
minikube delete
echo "Starting minikube..."
#minikube --vm-driver=docker start --extra-config=apiserver.service-node-port-range=1-35000
minikube --vm-driver=virtualbox start --extra-config=apiserver.service-node-port-range=1-35000
echo "Enabling addons..."
minikube addons enable ingress
minikube addons enable dashboard
eval $(minikube docker-env)
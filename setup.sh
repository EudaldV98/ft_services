#!/bin/sh
minikube delete
minikube config unset vm-driver
#minikube --vm-driver=docker start --extra-config=apiserver.service-node-port-range=1-35000
minikube --vm-driver=virtualbox start --extra-config=apiserver.service-node-port-range=1-35000
#minikube start --extra-config=apiserver.service-node-port-range=21-32767

#enable addons
echo "Enabling addons..."
minikube addons enable dashboard
#minikube addons enable metrics-server
echo "Addons enabled successfully"

# echo "Launching dashboard..."
# minikube dashboard &

#set up docker env
echo "Setting up env..."
eval $(minikube docker-env)
echo "Env set up correctly"

echo "Enabling metallb..."
kubectl apply -f https://raw.githubusercontent.com/google/metallb/v0.8.1/manifests/metallb.yaml
kubectl create -f src/metallb_config.yaml
echo "metallb enabled"

FTPS_IP=192.168.99.121

#docker build services
docker build -t service_nginx src/nginx
docker build -t service_ftps --build-arg IP=${FTPS_IP} src/ftps
docker build -t service_wordpress src/wordpress
docker build -t service_phpmyadmin src/phpmyadmin
docker build -t service_influxdb src/influxdb
docker build -t service_grafana src/grafana
docker build -t service_mysql src/mysql

echo "Creating pods and services..."
kubectl apply -f src/nginx.yaml
kubectl apply -f src/ftps.yaml
kubectl apply -f src/influxdb.yaml
kubectl apply -f src/grafana.yaml
kubectl apply -f src/wordpress.yaml
kubectl apply -f src/phpmyadmin.yaml
kubectl apply -f src/mysql.yaml

# echo "Opening the network in your browser"
# open http://$IP
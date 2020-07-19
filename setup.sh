#!/bin/sh
echo "Deleting previous Minikube elements."
minikube delete
echo "Starting minikube..."
minikube --vm-driver=docker start
#minikube --vm-driver=virtualbox start --extra-config=apiserver.service-node-port-range=1-35000

#enable addons
echo "Enabling addons..."
minikube addons enable ingress
minikube addons enable dashboard
echo "Addons enabled successfully"

#set up docker env
echo "Setting up env..."
eval $(minikube docker-env)
echo "Env set up correctly"

#stockage of minikube ip
MINIKUBE_IP=`minikube ip`
echo "minikube ip: $MINIKUBE_IP"

#config setup
echo "Setting up config files..."
cp nginx/index_model.html nginx/index.html
cp ftps/start_model.sh ftps/start.sh
cp mysql/wordpress_model.sql mysql/wordpress.sql
cp telegraf/telegraf_model.conf telegraf/telegraf.conf

sed -i 's/MINIKUBE_IP/'"$MINIKUBE_IP"'/g' nginx/index.html
sed -i 's/MINIKUBE_IP/'"$MINIKUBE_IP"'/g' ftps/start.sh
sed -i 's/MINIKUBE_IP/'"$MINIKUBE_IP"'/g' mysql/wordpress.sql
sed -i 's/MINIKUBE_IP/'"$MINIKUBE_IP"'/g' telegraf/telegraf.conf
echo "All files set up correctly"

#services="nginx mysql wordpress phpmyadmin ftps influxdb telegraf grafana"

#docker build services
docker build -t service_nginx ./nginx
docker build -t service_ftps ./ftps
docker build -t service_wordpress ./wordpress
docker build -t service_telegraf ./telegraf
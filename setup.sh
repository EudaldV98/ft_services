#!/bin/sh
echo "Deleting previous Minikube elements."
minikube delete
echo "Starting minikube..."
minikube --vm-driver=docker start --extra-config=apiserver.service-node-port-range=1-35000
#minikube --vm-driver=virtualbox start --extra-config=apiserver.service-node-port-range=1-35000

#enable addons
echo "Enabling addons..."
#minikube addons enable ingress
minikube addons enable dashboard
echo "Addons enabled successfully"

echo "Enabling metallb..."
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
echo "metallb enabled"

echo "Launching dashboard..."
minikube dashboard &

#set up docker env
echo "Setting up env..."
eval $(minikube docker-env)
echo "Env set up correctly"

# stockage of minikube ip
# MINIKUBE_IP=`minikube ip`
# echo "minikube ip: $MINIKUBE_IP"
IP=$(kubectl get node -o=custom-columns='DATA:status.addresses[0].address' | sed -n 2p)
printf "Minikube IP: ${IP}"

#config setup
echo "Setting up config files..."
cp src/nginx/index_model.html src/nginx/index.html
#cp src/ftps/start_model.sh src/ftps/start.sh
#cp src/mysql/wordpress_model.sql src/mysql/wordpress.sql
#cp src/telegraf/telegraf_model.conf src/telegraf/telegraf.conf

sed -i 's/MINIKUBE_IP/'"$IP"'/g' src/nginx/index.html
#sed -i 's/MINIKUBE_IP/'"$MINIKUBE_IP"'/g' src/ftps/start.sh
#sed -i 's/MINIKUBE_IP/'"$MINIKUBE_IP"'/g' src/mysql/wordpress.sql
#sed -i 's/MINIKUBE_IP/'"$MINIKUBE_IP"'/g' src/telegraf/telegraf.conf
echo "All files set up correctly"

#docker build services
docker build -t service_nginx src/nginx
#docker build -t service_ftps src/ftps
#docker build -t service_wordpress src/wordpress
#docker build -t service_telegraf src/telegraf
#docker build -t service_phpmyadmin src/phpmyadmin
#docker build -t service_influxdb src/influxdb
#docker build -t service_grafana src/grafana

echo "Creating pods and services..."
kubectl apply -f src/nginx.yaml
#kubectl apply -f src/metallb.yaml
kubectl apply -f src/metallb-configmap.yaml

echo "Opening the network in your browser"
open http://$IP
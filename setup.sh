#!/bin/sh
minikube delete
minikube config unset vm-driver

#Detect the platform
OS="`uname`"
#Change settings depending on the platform
case $OS in
		"Linux")
			minikube start
			sed -i '' "s/192.168.99.120:5050/172.17.0.20:5050/g" src/mysql/wordpress.sql
			FTPS_IP=172.17.0.21
		;;
		"Darwin")
			minikube start --driver=virtualbox --extra-config=apiserver.service-node-port-range=1-35000
			sed -i '' "s/192.168.99.120:5050/192.168.99.120:5050/g" src/mysql/wordpress.sql
			FTPS_IP=192.168.99.121
		;;
		*) ;;
esac

#enable addons
echo "Enabling addons..."
minikube addons enable dashboard
minikube addons enable metrics-server
echo "Addons enabled successfully"

#set up docker env
echo "Setting up env..."
eval $(minikube docker-env)
echo "Env set up correctly."

echo "Enabling metallb..."
kubectl apply -f https://raw.githubusercontent.com/google/metallb/v0.8.1/manifests/metallb.yaml
#Run configmap depending on the platform
case $OS in
		"Linux")
			kubectl create -f src/metallb_config-Linux.yaml
		;;
		"Darwin")
			kubectl create -f src/metallb_config-Darwin.yaml
		;;
		*) ;;
esac
echo "Metallb enabled."

#docker build services
docker build -t service_mysql src/mysql
kubectl apply -f src/mysql.yaml
docker build -t service_nginx src/nginx
docker build -t service_ftps --build-arg IP=${FTPS_IP} src/ftps
docker build -t service_wordpress src/wordpress
docker build -t service_phpmyadmin src/phpmyadmin
docker build -t service_influxdb src/influxdb
docker build -t service_grafana src/grafana

echo "Adding db to mysql..."
kubectl exec -i $(kubectl get pods | grep mysql | cut -d" " -f1) -- mysql wordpress -u root < src/mysql/wordpress.sql
echo "DB added successfully."

echo "Creating pods and services..."
kubectl apply -f src/nginx.yaml
kubectl apply -f src/ftps.yaml
kubectl apply -f src/influxdb.yaml
kubectl apply -f src/grafana.yaml
kubectl apply -f src/wordpress.yaml
kubectl apply -f src/phpmyadmin.yaml

echo "Launching dashboard..."
minikube dashboard &

KUBERNETES:
-----------

- Containerization --> Release and update versions of the applications in an easy and fast way

MINIKUBE:
---------

- Create a Cluster (Kubernetes coordinates a highly available cluster of computers that are connected to work as a single unit.)

- Master : coordinates the cluster
    .- start the application containers
    .- schedules the containers to run on the cluser's nodes


- Nodes : VM or physical computer that serves as worker that runs applications (prod traffic : 3 nodes min)
    .- -> KUBELET, agent for managing the node and communicating w/ MASTER
    .- -> tools handling containers operations --> Docker
    .- -> Kubernetes API --> communicate w/ MASTER

[KUBECTL]

RESSOURCES:
-----------

.--> [phpmyadmin-configs]
- https://www.serverlab.ca/tutorials/containers/kubernetes/deploy-phpmyadmin-to-kubernetes-to-manage-mysql-pods/
- https://support.rackspace.com/how-to/install-and-configure-phpmyadmin/

.--> [dockerfile]
- https://docs.docker.com/engine/reference/builder/
- https://docs.docker.com/develop/develop-images/dockerfile_best-practices/

.--> [kubernetes - connecting services]
- https://kubernetes.io/docs/concepts/services-networking/connect-applications-service/

.--> [wordpress.yaml]
https://github.com/GoogleCloudPlatform/kubernetes-engine-samples/blob/master/wordpress-persistent-disks/wordpress.yaml

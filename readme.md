KUBERNETES:

- Containerization --> Release and update versions of the applications in an easy and fast way

MINIKUBE:

- Create a Cluster (Kubernetes coordinates a highly available cluster of computers that are connected to work as a single unit.)

- Master : coordinates the cluster
    .- start the application containers
    .- schedules the containers to run on the cluser's nodes


- Nodes : VM or physical computer that serves as worker that runs applications (prod traffic : 3 nodes min)
    .- -> KUBELET, agent for managing the node and communicating w/ MASTER
    .- -> tools handling containers operations --> Docker
    .- -> Kubernetes API --> communicate w/ MASTER

KUBECTL:

-K
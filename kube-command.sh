# know version
kubectl version

#install minikube
minikube start --driver=docker

#check cluster info
kubectl cluster-info

# to see list of pods
kubectl get pods -A

# to run pod
kubectl run nginx --image=docker.io/nginx
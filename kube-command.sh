# know version
kubectl version

#install minikube
minikube start --driver=docker

#check cluster info
kubectl cluster-info

# to see list of pods
kubectl get pods -A
kubectl get pods -A --show-labels

# to run pod
kubectl run nginx --image=docker.io/nginx

kubectl config get-contexts
kubectl config current-context
kubectl config use-context minikube

# execute inside contianer
kubectl exec -it podname -c contianer-name --bash # it interactive

# api server kubectl
kubectl api-resources # print the api resources
kunectl api-versions #various apis in kuberenets

# replica sets
kubectl get rs -A

# replica set delete
kubectl delete replicasetname

# delete only  replica set pods remain there
kubectl delete replicaset-name --cascade=orphan
# kubectl isolation
# change label of container for trouble shooting-
#make traffic to newly created and debug the old
kubectl label pods nameof-pod app=newname --overwrite

# scaling replica sets
kubectl scale rs replicaset-name --replicas=1

# problems in replicasets
# suppose we change the image version, it wont do any change in replicaset
# solution deployment


# annotations 
#labels are just string- annotations are give some value to -pod-deletion-cost


k9s
cntrl+k to kill pods
inside k9s 
press y code information of pod

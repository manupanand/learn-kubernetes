# know version
kubectl version

#install minikube
minikube start --driver=docker

#check cluster info
kubectl cluster-info

# to see list of pods
kubectl get pods -A
kubectl get pods -A --show-labels
kubectl get pods --watch # to see any changes
kubectl get pods --wide # more information node ip, ip 

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


# stateful sets
# if example, databases with multi nodes- huge data lake, if one node delted and new 
# created with attachment of old one(with same ip or dns) it will consider it as old one only
# if kill pod in kube- it will be new name  by default for new one-
# stateful sets it will not happen it will be in same name

# daemon sets

# jobs
# some sort of computation job for certain time only- contianers will run fulltime
#some load -run short time; example loading schema

# annotations 
#labels are just string- annotations are give some value to -pod-deletion-cost


k9s
cntrl+k to kill pods
inside k9s 
press y code information of pod

# to see ':'- which pods? which service

# we can do curl from one contianer inside a pod to coonect to other
 kubectl exec -it contianer-name
 curl contianer-name
 curl name.default(namespace).svc.cluster.local # inbuilt dns server

  # service

  cluster ip
  type: ClusterIP 
  # Ecpose service on a cluster internal ip- access within cluster 
  #- by default if we dont specify type
  # can expose service to public using ingress or Gateway

  Nodeport- from kubernetes layer
 # exposes the service on each node's ip at a static port.
 # to make node port available-kubernetes set up cluster ip address 
 it will open on all nodes

 hostport-different like docker port


 Load balancer

 # exposes ther service externally using an external load balancer, 
 # kubernetes doesnt provide a load balancing component
 #can integrate our own load balancer with kubernetes
 

 External Name-cname record
 A- name pointing to ip
 CNAME- name point to another cname
 Maps the service to the contents of the external name field


CNI- contianer network interface

Headless service 
some time no need to use load balancer
example statefull cluster-dbs 
one act as writer and other as reader, to know who is writer and reader, a service used 
headless service
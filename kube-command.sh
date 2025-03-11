# know version
kubectl version

#install minikube
minikube start --driver=docker

# k9s
: to search
y to get yaml file
d describe
e for edit yaml

#check cluster info
kubectl cluster-info


kubectl get nodes  -A


# apply file
kubectl apply -f file.yaml
kubeclt delete -f file.yaml
# to apply everything in a folder
kubectl apply -f folder-name

# name space
kubectl create ns namespace-name

# to see list of pods
kubectl get pods -A
kubectl get pods -A --show-labels
kubectl get pods --watch # to see any changes
kubectl get pods --wide # more information node ip, ip 
kubectl get pod pod-name debug -o yaml # identiy|service account can see kubectl configuration done
kubectl get sa -n test # see servicee account - it will be default

# delete
kubectl delete pod <pod-name>
kubectl delete pods --all -n <namespace>
kubectl delete pod <pod-name> --grace-period=0 --force
# to run pod
kubectl run nginx --image=docker.io/nginx

kubectl config get-contexts
kubectl config current-context
kubectl config use-context minikube

# execute inside contianer
kubectl exec -it podname -c contianer-name -- bash # it interactive
# to login to pod in specific name space if you have same name pods
kubectl exec -it -n frontend debug -- bash
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


# debug 
kubectl run debug --image=docker.io/rkalluru/debug


# log 
kubectl logs -l -f app=nginx

# config management - config map
 for larger projects env: writing down is tedious, so it will be good 
 to use some centralised config management for config management

 @ wec an also attach complete config map values to pod

  wecan also get config map inside a pod as file/ mount config map

  #k9s cm to see config map

#pass environment variable-yml 
contianers: 
  - name: 
    env: 
      - name: DEMO_USER
        value: "test"
kubectl exec -it podname -- env # to print env variable


# resource management-cpu,memory,hugepages-in linux
request: must and require- dedicated mandatory
limit: if available
one coantiner consume more resource in scenario?
or some scaling if 50% utilization in cpu

# to monitor pod cpu/memory utulization
kubectl top pod podname

# namespace quota-resource[cost optimization the new stack]
https://thenewstack.io/leveraging-namespaces-for-cost-optimization-with-kubernetes/


# autoscaling- metric server
kubectl get deployment  metric-server -n kube-system
eks kubernets metric server-monitoring


## monitoring
kubectl top utility # utility-pod, or specidic pod
kubectl top pod
watch "kubectl top pod" #continous watch

kubectl delete ns namepsace-name # all things associated with name space deleted
 prometheus
# cloud trail to monitor

# security
 
 # how to provide authorization
 service account 
# why do need peprmission to pods? - within cluster| if install ArgoCD to manage-pods
 #RBAC- role based access control-role or cluster role for user or organization
 #role- associated with name space
 # cluster role- non-namespace resource
 kubectl get clusterroles

 # get api-versions
 kubectl api-versions

# network policy is layer 7-pod/application level contend aware 
# later 4 firewall-segments/Transport in security group TCP UDP
 OSI layers

 # without network policy curl of any other pod
 from default and other name space it will be able to do curl

 # method level network security 
# get,post,delete etc- aws default vpc cni is not enough it is at application level
#-service mesh-IStio/consul -frontend talk to backend without authentication/shipping->payment

# Pod/container level security
# Discretionary acces control-UserId/Group based access
#SELinux Security enhansed linux
# running as privileged or un privileged-ex: run build docker inside a docker
# rootless docker problem? privileged contianer-risk |always unless needed run docker witn unprivileged
# APP armor
# Seccomp filter a procees system calls
#Linux capabilities linux audit-SetUID,SetGid? ls-l /usr/bin |grep rws
#security context
#ex:when you want not to run pod as root user 
# even if someone enter container-
# secirity context accros cluster |OPA gatekeeper
# API acess control
# helm charts
kubectl get psp # pod security policy|PSA and PSS from now
# security scanners-twistlock defender-prisma cloud |kubeaudit

# kube audit
kubeaudit all -n namespace


# monitoring and logging-k8s
#install native matrix server eks
kubectl top pod podname
kubernetematrixserver-pod
kubectl top pod kub-matrix-server-pod -n namespace-name
kubectl top node  #node level k9s :node
# health monitoring
 probes in  k8s
 Liveness probe, Readiness probe, Startup Probe 
 liveness :
  initalization  ot readiness- take time |application start time- readiness
  readiness to liveness
  during ready -traffic will not send
  # tomcat vs jboss two lifecycle- 1 for start tomcat then time to start application inside tomcat
  # using http /tcp or grpc liveness


  # auto scaling
  #horizontal pod acceleration hpa
  kubectl get hpa --watch
  # hpa has limitaion to 1 not zero
  # hpa limitation - cpu and memory monitor- only|
  #if application itself take 90% ? it will never come down infinite scalig will happen
  # ex : dispatch or payment rabbitmw que messages, doesnt affect? or number of requests
  # auto scaling based on extended options or attributes -KEDA


  # vertical scaling, whether  
  #we can change Pod resource after it is launched increase size,
  # it need to kill pod- read kubecost.com/kubernetes-autoscaling/kubernetes-vpa
  #https://www.kubecost.com/kubernetes-autoscaling/kubernetes-vpa/
  # ned to cone autoscaler-redis
  # problem with vpa is it will kill pod first and do scaling,
# so we loose some request coming in between



kubectl describe pod podname

# so requirement to node auroscaling and cluster autoscaling-3rd party
# | aws based autoscaling


# scheduler - assigning pods to workers nodes based on
# resource availability, labels,
kubectl get nodes --show-labels
# label a node
kubectl label node node-name appType=database
#use pod with node selector
#node affinity #pod affinity, topologykey ,taints
# dont want run any pod on node  ex dont want any more | or run on node only if it is allowed
#unschedule node
kubectl cordon node node-name

 kubectl taint nodes node1-name appType=database:NoSchedule # NoExexute # PreferNoSchedule
# nice in lunix for priorities |like pod proirity | linux less number higher priority
# priority class |higher priority higher value- massive cluster
# eviction

# cloud controller
# load balancer, Storage, PV, SC and PVC
# disk attached to OS(/dev/n2)-> kubeadm (PV map os level disk)-> POD(PVC mapped to PV)
# cloud -eks- with clloud controller -EBS storage (above is manual method)
# automate SC-storage class-> cloud controller-> will add PVC 
kubectl get sc
kubectl get pvc
kubectl describe pvc
# eks install addons -ebs csi driver-> iam role(eks irsa - iam role for service account)
#ima role: add provider-> copy eks openid(provider usl), in provide role
# audience sts.amazon.com
# i am role : webidentity-select above provider and audience
kubectl get sa -A # get service account -ebs-csi-controller-sa




## helm
kubectl api-version # batch/v1 -help for helping -loops,capabilities
# values files- values user provide
replace in ex: Pod file -{{.Values.name}} and values.yaml-> name: nginx


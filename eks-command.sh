# create cluster 
eksctl create cluster


# to see clusters listed 
eksctl get cluster --region region-name

# configure the kubectl to connect to aws eks
#minikube doesnt need to configure kubectl (.kube/config
)
after creating cluster using eksctl config kubectl for usuing kubectl
 # configure kubectl:
 aws eks update-kubeconfig --name name-of-cluster
 aws eks update-kubeconfig --region ap-south-2 --name dev-cluster


 # aws use aws vpc as vpc cni, kuberntes maintain iptables
 # iptables are OS level firewall

 eksctl create cluster --name my-cluster --region us-east-1 --node-type t3.medium
 eksctl create cluster --name my-cluster --region us-east-1 --node-type t3.small --nodes 2


 # delete cluster 
 eksctl delete cluster cluster-name
 eksctl delete cluster -f filename.yaml --force 
 eksctl delete cluster -f filename.yaml --force --disable-nodegroup-eviction

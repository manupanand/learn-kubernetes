# create cluster 
eksctl create cluster

# configure the kubectl to connect to aws eks
#minikube doesnt need to configure kubectl (.kube/config
)
 # configure kubectl:
 aws eks update-kubeconfig --name name-of-cluster

 # aws use aws vpc as vpc cni, kuberntes maintain iptables
 # iptables are OS level firewall

 eksctl create cluster --name my-cluster --region us-east-1 --node-type t3.medium
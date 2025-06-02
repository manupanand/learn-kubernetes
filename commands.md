# k9s commands




# kubectl commands

### run image
```
kubectl run name --image=docker.io/imagename
kubectl delete pod name
kubectl get pods -A # to list all pods
kubectl get pods -A -o wide # more detailed info  like ip address |for every pods will have ip
kubectl get pods podname -o yaml # check - get  the yaml output |get all details of pod in yaml
kubectl get ns # namespace service accounts created by default when namespace is created
kubectl get sa # service accounts
kubectl get clusterroles # to list all cluser roles
kubectl get api-resources 
kubectl get api-versions

kubectl exec -it podname --bash # curl other pod ip to test

 kubectl top pod podname # to monitor pod - need metrics api
 kubectl top pod podname -n namespace # 
 kubectk get hpa --watch # to watch hpa utilizations
 to look iniide pod
 kubectl describe pod podname 
  kubectl get cm -o yaml # to see configmap
  kubectl get cm -n kube-system  aws-auth -o yaml # aws-auth mapRoles to edit and get access

```
### vertical scaling k8s
```
git clone https://github.com/kubernetes/autoscaler.git
cd autoscaler/vertical-pod-autoscaler/hack/ 
./vpa-up.sh
examples-redis
```

## K9s
```
y - yaml changes
cntrl-k kill pod

```

# eksctl commands
```
install eksctl
eksctl create cluster -f file.yaml
eksctl delete cluster -f file.yaml --region region --name name-cluster --force

to connect
aws eks update-kubeconfig --name clustername

```


try minikube
https://github.com/scholzj/aws-minikube
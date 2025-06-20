ps -aux |grep vault
netstat -lntp > vautl processid
ps -ef |grep vault-processid
dnf list installed | grep vault >> installed packagename
rpm -qf vaultinstalled packagename
rpm -ql packagename > list all direcrory associated with this package
check for usr/lib/systemd/system/vault.service
cat usr/lib/systemd/system/vault.service >-config
cat /etc/vault.d/vault.hcl > listener tcp> tls_cert_file= /opt/vault/tls/tls.crt,tls.key > tale this files and give to k8s
cat /opt/vault/tls >tls.crt,tls.key |convert basse64 and paste it clinetCert,secretRef
cat -n tls.crt | base64 -w0 # wrap in one line >paste in secretstore yaml
cat -n tls.key | base64 -w0 # wrap in one line >paste in secretstore yaml

or disable tls in vault

listener "tcp"{
    address="0.0.0.0:8200"
    #tls_cert_file
    #tls_key_file
    tls_disable=1
}>acess vault with http :8200

after apply 
kubectl describe secretstore name(vault-backend)#check for validity message
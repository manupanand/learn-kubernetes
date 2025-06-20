git pull 
/usr/local/bin/helm upgrade -i ecomm-$2 ./ -f env-$1/$2.yaml 
# $2 file-name, $1 environment
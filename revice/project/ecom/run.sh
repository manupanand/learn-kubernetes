# run catalogue from out
helm install catalogue ./ecomm-helm-k8s-infra -f ecomm-helm-k8s-infra/env-dev/catalogue.yaml
# inside
helm install catalogue ./ -f env-dev/catalogue.yaml

helm upgrade -i  catalogue ./ -f env-dev/catalogue.yaml


helm upgrade -i  catalogue ./ -f env-dev/catalogue.yaml --dry-run # for testing code

helm uninstall shipping

# hooks-a t what time to provide
# before intall ex shipping a schema job should create
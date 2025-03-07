#install helm

folder-map\ 
  | Chart.yaml 
  | values.yaml # default configuration values
  |charts/
  |crds/ developmernt
  |templates/ kubenetes manifest
  Notes.txt-extend or add anything- the message output


#run helm chart
helm install installation-name(demo1) ./folder(sample)/
# first time install then do upgrade
help upgrade name ./folder/
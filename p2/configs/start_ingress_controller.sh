  echo [RUN ingress controller]
  git clone https://github.com/nginxinc/kubernetes-ingress.git --branch v2.3.0
  cd kubernetes-ingress/deployments
  /usr/local/bin/kubectl apply -f common/ns-and-sa.yaml
  /usr/local/bin/kubectl apply -f rbac/rbac.yaml
  /usr/local/bin/kubectl apply -f common/default-server-secret.yaml
  /usr/local/bin/kubectl apply -f common/nginx-config.yaml
  /usr/local/bin/kubectl apply -f common/ingress-class.yaml
  /usr/local/bin/kubectl apply -f common/crds/k8s.nginx.org_virtualservers.yaml
  /usr/local/bin/kubectl apply -f common/crds/k8s.nginx.org_virtualserverroutes.yaml
  /usr/local/bin/kubectl apply -f common/crds/k8s.nginx.org_transportservers.yaml
  /usr/local/bin/kubectl apply -f common/crds/k8s.nginx.org_policies.yaml
  /usr/local/bin/kubectl apply -f deployment/nginx-ingress.yaml
  /usr/local/bin/kubectl create -f service/nodeport.yaml
  echo [RUN YAMLs on MASTER]
  # export SSHPASS=$1
  # sshpass -e ssh -tt vagrant@192.168.42.111
  /usr/local/bin/kubectl create ns app
  /usr/local/bin/kubectl apply -f /vagrant/configs/apps.yaml -n app
  /usr/local/bin/kubectl apply -f /vagrant/configs/services.yaml -n app
  /usr/local/bin/kubectl apply -f /vagrant/configs/ingress.yaml -n app
  /usr/local/bin/kubectl get all -ALL


  #TODO подумать о неймспейск
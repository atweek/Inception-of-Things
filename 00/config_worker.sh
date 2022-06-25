firewall-cmd --zone=public --permanent --add-port={10250,30000-32767}/tcp
# firewall-cmd --reload
# kubeadm join 94.237.41.193:6443 --token 4xrp9o.v345aic7zc1bj8ba 
# --discovery-token-ca-cert-hash sha256: чек
kubectl get nodes
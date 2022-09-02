systemctl start docker
sudo k3d cluster list
sudo kubectl cluster-info
sudo kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
echo "----------------"
sleep 5
sudo kubectl port-forward svc/argocd-server -n argocd 8080:443
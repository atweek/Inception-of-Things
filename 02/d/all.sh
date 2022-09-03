# sudo pacman -S kubectl docker
# https://k3d.io/v5.4.5/#quick-start

sudo k3d cluster create atweek --agents 2 --servers 1
sudo kubectl cluster-info
sudo kubectl create namespace argocd
sudo kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
NAME = In

install:
	@sudo k3d cluster create atweek --agents 2 --servers 1
	@sudo kubectl cluster-info
	@sudo kubectl create namespace argocd
	@sudo kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

first_run: install
	@sudo systemctl start docker
	@sudo k3d cluster list
	@sudo kubectl cluster-info
	@sleep 100
	@sudo kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
	@sudo kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d > ../secrets/default_pass

	@echo "Если тут нет пароля то введи make get_admin_secret"
	@echo "----------------"
	@sleep 5
	@sudo kubectl port-forward svc/argocd-server -n argocd 80:443 > ../log/port-forward.log 2> ../log/port-forward.log &
	@sudo kubectl apply -n argocd -f ../confs/argocd-cm.yaml 
	@sudo kubectl apply -n argocd -f ../confs/argocd-rbac-cm.yaml
	sh update_pass.sh

	sudo kubctl apply -f project.yaml 
	
get_admin_secret:
	@sudo kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo

run:
	@-systemctl start docker
	@sudo k3d cluster list
	@sudo kubectl cluster-info
	@sudo kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
	@sudo kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d > ../secrets/default_pass
	@echo "----------------"
	@sleep 5
	@sudo kubectl port-forward svc/argocd-server -n argocd 80:443 > ../log/port-forward.log 2> ../log/port-forward.log &

	sudo kubctl apply -f project.yaml 

kill_port-forward:
	@-pkill kubectl
	@echo "Лучше посмотреть в jobs и убить так kill %1"

del_cluster: kill_port-forward
	k3d cluster delete atweek
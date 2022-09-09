sudo argocd login argocd.atweek:9999 --username admin --password $(cat ./secrets/default_pass)
sudo argocd account update-password --account admin --current-password $(cat ./secrets/default_pass) --new-password $(cat ./secrets/pass)
sudo argocd account update-password --account atweek --current-password $(cat ./secrets/pass) --new-password  $(cat ./secrets/pass)
sudo argocd login argocd.atweek:9999 --username atweek --password $(cat ./secrets/pass)
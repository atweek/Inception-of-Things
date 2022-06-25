dnf -y upgrade
sed -i --follow-symlinks 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux
modprobe br_netfilter
sysctl --system
swapoff -a
# instal docker
dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
dnf install https://download.docker.com/linux/centos/7/x86_64/stable/Packages/containerd.io-1.2.6-3.3.el7.x86_64.rpm
systemctl start docker
systemctl enable docker
echo '{
  "exec-opts": ["native.cgroupdriver=systemd"]
    }' > /etc/docker/daemon.json
systemctl restart docker
docker version
# install cuber
cat < /etc/yum.repos.d/kubernetes.repo
    [kubernetes]
    name=Kubernetes
    baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-$basearch
    enabled=1
    gpgcheck=1
    repo_gpgcheck=1
    gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
    exclude=kubelet kubeadm kubectl
    EOF
dnf upgrade -y
dnf install -y kubelet kubeadm kubectl --disableexcludes=kubernetes
systemctl enable kubelet
systemctl start kubelet
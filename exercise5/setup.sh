# Make sure port 8001 is free before running this script. It is required by dashboard
sudo systemctl start docker.service
sudo iptables -I INPUT -j ACCEPT
sudo kubeadm reset
sudo rm -r /var/lib/kubelet
sudo swapoff -a
sudo free -m
sudo kubeadm reset
sudo kubeadm init


sudo rm -rf $HOME/.kube
sudo mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config


kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"
kubectl get pods --all-namespaces

kubectl taint nodes --all node-role.kubernetes.io/master-

kubectl apply -f Assignment/exercise5.yaml

sudo kubectl proxy --address='0.0.0.0' --port=8001 --accept-hosts='^*$'&

kubectl get pods --all-namespaces
kubectl get hpa --all-namespaces
kubectl get deployments --all-namespaces
kubectl get services --all-namespaces

#http://10.155.209.51:32132/exercises/exercise3?name=CCS&productId=3
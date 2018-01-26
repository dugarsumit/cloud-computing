# Make sure port 8001 is free before running this script. It is required by dashboard
netstat -plnt
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

kubectl create -f dashboard-admin.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml
sudo kubectl proxy --address='0.0.0.0' --port=8001 --accept-hosts='^*$'&

#http://10.155.208.228:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#!/overview?namespace=default

kubectl taint nodes --all node-role.kubernetes.io/master-
kubectl run hello-world-service --image=docker.io/dugar/microservice:hello --port=9001
kubectl run product-descp-service --image=docker.io/dugar/microservice:productdescp --port=9002
kubectl run product-price-service --image=docker.io/dugar/microservice:productprice --port=9003
kubectl run server --image=docker.io/dugar/microservice:server --port=8080
kubectl get deployments --all-namespaces


kubectl expose deployment hello-world-service --port=9001
kubectl expose deployment product-descp-service --port=9002
kubectl expose deployment product-price-service --port=9003
kubectl expose deployment server --port=8080 --target-port=8080 --type=LoadBalancer
kubectl get services --all-namespaces
kubectl scale deployment server --replicas=2

#http://10.155.208.228:30733/exercises/exercise3?name=CCS&productId=3
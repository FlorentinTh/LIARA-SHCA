
## 3. Install Kubernetes

* add required repo and install ```kubeadm``` : 

```
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add - 

echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list 

sudo apt-get update -q

sudo apt-get install -qy kubeadm
```

***
**⚠ _Until contrary notice, next procedures have to be executed on master device of Kubernetes cluster ONLY_**
*** 
  * pull the requisites Docker images for Kubernetes master : 
    ```
    sudo kubeadm config images pull -v3
    ```

  * initialize master with infinite token _(not safe for production)_:
    
    ```
    sudo kubeadm init --token-ttl=0 --pod-network-cidr=10.244.0.0/16
    ```

    ***
    **⚠ At this stage, do not forget to save somewhere the command required for nodes to join the cluster.**
    ***
  * save admin configuration of the Kubernetes cluster locally : 
    ```
    mkdir -p $HOME/.kube
    sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
    sudo chown $(id -u):$(id -g) $HOME/.kube/config
    ``` 

  * install Flannel network driver :
    ```
    kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/a70459be0084506e4ec919aa1c114638878db11b/Documentation/kube-flannel.yml

    ```
***
**⚠ _Now, on each node including the master one_**
*** 
```
sudo sysctl net.bridge.bridge-nf-call-iptables=1
```
***
**⚠ _Finally, on each node except the master one_**
*** 
```
kubeadm join <@IP_of_master_node>:6443 --token <generated_token> --discovery-token-ca-cert-hash <generated_hash>
```

if you want to add a node later, run following command on your master one : 
```
sudo kubeadm token create --print-join-command 
```
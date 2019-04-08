## 3. Docker

### 3.1. Install Docker

* execute the installation command as follows :
```
curl -sSL get.docker.com | sh
```
* add the current user to the docker group : 
```
sudo usermod <username> -aG docker 
```
* create the group :
```
newgrp docker
```

### 3.2. Install Docker Compose

* update possibly out of date setuptools package : 
```
sudo pip install --upgrade setuptools
```
* install Docker Compose through ```pip``` :
```
sudo pip install docker-compose
```

### 3.3. Create the swarm

<span style="color:red">⚠ only on the </span> **<span style="color:red">manager0</span>**<span style="color:red"> node. See [setup](https://github.com/FlorentinTh/PiCluster#setup) for more informations.</span>

* initialize the swarm :
```
docker swarm init --listen-addr <@ip_of_leader_master_node> --advertise-addr <@ip_of_leader_master_node>
```

* obtain the join command for manager nodes :
```
docker swarm join-token manager
```
* obtain the join command for worker nodes :
```
docker swarm join-token worker
```

<span style="color:red">⚠ only on the </span> **<span style="color:red">manager1</span>** <span style="color:red">and the</span> **<span style="color:red">manager2</span>**<span style="color:red"> node. See [setup](https://github.com/FlorentinTh/PiCluster#setup) for more informations.</span>

* join the swarm as a **manager** node :
```
docker swarm join --token <generated_token> <@ip_of_leader_master_node>:2377
```

<span style="color:red">⚠ only for the following nodes : </span> **<span style="color:red">worker0, worker1, worker2.</span>** <span style="color:red">See [setup](https://github.com/FlorentinTh/PiCluster#setup) for more informations.</span>

* join the swarm as **worker** nodes :
```
docker swarm join --token <generated_token> <@ip_of_leader_master_node>:2377
```
<span style="color:red">⚠ only on the </span> **<span style="color:red">manager0</span>**<span style="color:red"> node. See [setup](https://github.com/FlorentinTh/PiCluster#setup) for more informations.</span>
* create an overlay network : 
```
docker network create -d overlay --attachable --subnet 10.1.9.0/24 multi-host-net
```

### 3.4. Setup a reverse proxy
* deploy the [Traefik](http://www.portainer.io/) stack : 
```
docker stack deploy -c /nfs/conf/traefik.yml traefik
```
* access the dashboard through a browser : 
```
http://@IP_of_any_node:8080
```

### 3.5. Deploy a GUI to manage the swarm

* deploy the [Portainer](http://www.portainer.io/) stack : 
```
docker stack deploy -c /nfs/conf/portainer.yml portainer
```
It will automatically deploy a single instance of the Portainer Server, and deploy the Portainer Agent as a global service on every node in the cluster.

* access the GUI through a browser : 
```
http://@IP_of_any_node:9000
```

### 3.6. Deploy a private registry

<span style="color:red">⚠ only on the </span> **<span style="color:red">server</span>**<span style="color:red"> node. See [setup](https://github.com/FlorentinTh/PiCluster#setup) for more informations.</span>

* create an authentication file :
```
sudo htpasswd -Bbn <username> <password> > /media/storage/nfs/registry/auth/htpasswd
```

* _(optionnal) if you want to use SSL for your private registry_ : 
```
sudo openssl req -newkey rsa:4096 -nodes -sha256 -keyout /media/storage/nfs/certs/domain.key -x509 -days 365 -out /media/storage/nfs/certs/domain.crt
```

* build and start the container :
_make sure to uncomment commented line beforehand if you want to use SSL._
```
docker-compose -f "/media/storage/nfs/conf/registry.yml" up -d --build
```
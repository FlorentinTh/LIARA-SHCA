## 2. Docker
---

### 2.1 Install Docker

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

### 2.2 Install Docker Compose

* install python and ```pip``` :
```
sudo apt-get install -y python python-pip
```

* install ```docker-compose``` through ```pip``` command :
```
sudo pip install docker-compose
```

### 2.3 Create the swarm

<span style="color:red">⚠ only on the </span> **<span style="color:red">master</span>**<span style="color:red"> node. See [setup](https://github.com/FlorentinTh/PiSwarm#setup) for more informations.</span>

* initialize the swarm :
```
docker swarm init --advertise-addr <@ip_of_master_node>
```

* obtain the join command for manager nodes :
```
docker swarm join-token manager
```
* obtaine the join command for worker nodes :
```
docker swarm join-token worker
```

<span style="color:red">⚠ only on the </span> **<span style="color:red">node0</span>**<span style="color:red"> node. See [setup](https://github.com/FlorentinTh/PiSwarm#setup) for more informations.</span>

* join the swarm as a **manager** node :
```
docker swarm join --token <generated_token> <@ip_of_master_node>:2377
```

<span style="color:red">⚠ only for the following nodes : </span> **<span style="color:red">node1, node2, node3.</span>** <span style="color:red">See [setup](https://github.com/FlorentinTh/PiSwarm#setup) for more informations.</span>

* join the swarm as **worker** nodes :
```
docker swarm join --token <generated_token> <@ip_of_master_node>:2377
```

### 2.4 Deploy a GUI to manage the swarm

* run the following command to get the [portainer](www.portainer.io) compose file :
```
 curl -L https://downloads.portainer.io/portainer-agent-stack.yml -o portainer-agent-stack.yml
```
* deploy the stack : 
```
docker stack deploy --compose-file=portainer-agent-stack.yml portainer
```
_It will automatically deploy a single instance of the Portainer Server, and deploy the Portainer Agent as a global service on every node in the cluster_
* access the GUI through a browser : 
```
http://@IP_of_master_node:9000
```

### 2.5 Deploy a private registry

<span style="color:red">⚠ only on the </span> **<span style="color:red">registry</span>**<span style="color:red"> node. See [setup](https://github.com/FlorentinTh/PiSwarm#setup) for more informations.</span>

* create the base directory where images are stored on host :
```
sudo mkdir -p /docker_data/images
```

* create an authentication file :
```
sudo mkdir -p /docker_data/auth

sudo htpasswd -Bbn <username> <password> > /docker_data/auth/htpasswd
```

* _(optionnal) if you want to use SSL for your private registry_ : 
```
sudo mkdir -p /docker_data/certs/

sudo openssl req -newkey rsa:4096 -nodes -sha256 -keyout docker_data/certs/domain.key -x509 -days 365 -out /docker_data/certs/domain.crt
```

* run the following command to get the compose file : 
```
curl -L https://raw.githubusercontent.com/FlorentinTh/PiSwarm/master/compose-files/registry.yml?token=ACX0vU_gfXEYmDwApdfmQEiaHXh-9DkCks5cmVT6wA%3D%3D -o registry.yml
```
_make sure to uncomment commented line if you want to use SSL_

* build and start the container :
```
docker-compose -f "registry.yml" up -d --build
```

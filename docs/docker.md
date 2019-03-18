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

<span style="color:red">⚠ only on the </span> **<span style="color:red">master</span>**<span style="color:red"> node. See [setup]() for more informations.</span>

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

<span style="color:red">⚠ only on the </span> **<span style="color:red">node0</span>**<span style="color:red"> node. See [setup]() for more informations.</span>

* join the swarm as a **manager** node :
```
docker swarm join --token <generated_token> <@ip_of_master_node>:2377
```

<span style="color:red">⚠ only for the following nodes : </span> **<span style="color:red">node1, node2, node3.</span>** <span style="color:red">See [setup]() for more informations.</span>

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

<span style="color:red">⚠ only on the </span> **<span style="color:red">registry</span>**<span style="color:red"> node. See [setup]() for more informations.</span>

* create an authentication file :
```
mkdir auth

htpasswd -Bbn <username> <password> > auth/htpasswd
```

* run the following command to get the compose file : 
```
curl registry.yml
```
* build and start the container :
```
docker-compose -f "registry.yml" up -d --build
```
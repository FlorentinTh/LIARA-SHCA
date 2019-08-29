# Cluster

## 1. Prerequisites

### 1.1. NFS Share

> The first things that is required on every node that compose the cluster is to link them to the NFS server to allow data sharing.

- Install required packages :

```bash
$ sudo apt-get install -y nfs-common
```

- Create the shared directory :

```bash
$ sudo mkdir -p /mnt/nfs
```

- Mount the directory from the NFS server :

```bash
$ sudo mount 192.168.1.200:/mnt/nfs /mnt/nfs
```

- Automatically mount the NFS share at boot time :

```bash
$ sudo nano /etc/fstab

# Add this line at the end of the file :
192.168.1.200:/mnt/nfs  /mnt/nfs   nfs rw  0   0
```

- Copy required files :

_TODO_

## 1.2. Floating IP

- Edit the network interface configuration file :

```bash
$ sudo nano /etc/network/interfaces.d/eth0
```

- Add the following configuration to the end of the file :

```nginx
auto eth0:1
iface eth0:1 inet static
address 192.168.1.100
netmask 255.255.255.0
```

- Enable the the floating IP :

```bash
$ sudo ifup eth0:1
```

## 2. Create the Cluster

> __Following steps must be done only on the ```m0``` node. See [setup](../README.md) for more information.__

- Initialize the swarm :

```bash
$ docker swarm init --advertise-addr <@IP_of_leader_master_node>
```

- Obtain the join command for ```manager``` nodes :

```bash
$ docker swarm join-token manager
```

- Obtain the join command for ```worker``` nodes :

```bash
$ docker swarm join-token worker
```

> __Following steps must be done only on ```m1``` and ```m2``` nodes. See [setup](../README.md) for more information.__

* Join the swarm as a **manager** node :

```bash
$ docker swarm join \
    --token <generated_token> \
    <@IP_of_leader_master_node>:2377
```

> __Following steps must be done only on every w<sub>x</sub> nodes. See [setup](../README.md) for more information.__

* Join the swarm as a **worker** node :

```bash
$ docker swarm join \
    --token <generated_token> \
    <@IP_of_leader_master_node>:2377
```

## 3. Reverse Proxy

The chosen tool is [_Traefik_](https://traefik.io).

> __Following steps must be done only on on of the m<sub>x</sub> node. See [setup](../README.md) for more information.__

- Deploy the stack :

```bash
$ docker stack deploy -c /mnt/nfs/stacks/docker-stack-proxy.yml proxy
```

## 4. Cluster Management GUI

The chosen tool is [_Portainer_](https://portainer.io).

> __Following steps must be done only on on of the m<sub>x</sub> node. See [setup](../README.md) for more information.__

- Deploy the stack :

```bash
$ docker stack deploy -c /mnt/nfs/stacks/docker-stack-portainer.yml portainer
```

## 5. Private Registry

> __Following steps must be done only on on of the m<sub>x</sub> node. See [setup](../README.md) for more information.__

- Deploy the stack :

```bash
$ docker stack deploy -c /mnt/nfs/stacks/docker-stack-registry.yml registry
```

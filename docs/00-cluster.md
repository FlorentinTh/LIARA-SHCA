# Cluster

## 1. Create the Cluster

> __Following steps must be done only on the ```manager0``` node. See [setup](../README.md) for more information.__

* Initialize a swarm :

```bash
$ docker swarm init \
    --listen-addr <@IP_of_leader_master_node> \
    --advertise-addr <@IP_of_leader_master_node>
```

* Obtain the join command for ```manager``` nodes :

```bash
$ docker swarm join-token manager
```

* Obtain the join command for ```worker``` nodes :

```bash
$ docker swarm join-token worker
```

> __Following steps must be done only on ```manager1``` and ```manager2``` nodes. See [setup](../README.md) for more information.__

* Join the swarm as a **manager** node :

```bash
$ docker swarm join \
    --token <generated_token> \
    <@IP_of_leader_master_node>:2377
```

> __Following steps must be done only on every ```worker``` nodes. See [setup](../README.md) for more information.__

* Join the swarm as a **worker** node :

```bash
$ docker swarm join \
    --token <generated_token> \
    <@IP_of_leader_master_node>:2377
```

> __Following steps must be done only on the ```manager0``` node. See [setup](../README.md) for more information.__

<!-- * create an overlay network :

```bash
docker network create -d overlay \
    --attachable --subnet 10.1.9.0/24 \
    multi-host-net
``` -->

## 2. Reverse Proxy

The chosen tool is [_Traefik_](https://traefik.io).

> __Following steps must be done only on the ```manager0``` node. See [setup](../README.md) for more information.__

* Get the _Traefik_ configuration file :

```bash
$ curl -sSL <link> -o /mnt/nfs/data/traefik/traefik.toml
```

* Get the _Traefik_ deployment file :

```bash
$ curl -sSL <link> -o /mnt/nfs/conf/traefik.yml
```

* Deploy the service stack :

```bash
$ docker stack deploy -c /mnt/nfs/conf/traefik.yml traefik
```

## 3. Cluster Management GUI

The chosen tool is [_Portainer_](https://portainer.io).

> __Following steps must be done only on the ```manager0``` node. See [setup](../README.md) for more information.__

* Get the _Portainer_ deployment file :

```bash
$ curl -sSL <link> -o /mnt/nfs/conf/portainer.yml
```

* Deploy the _Portainer_ service stack :

```bash
$ docker stack deploy -c /mnt/nfs/conf/portainer.yml portainer
```

It will automatically deploy a single instance of the _Portainer_ app, and deploy a _Portainer_ agent as a global service on every node in the cluster.

## 4. Private Registry

> __Following steps must be done only on the ```server``` node. See [setup](../README.md) for more information.__

* Create an authentication file :

```bash
$ htpasswd -Bbn <username> <password> \
    > /mnt/nfs/registry/auth/htpasswd
```

* Get the Registry deployment file :

```bash
$ curl -sSL <link> -o /mnt/nfs/conf/registry.yml
```

* Build and start the container :

_make sure to uncomment commented line beforehand if you want to use SSL._

```bash
$ docker-compose -f "/mnt/nfs/conf/registry.yml" up -d --build
```

## 5. Versioning

The chosen tool is [_GitLab_](https://about.gitlab.com).

> __Following steps must be done only on the ```server``` node. See [setup](../README.md) for more information.__

**_Work in Progress_**

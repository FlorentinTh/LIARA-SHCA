## 2. NFS Server

### 2.1. Prerequisites

<span style="color:red">⚠ on every Raspberry Pi.</span>

* install required dependencies 
```
sudo apt-get install nfs-common -y
```

### 2.2. Create the NFS server

<span style="color:red">⚠ only on the </span> **<span style="color:red">server</span>**<span style="color:red"> node. See [setup](https://github.com/FlorentinTh/PiCluster#setup) for more informations.</span>

* install required dependencies :
```
sudo apt-get install nfs-server -y
```

* if your drive is a NTFS volume install the required driver :
```
sudo apt-get install ntfs-3g -y
```

* create a storage folder :
```
sudo mkdir /media/storage
```

* get external drive informations :
```
sudo fdisk -l
# identify in the outpout the proper partition to use such as /dev/sda2
```



* edit ```fstab``` file as follows :
```
sudo nano /etc/fstab

# add this line to the end of the file :
/dev/sda2 /media/storage  ntfs-3g defaults,rw 0 0
```

* reboot :
```
sudo reboot
```

* create the NFS base folder : 
```
sudo mkdir /media/storage/nfs
sudo chmod 777 /media/storage/nfs
```

* edit ```exports``` file as follows :
```
sudo nano /etc/exports

# add this line to the end of the file :
/media/storage/nfs  192.168.1.0/24(rw,sync,no_subtree_check)
```

* disable NFSv4 :
```
sudo nano /etc/default/nfs-kernel-server

# replace the second line : 
RPCNFSDCOUNT=8
# by : 
RPCNFSDCOUNT="8 --no-nfs-version 4"

# restart the service
sudo systemctl restart nfs-kernel-server
```

* start the NFS server :
```
sudo update-rc.d rpcbind enable
sudo service rpcbind start
sudo exportfs -ra
```

* create required folders used in the rest of this configuration documentation : 
```
mkdir -p /media/storage/nfs/conf
mkdir -p /media/storage/nfs/data/portainer
mkdir -p /media/storage/nfs/data/traefik
mkdir -p /media/storage/nfs/registry/auth
mkdir -p /media/storage/nfs/registry/images
```

* create required files used in the rest of this configuration documentation :
```
# Get the Traefik configuration file :
curl -L https://raw.githubusercontent.com/FlorentinTh/PiCluster/master/conf/traefik/traefik.toml?token=ACX0vSyLB6BgAFvN75b3eMxeM87All5aks5ctJtTwA%3D%3D -o /media/storage/nfs/data/traefik/traefik.toml

# Generate a password to acces the dashboard of trafik. The output needs to be placed on line 16 of the traefil.toml file :
htpasswd -bn <username> <password>

# Get the Portainer deployment file :
curl -L https://raw.githubusercontent.com/FlorentinTh/PiCluster/master/compose-files/portainer.yml?token=ACX0vZWRHs8HvqqU0T67YYj41FA6MsGEks5ctJzuwA%3D%3D -o /media/storage/nfs/conf/portainer.yml

# Get the Registry deployment file :
curl -L https://raw.githubusercontent.com/FlorentinTh/PiCluster/master/compose-files/registry.yml?token=ACX0vYM4faKBGHVzb0DAMOnCHPs4crNrks5ctJ0KwA%3D%3D -o /media/storage/nfs/conf/registry.yml

# Get the Traefik deployment file :
curl -L https://raw.githubusercontent.com/FlorentinTh/PiCluster/master/compose-files/traefik.yml?token=ACX0vQIm-X21O7FuIzKiryTPChZ0ihr8ks5ctJ0gwA%3D%3D -o /media/storage/nfs/conf/traefik.yml
```

### 2.3. Mount NFS storage at boot for clients

<span style="color:red">⚠ on every node except the </span> **<span style="color:red">server</span>**<span style="color:red"> one. See [setup](https://github.com/FlorentinTh/PiCluster#setup) for more informations.</span>

* create mount point folder :
```
mkdir /nfs
```

* edit ```rc.local``` file as follows :
```
sudo nano /etc/rc.local

# add this line just before the exit 0 at the end of the file :

mount <@ip_of_server_node>:/media/storage/nfs /nfs
```

* reboot to take effect :
```
sudo reboot
```

### TEST

```
sudo nano /etc/exports
/media/storage/nfs  192.168.1.0/24(rw,all_squash,nohide,async,no_subtree_check,insecure)

sudo exportfs -ra
sudo systemctl enable rpcbind
sudo systemctl enable nfs-kernel-server
sudo rm /lib/systemd/system/nfs-common.service
sudo systemctl daemon-reload
sudo systemctl enable nfs-common
sudo systemctl start rpcbind
sudo systemctl start nfs-kernel-server
sudo systemctl start nfs-common

sudo mkdir /nfs
sudo chown admin:admin /nfs

sudo nano /etc/idmapd.conf
[Mapping]
Nobody-User = admin
Nobody-Group = admin

sudo mount 192.168.1.30:/media/storage/nfs /nfs

sudo nano /etc/fstab
192.168.1.30:/media/storage/nfs /nfs nfs rw 0 0
```

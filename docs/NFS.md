## 2. NFS Server
---

### 2.1. Prerequisites

* install required dependencies 
```
sudo apt-get intall nfs-common
```

### 2.2. Create the NFS server

<span style="color:red">⚠ only on the </span> **<span style="color:red">server</span>**<span style="color:red"> node. See [setup](https://github.com/FlorentinTh/PiSwarm#setup) for more informations.</span>

* install required dependencies :
```
sudo apt-get intall nfs-server
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
/dev/sda2 /media/storage  ntfs-3g defaults,uid=1001,gid=1001,dmask=002,fmask=113,rw 0 0

# uid and gid values are obtained through this command :
id <username>
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

* start the NFS server :
```
sudo update-rc.d rpcbind enable
sudo service rpcbind start
sudo exportfs -ra
```

* create required folders used in the rest of this configuration documentation : 
```
mkdir -p /media/storage/nfs/registry/images
mkdir -p /media/storage/nfs/registry/auth
mkdir -p /media/storage/nfs/certs
mkdir -p /media/storage/nfs/data/portainer
```
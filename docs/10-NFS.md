# Network File System

> If needed, it is possible to refer to [Annex B.](90-disk-management.md) in order to format an external drive.

## 1. Prerequisites

> __The following step must be done on every nodes.__

* Install required dependencies :

```bash
$> sudo apt-get install -y nfs-common
```

## 2. NFS Server

> __Following steps must be done only on the ```server``` node. See [setup](../README.md) for more information.__

### 2.1. Initialization

* Install required dependencies :

```bash
$> sudo apt-get install -y nfs-kernel-server rpcbind
```

* Prepare the required NFS directory :

```bash
$> sudo mkdir -p /mnt/nfs
$> sudo mount /dev/sda1 /mnt/nfs
$> sudo chown -R <username>:<username> /mnt/nfs
$> sudo chmod 755 /mnt/nfs
$> sudo find /mnt/nfs/* -type d -exec chmod 755 {} \;
$> sudo find /mnt/nfs/* -type f -exec chmod 644 {} \;
```

* Create required folders used in the rest of this configuration documentation :

```bash
$> mkdir -p /mnt/nfs/conf \
    /mnt/nfs/data/portainer \
    /mnt/nfs/data/traefik \
    /mnt/nfs/registry/auth \
    /mnt/nfs/registry/images
```

* Download required files used in the rest of the configuration :

```bash
# TODO Here!
```

* Mount the partition at boot :

```bash
$> sudo nano /etc/fstab

# add this line to the end of the file :
/dev/sda1 /mnt/nfs ext4 defaults,noatime 0 0

# FlOS :
$> sudo nano /boot/firmware/cmdline.txt

# Raspbian :
$> sudo nano /boot/cmdline.txt

# append this after the rootwait parameter :
rootdelay=10
```

### 2.2. Creation & Configuration

* Identify the user's uid and gid :

```bash
$> id <username>
```

* Configure the NFS server :

```bash
$> sudo nano /etc/exports

# add this line at the end of the file :
/mnt/nfs <gateway_@IP>/24(rw,all_squash,nohide,insecure,async,no_subtree_check,anonuid=<user_id>,anongid=<user_gid>)
```

* Export the config, enable the services on boot and start NFS:

```bash
$> sudo exportfs -ra
$> sudo systemctl enable rpcbind
$> sudo systemctl enable nfs-kernel-server
$> sudo rm /lib/systemd/system/nfs-common.service
$> sudo systemctl daemon-reload
$> sudo systemctl enable nfs-common
$> sudo systemctl start rpcbind
$> sudo systemctl start nfs-kernel-server
$> sudo systemctl start nfs-common
```

> **The following step is optional :**

* Disable NFSv4 :

```bash
$> sudo nano /etc/default/nfs-kernel-server

# replace the second line :
RPCNFSDCOUNT=8
# by :
RPCNFSDCOUNT="8 --no-nfs-version 4"

# restart the service
$> sudo systemctl restart nfs-kernel-server
```

## 3. NFS Clients

> __Following steps must be done on every nodes except the ```server``` node. See [setup](../README.md) for more information.__

> If needed, it is possible to get the NFS version through the following command : ```nfsstat -m```

* Prepare the NFS mounting point folder :

```bash
$> sudo mkdir -p /mnt/nfs
$> sudo chown <username>:<username> /mnt/nfs
```

* Edit the mapping user :

```bash
$> sudo nano /etc/idmapd.conf

# replace :
[Mapping]

Nobody-User = nobody
Nobody-Group = nogroup

# by :
[Mapping]

Nobody-User = <username>
Nobody-Group = <username>
```

* Mount the NFS share to the mountpoint and enable mounting at boot :

```bash
$> sudo mount <NFS_server_@IP>:/mnt/nfs /mnt/nfs

$> sudo nano /etc/fstab

# add this line at the end of the file :
<NFS_server_@IP>:/nfs /mnt/nfs nfs rw 0 0
```

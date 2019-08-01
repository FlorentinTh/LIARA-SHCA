# Annex B. - Disk Management

* Install parted :

```bash
$ sudo apt-get install -y parted
```

* List all drives and identify yours :

```bash
$ lsblk --fs
```

* Partition the drive :

```bash
$ sudo parted /dev/sda mklabel gpt
```

* Create a new partition :

```bash
$ sudo parted -a opt /dev/sda mkpart primary ext4 0% 100%
```

* Create file system on the new partition :

```bash
$ sudo mkfs.ext4 -L <partition_name> /dev/sda1
```

* Rename the partition _(if needed)_ :

```bash
$ sudo e2label  /dev/sda1 <new_partition_name>
```

* Create a folder to be the mounting point :

> __⚠ for testing only, incompatible with NFS configuration !__

```bash
$ sudo mkdir -p /mnt/<partition_name>
```

* Mount the filesystem :
  
> __⚠ for testing only, incompatible with NFS configuration !__

```bash
$ sudo mount -o defaults /dev/sda1 /mnt/<partition_name>
```

* Automatically mount the filesystem at boot:

> __⚠ for testing only, incompatible with NFS configuration !__

```bash
$ sudo nano /etc/fstab
# add this line to the end of the file :
/dev/sda1 /mnt/<partition_name> ext4 defaults 0 2
```

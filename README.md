# Raspberry Pi Cluster Architecture (Docker Swarm)

## Step#0 - Prerequisites 🔰
---
Download the latest Raspbian operating system image [here](https://www.raspberrypi.org/downloads/raspbian/). The client require desktop version while boards that are part of the Swarm cluster require the light version. 

### Initial configuration 🔨

* access to the configuration panel by using : 
```
sudo raspi-config
```

* change default raspberry password for user "pi"
* change hostname
* enable ssh

### Wi-Fi ⛔
If needed, a Wi-Fi connection can be configured. However, it is highly recommended for each raspberry pi that is a part of the Swarm cluster to stay in a local network environment. 

* edit configuration file :
```
sudo nano /etc/wpa_supplicant/wpa_supplicant.conf
```

* set following configuration : 
```
network={
    ssid="your_ssid_here"
    scan_ssid=1
    psk="your_password_here"
}
```

* reconfigure the interface with : 
```
sudo wpa_cli -i wlan0 reconfigure 
```
_The output of the command should be **OK**_.

### Updates ⌚

```
sudo apt-get update && sudo apt-get dist-upgrade -y
```

### Tools 🔨

```
sudo apt-get update && sudo apt-get dist-upgrade -y
```

## Step#1 - Disable swap 🚫
***
❌ **_The client device does not require swap to be disabled_**.

✔ **_Each node of the Swarm cluster including master one require swap to be disabled._**
***
``` 
sudo dphys-swapfile swapoff
sudo dphys-swapfile uninstall
sudo update-rc.d dphys-swapfile remove
``` 
* edit configuration file : 
```
sudo nano /boot/cmdline.txt
```
* add following text at the end of the existing linge without create any new line : 
```
cgroup_enable=cpuset cgroup_memory=1 cgroup_enable=memory
```
* reboot 
```
sudo reboot
``` 

## Step#2 - Install Docker 🐳
***
❌ **_The client device does not require docker to be installed._**

✔ **_Each node of the Swarm cluster including master one require Docker to be installed._**
***
```
curl -sSL get.docker.com | sh
sudo usermod pi -aG docker 
newgrp docker
```

## Step#3 - Create the Swarm 🌊

***
**⚠ _Only on master node_**
*** 
run the following command to init the swarm :
```
docker swarm init --advertise-addr <@ip_of_master_node>
```
if you want to add a worker node later, run following command :
```
docker swarm join-token worker
```
if you want to add a manager node later, run following command :
```
docker swarm join-token manager
```
***
**⚠ _Only on worker nodes_**
*** 
Run the following command to join the swarm :
```
docker swarm join --token <generated_token> <@ip_of_master_node>:2377
```

## Step#4 - Deploy a Swarm Administration GUI 👑

***
**⚠ _Only on master node_**
*** 
* run the following command to get the [portainer](www.portainer.io) compose file :
```
 curl -L https://downloads.portainer.io/portainer-agent-stack.yml -o portainer-agent-stack.yml
```
* deploy the stack through : 
```
docker stack deploy --compose-file=portainer-agent-stack.yml portainer
```
_It will automatically deploy a single instance of the Portainer Server, and deploy the Portainer Agent as a global service on every node in the cluster_
* Get access to the GUI through a browser : 
```
http://@IP_of_master_node:9000
```

## Optionnal steps 
### Overclocking 🚀
***
**⚠ Overclocking Raspberry pis can cause hardware damages. Do it at your own risk.**
***
* edit configuration file :
```
sudo nano /boot/config.txt 
```

* for node without GUI set the following configuration : 
```
gpu_mem=16
arm_freq=1350
over_voltage=4
sdram_freq=500
core_freq=500
disable_splash=1
```
* for node with a GUI set the following configuration : 
```
gpu_mem=400
arm_freq=1350
over_voltage=5
sdram_freq=500
core_freq=500
gpu_freq=400
```
* reboot 
```
sudo reboot
``` 
 
### Enable ZRAM Optimization ⏱
***
❌ **_Each node of the Swarm cluster including master one do not require ZRAM to be enabled._**

✔ _Only usefull for client raspberry optimization._
***
* create the script : 
```
sudo nano /usr/bin/zram.sh
```
* insert following content : 
```
#!/bin/bash
cores=$(nproc --all)
modprobe zram num_devices=$cores

swapoff -a

totalmem=`free | grep -e "^Mem:" | awk '{print $2}'`
mem=$(( ($totalmem / $cores)* 1024 ))

core=0
while [ $core -lt $cores ]; do
  echo $mem > /sys/block/zram$core/disksize
  mkswap /dev/zram$core
  swapon -p 5 /dev/zram$core
  let core=core+1
done
```
* make it executable : 
```
sudo chmod +x /usr/bin/zram.sh
```
* run the script automatically after boot by editing file : 
```
sudo nano /etc/rc.local
```
* insert the following command before ```exit 0``` :
```
/usr/bin/zram.sh $
```
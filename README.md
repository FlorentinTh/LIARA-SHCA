# Raspberry Pi Cluster Architecture
---

Main repository of the raspberry pi cluster deployed as part of one of my Ph. D. thesis projects. 

#

![network-scheme.jpg](/assets/images/network-scheme.jpg "network-scheme")

### Prerequisites

Download the latest Raspbian operating system images [here](https://www.raspberrypi.org/downloads/raspbian/). Every node require the **light version**.

### Authors

* [**Florentin Thullier**](https://github.com/FlorentinTh) - 2019

### Documentation
**Table of Contents**
- [1. Initial configuation](https://github.com/FlorentinTh/PiSwarm/blob/master/docs/initial-config.md#11-initialisation)
   - [1.1. Initialisation](https://github.com/FlorentinTh/PiSwarm/blob/master/docs/initial-config.md#11-initialisation) 
   - [1.2. Static IP address configuration](https://github.com/FlorentinTh/PiSwarm/blob/master/docs/initial-config.md#12-setup-static-ip-addresses) 
   - [1.3. New user creation](https://github.com/FlorentinTh/PiSwarm/blob/master/docs/initial-config.md#13-create-de-new-user) 
   - [1.4 Wi-Fi configuration](https://github.com/FlorentinTh/PiSwarm/blob/master/docs/initial-config.md#14-configure-wi-fi) 
   - [1.5 Updates and tools](https://github.com/FlorentinTh/PiSwarm/blob/master/docs/initial-config.md#15-install-updates-and-required-tools) 
   - [1.6 Swap disabling](https://github.com/FlorentinTh/PiSwarm/blob/master/docs/initial-config.md#16-disable-swap)
- [2. NFS Server](https://github.com/FlorentinTh/PiSwarm/blob/master/docs/NFS.md#2-nfs-server)
  - [2.1 Prerequisites](https://github.com/FlorentinTh/PiSwarm/blob/master/docs/NFS.md#21-prerequisites)
  - [2.2 Create the NFS server](https://github.com/FlorentinTh/PiSwarm/blob/master/docs/NFS.md#22-create-the-nfs-server)
- [3. Docker](https://github.com/FlorentinTh/PiSwarm/blob/master/docs/docker.md#2-docker)
   - [3.1. Docker Installation](https://github.com/FlorentinTh/PiSwarm/blob/master/docs/docker.md#21-install-docker)
   - [3.2. Docker Compose & Docker Machine installation](https://github.com/FlorentinTh/PiSwarm/blob/master/docs/docker.md#22-install-docker-compose)
   - [3.3. Swarm creation](https://github.com/FlorentinTh/PiSwarm/blob/master/docs/docker.md#23-create-the-swarm)
   - [3.4. GUI Swarm manager deployment](https://github.com/FlorentinTh/PiSwarm/blob/master/docs/docker.md#24-deploy-a-gui-to-manage-the-swarm)
   - [3.5. Private registry deployment](https://github.com/FlorentinTh/PiSwarm/blob/master/docs/docker.md#25-deploy-a-private-registry)
- [4. Optimization](https://github.com/FlorentinTh/PiSwarm/blob/master/docs/optimization.md#3-optimization)
    - [4.1. Overclocking](https://github.com/FlorentinTh/PiSwarm/blob/master/docs/optimization.md#31-overclocking)
    - [4.2. ZRAM Optimization](https://github.com/FlorentinTh/PiSwarm/blob/master/docs/optimization.md#32-zram-optimization)

### Docker containers

* [**example**]()
  > description
* [**example**]()
  > description

### License

This project is licensed under the Apache-2.0 License - see the [LICENSE.md](LICENSE) file for details
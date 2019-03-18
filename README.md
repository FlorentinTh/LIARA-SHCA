# Raspberry Pi Cluster Architecture
---

### Setup

![network-scheme.jpg](/assets/images/network-scheme.jpg "Philadelphia's Magic Gardens")

### Prerequisites

Download the latest Raspbian operating system image [here](https://www.raspberrypi.org/downloads/raspbian/). Every node require the light version with the exception of the client node that can run a desktop version.

### Table of Contents
- [Initial configuation](https://github.com/FlorentinTh/PiSwarm/blob/master/docs/initial-config.md#11-initialisation)
   - [Initialisation](https://github.com/FlorentinTh/PiSwarm/blob/master/docs/initial-config.md#11-initialisation) 
   - [Static IP address configuration](https://github.com/FlorentinTh/PiSwarm/blob/master/docs/initial-config.md#12-setup-static-ip-addresses) 
   - [New user creation](https://github.com/FlorentinTh/PiSwarm/blob/master/docs/initial-config.md#13-create-de-new-user) 
   - [Wi-Fi configuration](https://github.com/FlorentinTh/PiSwarm/blob/master/docs/initial-config.md#14-configure-wi-fi) 
   - [Updates and tools](https://github.com/FlorentinTh/PiSwarm/blob/master/docs/initial-config.md#15-install-updates-and-required-tools) 
   - [Swap disabling](https://github.com/FlorentinTh/PiSwarm/blob/master/docs/initial-config.md#16-disable-swap) 
- [Docker](https://github.com/FlorentinTh/PiSwarm/blob/master/docs/docker.md#2-docker)
   - [Docker Installation](https://github.com/FlorentinTh/PiSwarm/blob/master/docs/docker.md#21-install-docker)
   - [Docker Compose installation](https://github.com/FlorentinTh/PiSwarm/blob/master/docs/docker.md#22-install-docker-compose)
   - [Swarm creation](https://github.com/FlorentinTh/PiSwarm/blob/master/docs/docker.md#23-create-the-swarm)
   - [GUI Swarm manager deployment](https://github.com/FlorentinTh/PiSwarm/blob/master/docs/docker.md#24-deploy-a-gui-to-manage-the-swarm)
   - [Private registry deployment](https://github.com/FlorentinTh/PiSwarm/blob/master/docs/docker.md#25-deploy-a-private-registry)
- [Optimization](https://github.com/FlorentinTh/PiSwarm/blob/master/docs/optimization.md#3-optimization)
    - [Overclocking](https://github.com/FlorentinTh/PiSwarm/blob/master/docs/optimization.md#31-overclocking)
    - [ZRAM Optimization](https://github.com/FlorentinTh/PiSwarm/blob/master/docs/optimization.md#32-zram-optimization)
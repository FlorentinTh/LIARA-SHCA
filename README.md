# Raspberry Pi Cluster Architecture
---

### Setup

![network-scheme.jpg](/assets/images/network-scheme.jpg "Philadelphia's Magic Gardens")

### Prerequisites

Download the latest Raspbian operating system image [here](https://www.raspberrypi.org/downloads/raspbian/). Every node require the light version with the exception of the client node that can run a desktop version.

### Table of Contents
- [Initial configuation]()
   - [Initialisation]() 
   - [Static IP address configuration]() 
   - [New user creation]() 
   - [Wi-Fi configuration]() 
   - [Updates and tools]() 
   - [Swap disabling]() 
- [Docker]()
   - [Docker Installation]()
   - [Docker Compose installation]()
   - [Swarm creation]()
   - [GUI Swarm manager deployment]()
   - [Private registry deployment]()
- [Optimization]()
    - [Overclocking]()
    - [ZRAM Optimization]()
# Raspberry Pi Cluster Architecture
---

### Setup

![network-scheme.jpg](/assets/images/network-scheme.jpg "Philadelphia's Magic Gardens")

### Prerequisites

Download the latest Raspbian operating system image [here](https://www.raspberrypi.org/downloads/raspbian/). Every node require the light version with the exception of the client node that can run a desktop version.

### Table of Contents
=
- 1. [Initial configuation]()
   - 1.1 [Initialisation]() 
   - 1.2 [Static IP address configuration]() 
   - 1.3 [New user creation]() 
   - 1.4 [Wi-Fi configuration]() 
   - 1.5 [Updates and tools]() 
   - 1.6 [Swap disabling]() 
- 2. [Docker]()
   - 2.1. [Docker Installation]()
   - 2.2. [Docker Compose installation]()
   - 2.3. [Swarm creation]()
   - 2.4. [GUI Swarm manager deployment]()
   - 2.5. [Private registry deployment]()
- 3. [Optimization]()
    - 3.1 [Overclocking]()
    - 3.2 [ZRAM Optimization]()
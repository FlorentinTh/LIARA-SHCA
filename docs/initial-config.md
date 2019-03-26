## 1. Initial Configuation

### 1.1. Initialisation

* access to the configuration panel by using : 
```
sudo raspi-config
```
* change hostname
* change local & time zone
* enable ssh

### 1.2. Setup static IP addresses
* edit the following file : 
```
sudo nano /etc/dhcpcd.conf
```
* add the following lines to the end of the file : 
```
interface <eth0|wlan0>
static ip_address=<your_@IP_here>/24
static routers=<@IP_of_the_router>
static domain_name_servers=<@IP_of_the_router>
```
* restart the network service : 
```
 sudo /etc/init.d/networking restart
```

### 1.3. Create de new user
* switch to root user : 
```
sudo -i
```
* create a new user as a sudoer : 
```
adduser <new_username>
adduser <new_username> sudo
``` 
* logout from root user, login with the new one and delete the default pi user : 
```
sudo deluser pi
```
* lock root account password :
```
sudo passwd -l root
```
* remove pi user home folder :
```
sudo rm -Rfv /home/pi/
```

### 1.4. Configure Wi-Fi
If needed, a Wi-Fi connection can be configured.

* edit configuration file :
```
sudo nano /etc/wpa_supplicant/wpa_supplicant.conf
```

* set the following configuration : 
```
network={
    ssid="<your_ssid_here>"
    scan_ssid=1
    psk="<your_password_here>"
}
```

* reconfigure the interface with : 
```
sudo wpa_cli -i wlan0 reconfigure 
```
_The output of the command should be **OK**_.

### 1.5. Install updates and required tools

```
sudo apt-get update && sudo apt-get -y dist-upgrade

sudo apt-get install -y git apache2-utils
```

### 1.6. Disable swap

* execute the following commands :
``` 
sudo dphys-swapfile swapoff
sudo dphys-swapfile uninstall
sudo update-rc.d dphys-swapfile remove
``` 
* edit configuration file : 
```
sudo nano /boot/cmdline.txt
```
* add following text at the end of the existing line without create any new line : 
```
cgroup_enable=cpuset cgroup_memory=1 cgroup_enable=memory
```
* reboot 
```
sudo reboot
``` 
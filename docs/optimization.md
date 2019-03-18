## 3. Optimization
---

### 3.1 Overclocking
**<span style="color:red">⚠ Overclocking a Raspberry Pi board can cause hardware damages. Do it at your own risk.</span>**

* edit configuration file :
```
sudo nano /boot/config.txt 
```

* for nodes without GUI set the following configuration : 
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
* reboot to take effect :
```
sudo reboot
``` 

### 3.2 ZRAM Optimization

**<span style="color:red">⚠ only required for nodes with a GUI. </span>**

* get the script : 
```
sudo curl -L https://raw.githubusercontent.com/FlorentinTh/PiSwarm/master/scripts/zram.sh?token=ACX0veOpYgtZu3It2q6lCEWBiUc3W1tRks5cmVWhwA%3D%3D -o /usr/bin/zram.sh
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
/usr/bin/zram.sh &
```
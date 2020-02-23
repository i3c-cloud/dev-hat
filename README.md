## i3cSmartHome

i3c-Cloud project for smartHome platform


### Containers:
msn - master service node (based on Home Assistant with separate wifi sub-net accessPoint "shMSN")

### Getting started

- download ubuntu/arm/pi image from network:

	cd /tmp

	wget http://cdimage.ubuntu.com/releases/18.04.4/release/ubuntu-18.04.4-preinstalled-server-arm64+raspi3.img.xz?_ga=2.94612191.298164627.1582360443-1009829635.1573847699 -O ubuntuPiHatBaseImg.img.xz


- check You device name using below command:

lsblk | grep -e disk -e part

(PAY ATTENSION TO CHOOSE CORRECT ONE OR YOU CAN CLEAR YOUR SYSTEM DISK !)

#printf "Choosed device:$diskName\n"

	diskName=Your disk name
	xzcat ubuntuPiHatBaseImg.img.xz | sudo dd of=/dev/$diskName bs=32M
	sync
	
	ie:
	cd /tmp
	xzcat ubuntuPiHatBaseImg.img.xz | sudo dd of=/dev/mmcblk0 bs=32M
	sync


- boot pi, connect to 22 using ssh/ubuntu/ubuntu
- run below command on pi:

	cd /usr/local/bin && sudo rm -f ubuntuPiInitLocalMSN.sh && sudo wget https://raw.githubusercontent.com/i3c-cloud/dev-hat/master/ubuntuPiInitLocalMSN.sh &&  bash ubuntuPiInitLocalMSN.sh

### refs:

https://www.raspberrypi.org/documentation/configuration/wireless/access-point.md

https://lb.raspberrypi.org/forums/viewtopic.php?t=211542 (both client/ap)

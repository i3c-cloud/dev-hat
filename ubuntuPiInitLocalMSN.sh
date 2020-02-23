scriptName=initLocalMSN
userName=ubuntu
if [ ! -e /opt/initLocalMSN.xrdp.installed ]; then
stage="=== [$scriptName] === Update'ing / Upgrade'ing local system platform ..."
printf $stage
sudo apt-get -y update
sudo apt-get -y full-upgrade

stage="=== [$scriptName] === Installing xdrp ..."
printf $stage 
sudo apt-get -y install xrdp x11-xserver-utils xorgxrdp

stage="=== [$scriptName] === Installing cinnamon-desktop ..."
printf $stage 
#sudo add-apt-repository universe
#$ sudo apt install cinnamon-desktop-environment lightdm
sudo apt-get -y install desktop-base cinnamon

stage="=== [$scriptName] === Configure cinnamon-session ..."
printf $stage
sudo update-alternatives --config x-session-manager
sudo apt -y install lightdm
echo env -u SESSION_MANAGER -u DBUS_SESSION_BUS_ADDRESS cinnamon-session>~/.xsession

echo 'echo "export CINNAMON_2D=true" >> /etc/profile' | sudo bash

gsettings get org.gnome.desktop.background picture-uri
gsettings set org.gnome.desktop.background picture-uri 'file:///usr/share/backgrounds/linuxmint/default_background.jpg'
sudo mkdir -p /usr/share/backgrounds/linuxmint/
#todo wget
sudo wget https://oswallpapers.com/wp-content/uploads/2018/09/bookwood_linuxmint.jpg -O /usr/share/backgrounds/linuxmint/default_background.jpg



stage="=== [$scriptName] === Configure cinnamon-session 2 and reboot ..."
printf $stage
sudo update-rc.d xrdp enable
xhost +
#todo: desktop image
#hide network policy monit
echo 'cat >/etc/polkit-1/localauthority.conf.d/03-allow-network-manager.conf << EOF
/etc/polkit-1/localauthority.conf.d/03-allow-network-manager

    polkit.addRule(function(action, subject) {
    if (action.id =="org.freedesktop.NetworkManager.settings.modify.system" &&

       subject.isInGroup ("users")) {
       return polkit.Result.YES;    } 

    });
EOF' | sudo bash

sudo chmod a+x /usr/local/bin/ubuntuPiInitLocalMSN.sh
echo '/bin/bash /usr/local/bin/ubuntuPiInitLocalMSN.sh' >> /etc/rc.local

sudo touch /opt/initLocalMSN.xrdp.installed
sudo reboot
fi # /opt/initLocalMSN.xrdp.installed

if [ ! -e /opt/initLocalMSN.i3c.installed ]; then
	

	
	
#=============== after reboot:
stage="=== [$scriptName] === Installing docker ..."
printf $stage
cd /tmp 
containerdFN=containerd.io_1.2.6-3_arm64.deb
dockerFN=docker-ce_19.03.6~3-0~debian-buster_arm64.deb
dockerCliFN=docker-ce-cli_19.03.6~3-0~debian-buster_arm64.deb
if [ ! -e $containerdFN ]; then
	wget https://download.docker.com/linux/debian/dists/buster/pool/stable/arm64/$containerdFN
fi
if [ ! -e $dockerCliFN ]; then
	wget https://download.docker.com/linux/debian/dists/buster/pool/stable/arm64/$dockerCliFN
fi
if [ ! -e $dockerFN ]; then
	wget https://download.docker.com/linux/debian/dists/buster/pool/stable/arm64/$dockerFN
fi

if [ -e /opt/myfile ]; then
#dpkg -l | grep docker
#dpkg -l | grep container
#TODO (purge packages if needed)

sudo apt-get -y install docker-compose

sudo dpkg -i $containerdFN
sudo dpkg -i $dockerCliFN
sudo dpkg -i $dockerFN


sudo systemctl unmask containerd.service
sudo systemctl enable containerd.service
sudo systemctl start containerd.service

#check containerd service status
#systemctl status containerd.service



#TODO dopracowania tworzenie użytkiwniak
#sudo adduser $userName docker
sudo usermod -a -G docker $userName

sudo systemctl unmask docker
sudo systemctl enable docker
sudo systemctl start docker
#systemctl status docker


sudo chown $userName /home/$userName/.docker

stage="=== [$scriptName] === Installing i3c ..."
printf $stage
sudo mkdir -p /i3c
sudo chmod -R g+w /i3c
curl -sSL https://raw.githubusercontent.com/virtimus/i3c/master/bootstrap.sh | sudo bash

sudo touch /opt/initLocalMSN.i3c.installed
fi

fi


if [ -e /opt/initLocalMSN.i3c.installed ]; then

/i dup msn

fi




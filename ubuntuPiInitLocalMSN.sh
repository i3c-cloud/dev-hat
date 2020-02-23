scriptName=initLocalMSN
userName=ubuntu
if [ ! -e /opt/initLocalMSN.xrdp.installed ]; then
stage="=== [$scriptName] === Update'ing / Upgrade'ing local system platform ..."
printf $stage
sudo apt-get update
sudo apt-get update
sudo apt-get full-upgrade

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
sudo -i
echo "export CINNAMON_2D=true" >> /etc/profile
exit

gsettings get org.gnome.desktop.background picture-uri
gsettings set org.gnome.desktop.background picture-uri 'file:///usr/share/backgrounds/linuxmint/default_background.jpg'
mkdir -p /usr/share/backgrounds/linuxmint/
#todo wget



stage="=== [$scriptName] === Configure cinnamon-session 2 and reboot ..."
printf $stage
update-rc.d xrdp enable
xhost +
#todo: desktop image
touch /opt/initLocalMSN.xrdp.installed
sudo reboot
fi # /opt/initLocalMSN.xrdp.installed

if [ -e /opt/initLocalMSN.i3c.installed ]; then
#=============== after reboot:
stage="=== [$scriptName] === Installing docker ..."
printf $stage
cd /tmp 
containerdFN=containerd.io_1.2.6-3_arm64.deb
dockerFN=docker-ce_19.03.6~3-0~debian-buster_arm64.deb
dockerCliFN=docker-ce-cli_19.03.6~3-0~debian-buster_arm64.deb
wget https://download.docker.com/linux/debian/dists/buster/pool/stable/arm64/$containerdFN
wget https://download.docker.com/linux/debian/dists/buster/pool/stable/arm64/$dockerCliFN
wget https://download.docker.com/linux/debian/dists/buster/pool/stable/arm64/$dockerFN


#dpkg -l | grep docker
#dpkg -l | grep container
#TODO (purge packages if needed)

sudo dpkg -i $containerdFN
sudo systemctl unmask containerd.service
sudo systemctl enable containerd.service
sudo systemctl start containerd.service

#check containerd service status
systemctl status containerd.service

sudo dpkg -i $dockerCliFN

sudo dpkg -i $dockerFN

#TODO dopracowania tworzenie użytkiwniak
#sudo adduser $userName docker
sudo usermod -a -G docker ubuntu

sudo systemctl unmask docker
sudo systemctl enable docker
sudo systemctl start docker
systemctl status docker

sudo apt-get -y install docker-compose
sudo chown $userName /home/$userName/.docker

stage="=== [$scriptName] === Installing i3c ..."
printf $stage
sudo mkdir -p /i3c
sudo chmod -R g+w /i3c
curl -sSL https://raw.githubusercontent.com/virtimus/i3c/master/bootstrap.sh | sudo bash

touch /opt/initLocalMSN.i3c.installed
fi


if [ -e /opt/initLocalMSN.i3c.installed ]; then

/i dup msn

fi



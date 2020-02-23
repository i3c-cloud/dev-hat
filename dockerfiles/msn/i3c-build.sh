
#currently only ubuntu:bionic
#cp $i3cScriptDir/dhcpcd.conf /etc/dhcpcd.conf
if [ ! -e /etc/dnsmasq.conf.orig ]; then
	sudo apt-get update && sudo apt-get -y install dnsmasq hostapd dhcpcd5 && mv /etc/dnsmasq.conf /etc/dnsmasq.conf.orig
	
	cp $i3cScriptDir/dhcpcd.conf /etc/dhcpcd.conf
	cp $i3cScriptDir/dnsmasq.conf /etc/dnsmasq.conf
	cp $i3cScriptDir/hostapd.conf /etc/hostapd/hostapd.conf 
	cp $i3cScriptDir/wifistart /usr/local/bin/wifistart
	cp $i3cScriptDir/../../wifistart /usr/local/bin/wifistart
	chmod a+x /usr/local/bin/wifistart \
	&& echo 'DAEMON_CONF="/etc/hostapd/hostapd.conf"' >> /etc/default/hostapd \
	&& echo '/i dup msn' >> /etc/rc.local
fi




export USERDIR=$uData
#--p 8123:8123
addIParams=true
dParams="-d --privileged --net host \
		--cap-add SYS_ADMIN \
		-v $uData/..:/msndata \
		-v /etc/localtime:/etc/localtime:ro"
		
		
i3cAfter(){
	
	/bin/bash /usr/local/bin/wifistart
	
}

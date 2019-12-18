

dParams="-d -p 6052:6052 -p 8008:8008 \
	--device /dev/ttyUSB0 \
	-v $uData/work:/usr/src/app \
	-v $uData/config:/config"

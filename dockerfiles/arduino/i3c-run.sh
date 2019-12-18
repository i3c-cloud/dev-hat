
if [ -n "$DISPLAY" ]; then
	#noop
	echo "DISPLAY set:$DISPLAY"
else
	idu=$(id -u)
	DISPLAY=$(ps -u $idu -o pid= | while read pid; do cat /proc/$pid/environ 2>/dev/null | tr '\0' '\n' | grep '^DISPLAY=:'; done | grep -o ':[0-9]*' | sort -u)
fi


dParams="-d -e DISPLAY=$DISPLAY --privileged \
    -v $uData/project:/home/arduino/Arduino \
    -v /dev/ttyUSB0:/dev/ttyUSB0 -v /tmp/.X11-unix:/tmp/.X11-unix"


#ps -u $(id -u) -o pid= |     while read pid; do         cat /proc/$pid/environ 2>/dev/null | tr '\0' '\n' | grep '^DISPLAY=:';     done | grep -o ':[0-9]*' | sort -u

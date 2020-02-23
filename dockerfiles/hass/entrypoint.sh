#!/bin/bash

case "$1" in
	startup)

		/usr/local/bin/python3 -m homeassistant --config /config
		
		while true; do
			sleep 1000
		done
		;;
	echo)
		echo "Echo from /entrypoint.sh: ${@:2}"
		;;
	*)
		echo "/r Usage(entrypoint):"	
		echo "======================================"
		echo "docker exec hass /r echo 'Hello World!'"
		;;
esac


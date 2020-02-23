#!/bin/bash

case "$1" in
	startup)
		
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
		echo "docker exec msn /r echo 'Hello World!'"
		;;
esac


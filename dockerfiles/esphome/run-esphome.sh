#!/bin/bash

case "$1" in	
	startup)
		. ${I3C_HOME}/run-startup-before.sh	
		esphome /data/config/ dashboard	
		/usr/bin/docker-entrypoint.sh supervisord &
		. ${I3C_HOME}/run-startup-after.sh		
		while true; do
			sleep 1000
		done
		;;
	echo)
		echo "Echo from /run-esphome.sh: ${@:2}"
		;;
	help)
		echo "Usage(run-esphome):"	
		echo "======================================"
		;;
	*)
		if [ -e /i3c/data/run.sh ]; then
		   . /i3c/data/run.sh "$@"	
		else
			. ${I3C_HOME}/run.sh "$@"
		fi		
		;;		
esac

#!/bin/bash

if [ "$1" == "--get" ]; then
	echo "$(amixer -D pulse sget Master | grep 'Left:' | awk -F'[][]' '{ print $2 }' | tr -d '%')"

elif [ "$1" == "--status" ]; then
	status=$(amixer -D pulse sget Master | grep 'Left:' | awk -F '[][]' '{print $4}')
	echo $status
elif [ "$1" == "--set" ]; then
	echo "TODO"
fi

#!/usr/bin/env bash

get_network_name() {
	ssid=$(nmcli -t -f active,ssid dev wifi | awk -F: '$1=="yes"{print $2}')
	echo "$ssid"
}

get_signal_strength() {
	strength=$(nmcli -t -f active,signal dev wifi | awk -F: '$1=="yes"{print $2}')
	if [ -z "$strength" ]; then
		echo "none"
	else
		echo "$strength"
	fi
}

network() {
	ssid=$(get_network_name)
	if [ -n "$ssid" ]; then
		strength=$(get_signal_strength)
		echo "$ssid($strength%)"
	else
		echo "No Internet"
	fi
}

if [[ "$1" == "--network" ]]; then
	network
elif [[ "$1" == "--signal" ]]; then
	get_signal_strength
fi

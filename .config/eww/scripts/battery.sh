#!/bin/bash

battery() {
	BAT=$(ls /sys/class/power_supply | grep BAT | head -n 1)
	cat /sys/class/power_supply/${BAT}/capacity
}
status() {
	BAT=$(ls /sys/class/power_supply | grep BAT | head -n 1)
	cat "/sys/class/power_supply/${BAT}/status"
}

if [[ "$1" == "--capacity" ]]; then
	battery
elif [[ "$1" == "--status" ]]; then
	status
fi

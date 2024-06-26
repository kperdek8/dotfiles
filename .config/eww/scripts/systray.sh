#!/usr/bin/env bash

# Function to get the initial count of StatusNotifier items
get_initial_count() {
	dbus-send --session --dest=org.kde.StatusNotifierWatcher --type=method_call --print-reply /StatusNotifierWatcher org.freedesktop.DBus.Properties.Get string:"org.kde.StatusNotifierWatcher" string:"RegisteredStatusNotifierItems" | grep "string" | wc -l
}

count=$(get_initial_count)

# Monitor D-Bus for StatusNotifierItem signals
dbus-monitor --session "interface='org.kde.StatusNotifierWatcher'" |
	while read -r signal; do
		if [[ $signal == *"StatusNotifierItemRegistered"* ]]; then
			((count++))
		elif [[ $signal == *"StatusNotifierItemUnregistered"* ]]; then
			((count--))
		fi
		echo $count
	done

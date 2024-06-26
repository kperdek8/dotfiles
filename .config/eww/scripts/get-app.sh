#!/usr/bin/env bash

app() {
	window=$(hyprctl activewindow -j | jq -c .initialTitle | tr -d '"')
	if [[ $window == "null" ]]; then
		echo "Hyprland"
	else
		echo $window
	fi
}

socat -u UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | while read -r line; do
	app
done

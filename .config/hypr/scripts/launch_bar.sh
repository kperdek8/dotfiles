#!/usr/bin/env sh

eww=~/.local/bin/eww

# Launch eww daemon
if [[ -z $(pgrep -x eww) ]]; then
	$eww daemon
fi

$eww open bar

#!/usr/bin/env bash

if ! [[ -z "$1" ]]; then
	if [ -f "$1" ]; then
		hyprctl hyprpaper unload "$HOME/Wallpapers/current.png" >/dev/null
		magick "$1" "$HOME/Wallpapers/current.png" >/dev/null
		hyprctl hyprpaper preload "$HOME/Wallpapers/current.png" >/dev/null &&
			hyprctl hyprpaper wallpaper "eDP-1,$HOME/Wallpapers/current.png" >/dev/null &&
			wal -i "$1" --saturate 0.7 >/dev/null &&
			eww reload >/dev/null
	fi
fi

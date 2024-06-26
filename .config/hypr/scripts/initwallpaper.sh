#!/bin/bash

hyprpaper

if [ -e "${HOME}/.cache/wal/colors" ]; then
	wal -R
else
	wal -i ${HOME}/Wallpapers/current.png -n --saturate 0.7
fi

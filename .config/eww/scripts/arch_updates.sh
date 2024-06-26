#!/usr/bin/env bash

updates() {
	pacman_updates=$(checkupdates 2>/dev/null | wc -l)
	yay_updates=$(yay -Qua 2>/dev/null | wc -l)
	updates=$((pacman_updates + yay_updates))
	echo "$updates"
}
updates

#!/bin/bash

# Some formatting magic
current_brightness=$(cat /sys/class/backlight/intel_backlight/brightness)
max_brightness=$(cat /sys/class/backlight/intel_backlight/max_brightness)
percentage=$(bc -l <<<"scale=2; ($current_brightness / $max_brightness) * 100")
brightness_level=$(printf "%.0f" "$percentage")

echo ${brightness_level}

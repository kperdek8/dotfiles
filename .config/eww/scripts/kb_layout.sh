#!/bin/bash

hyprctl devices -j | jq -r '.keyboards[] | select(.main == true) | .active_keymap'
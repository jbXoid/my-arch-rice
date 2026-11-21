#!/usr/bin/env bash

keymap=$(hyprctl devices | grep "Keyboard at" -m1 -A 4 | grep "active keymap: " | sed -n 's/.*active keymap: //p')
swayosd-client --custom-message "Keyboard: $keymap"

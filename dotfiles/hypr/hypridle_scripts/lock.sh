#!/usr/bin/env bash

# Switching keyboard to English
kbd="$(hyprctl devices -j | jq -r '.keyboards[] | select(.main == true).name')"
hyprctl switchxkblayout "$kbd" 0

exec hyprlock &

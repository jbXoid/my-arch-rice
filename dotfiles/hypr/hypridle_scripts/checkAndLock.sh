#!/usr/bin/env bash
#set -euo pipefail

# 1) Media playing?
if playerctl -a status 2>/dev/null | grep -q Playing; then
  echo "Something is playing"
  exit 0
fi

# 2) Any fullscreen window?
if hyprctl -j clients | jq -e '.[] | select(.fullscreen == true)' >/dev/null; then
  echo "Something is fullscreen"
  exit 0
fi

# 3) Kitty running / focused
focused_class="$(hyprctl -j activewindow | jq -r '.class // empty')"
if [ "$focused_class" = "kitty" ]; then
  echo "Kitty is focused, user possibly running fastfetch 3rd time in a day"
  exit 0
fi

# no blockers -> lock
echo "Seems that user is forgot about computer"
loginctl lock-session

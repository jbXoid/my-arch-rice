#!/usr/bin/env bash
if [ $1 = "1" ]; then
  echo "1" >~/.config/hypr/hypridle_scripts/anyUserInput
else
  echo "0" >~/.config/hypr/hypridle_scripts/anyUserInput
fi

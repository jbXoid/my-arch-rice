#!/usr/bin/env bash

BLANK_DELAY=5 # seconds

isHyprlockRunnning() {
  pgrep -x hyprlock >/dev/null
}

anyUserInput() {
  [[ -r "$HOME/.config/hypr/hypridle_scripts/anyUserInput" ]] || return 1
  [[ $(<"$HOME/.config/hypr/hypridle_scripts/anyUserInput") == "1" ]]
}

screenIsBlanked() {
  return $(hyprctl monitors | grep dpmsStatus: | sed -n "s/.*dpmsStatus: //p")
}

timer_started=0
begin_time=0
while true; do

  if ((timer_started == 0)); then

    if ! screenIsBlanked; then

      echo "Screen isn't blanked"

      if isHyprlockRunnning; then

        echo "Hyprlock is running"

        if ! anyUserInput; then

          echo "No user input, starting timer"

          timer_started=1
          begin_time=$SECONDS

        fi

      fi

    fi

  else

    if ! isHyprlockRunnning; then

      echo "hyprlock isn't running, stopping timer"
      timer_started=0

    elif anyUserInput; then

      echo "user here, stopping timer"
      timer_started=0

    else

      if (($SECONDS - $begin_time >= BLANK_DELAY)); then

        echo "Time is out, blanking"

        timer_started=0
        hyprctl dispatch 'hl.dsp.dpms("off")'

      fi

    fi

  fi

  sleep 0.1

done

#!/bin/bash
hypridle=$(pgrep -x swayidle)
if [ -z $hypridle ]; then
  $HOME/Niri/scripts/swayidle.sh
else
  pkill swayidle
fi

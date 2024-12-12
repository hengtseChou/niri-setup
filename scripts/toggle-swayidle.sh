#!/bin/bash
hypridle=$(pgrep -x swayidle)
if [ -z $hypridle ]; then
  $NIRICONF/scripts/swayidle.sh
else
  pkill swayidle
fi

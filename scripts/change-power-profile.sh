#!/bin/bash
options="power-saver\nbalanced\nperformance"
choice=$(echo -e "$options" | fuzzel --dmenu --lines 3 -w 20 --config $NIRICONF/fuzzel/power-profile.ini)
if [ ! -z "$choice" ]; then
  powerprofilesctl set $choice
fi

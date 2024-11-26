#!/bin/bash
options="power-saver\nbalanced\nperformance"
choice=$(echo -e "$options" | fuzzel --dmenu --lines 3)
if [ ! -z "$choice" ]; then
  powerprofilesctl set $choice
fi

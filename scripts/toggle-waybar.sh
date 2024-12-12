#!/bin/bash
if [ -z $(pidof waybar) ]; then
  waybar -c $NIRICONF/waybar/config -s $NIRICONF/waybar/style.css &
else
  pkill waybar
fi

#!/bin/bash
if [ -z $(pidof waybar) ]; then
	waybar -c $HOME/Niri/waybar/config -s $HOME/Niri/waybar/style.css &
else
	pkill waybar
fi

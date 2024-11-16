#!/bin/bash
action=$1
if [ "$action" == "get" ]; then
	notify-send "power-profiles-daemon" "current active: $(powerprofilesctl get)"
elif [ "$action" == "set" ]; then
	options="power-saver\nbalanced\nperformance"
	choice=$(echo -e "$options" | rofi -dmenu -replace -config $HOME/Niri/rofi/config-power.rasi -i -no-show-icons -l 3 -width 30 -p "Select Power Profile")
	if [ ! -z "$choice" ]; then
		powerprofilesctl set $choice
	fi
fi

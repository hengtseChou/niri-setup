#!/bin/bash
lock="$HOME/Niri/scripts/swaylock.sh"
swayidle -w \
    timeout 300 $lock \
    timeout 350 'niri msg action power-off-monitors' \
    timeout 1800 'systemctl suspend' \
    before-sleep $lock
#!/bin/bash
lock="$NIRICONF/scripts/swaylock.sh"
if [ ! -f $HOME/.local/state/idle-time ]; then
  # Default idle time
  echo "10 minutes" >$HOME/.local/state/idle-time
fi
idle_time=$(cat $HOME/.local/state/idle-time)
case $idle_time in
"5 minutes")
  swayidle -w \
    timeout 300 $lock \
    timeout 420 'niri msg action power-off-monitors' \
    timeout 1800 'systemctl suspend' \
    before-sleep $lock
  ;;
"10 minutes")
  swayidle -w \
    timeout 600 $lock \
    timeout 720 'niri msg action power-off-monitors' \
    timeout 1800 'systemctl suspend' \
    before-sleep $lock
  ;;
"20 minutes")
  swayidle -w \
    timeout 1200 $lock \
    timeout 1500 'niri msg action power-off-monitors' \
    timeout 2400 'systemctl suspend' \
    before-sleep $lock
  ;;
"30 minutes")
  swayidle -w \
    timeout 1800 $lock \
    timeout 2100 'niri msg action power-off-monitors' \
    timeout 3600 'systemctl suspend' \
    before-sleep $lock
  ;;
"infinity") ;;
*) ;;
esac

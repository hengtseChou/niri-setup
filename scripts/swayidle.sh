#!/bin/bash
lock="$NIRICONF/scripts/swaylock.sh"
lock_time=$1
monitor_off_time=$2
suspend_time=$3

swayidle -w \
  timeout $lock_time $lock \
  timeout $monitor_off_time 'niri msg action power-off-monitors' \
  timeout $suspend_time 'systemctl suspend' \
  before-sleep $lock
